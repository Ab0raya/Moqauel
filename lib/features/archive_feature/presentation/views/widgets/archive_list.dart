import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/features/archive_feature/presentation/controller/archive_cubit.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';
import 'archive_item_dialog.dart';

class ArchiveList extends StatelessWidget {
  const ArchiveList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArchiveCubit, ArchiveState>(
      builder: (context, state) {
        if (state is ArchiveAddedSuccessfully) {
          return buildArchiveList(context: context);
        } else {
          return buildArchiveList(context: context);
        }
      },
    );
  }


  buildArchiveList({required BuildContext context}) {
    return  FutureBuilder<List<Map<String, dynamic>>>(
        future: context.read<ArchiveCubit>().fetchArchiveData(),
        builder: (context , snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                ' : ${S.of(context).errorHappened} ${snapshot.error}',
                style: Styles.textStyle24.copyWith(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noArchivedElements,
                style: Styles.textStyle24
                    .copyWith(color: DarkMode.kPrimaryColor),
              ),
            );
          }else{
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  int reversedIndex = snapshot.data!.length - 1 - index;
                  final Map<String, dynamic> archiveData =
                  snapshot.data![reversedIndex];
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          buildArchiveItemDialog(
                            context: context,
                            title: archiveData['title'],
                            value: archiveData['value'],
                            image: archiveData['image'] ,
                          );
                        },
                        borderRadius: BorderRadius.circular(12),
                        splashColor: DarkMode.kPrimaryColor.withOpacity(0.3),
                        child: Container(
                          width: getScreenWidth(context) * 0.55,
                          height: getScreenHeight(context) * 0.05,
                          decoration: BoxDecoration(
                            color: DarkMode.kWhiteColor.withOpacity(0.03),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Text(
                            archiveData['title'] ?? S.of(context).noTitle,
                            style: Styles.textStyle20.copyWith(
                              color: DarkMode.kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: getScreenWidth(context) * 0.1,
                        height: getScreenHeight(context) * 0.05,
                        decoration: BoxDecoration(
                          color: DarkMode.kWhiteColor.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: archiveData['value']));
                          },
                          icon: const Icon(
                            CupertinoIcons.link,
                            color: DarkMode.kPrimaryColor,
                          ),
                        ),
                      ),
                      Container(
                        width: getScreenWidth(context) * 0.1,
                        height: getScreenHeight(context) * 0.05,
                        decoration: BoxDecoration(
                          color: DarkMode.kWhiteColor.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {
                            buildDeleteArchiveDialog(context, () {
                              context.read<ArchiveCubit>().deleteArchive(archiveData['ArchiveItemId']);
                              Navigator.pop(context);
                            });
                          },
                          icon: const Icon(
                            CupertinoIcons.trash_fill,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
    );
  }



  Future<dynamic> buildArchiveItemDialog({
    required BuildContext context,
    required String title,
    required String value,
    required String? image,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: ArchiveItemDialog(title: title, value: value,image: image,),
        );
      },
    );
  }

  void buildDeleteArchiveDialog(BuildContext context, VoidCallback onDelete) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:  Text(S.of(context).deleting),
          content:  Text(S.of(context).confirmDeleteMsg),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:  Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: onDelete,
              child: Text(S.of(context).delete),
            ),
          ],
        );
      },
    );
  }
}

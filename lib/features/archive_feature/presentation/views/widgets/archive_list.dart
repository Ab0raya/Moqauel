import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/features/archive_feature/presentation/controller/archive_cubit.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/styles.dart';
import 'archive_item_dialog.dart';

class ArchiveList extends StatelessWidget {
  const ArchiveList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArchiveCubit()..fetchArchiveData(),
      child: BlocBuilder<ArchiveCubit, ArchiveState>(
        builder: (context, state) {
          if (state is ArchiveFetchingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArchiveFetchingError) {
            return Center(
              child: Text(
                'حدث خطأ أثناء تحميل البيانات',
                style: Styles.textStyle24.copyWith(color: Colors.red),
              ),
            );
          } else if (state is ArchiveFetchedSuccessfully) {
            return buildArchiveList(context: context, data: state.data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildArchiveList({
    required BuildContext context,
    required List<Map<String, dynamic>> data,
  }) {
    final archiveCubit = BlocProvider.of<ArchiveCubit>(context);

    if (data.isEmpty) {
      return Center(
        child: Text(
          'ليس هناك حسابات لعرضها',
          style: Styles.textStyle24.copyWith(color: DarkMode.kPrimaryColor),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Row(
            children: [
              InkWell(
                onTap: () {
                  buildArchiveItemDialog(
                    context: context,
                    title: item['title'],
                    value: item['value'],
                  );
                },
                borderRadius: BorderRadius.circular(12),
                splashColor: DarkMode.kPrimaryColor.withOpacity(0.3),
                child: Container(
                  width: getScreenWidth(context) * 0.6,
                  height: getScreenHeight(context) * 0.05,
                  decoration: BoxDecoration(
                    color: DarkMode.kWhiteColor.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    item['title'] ?? 'لا يوجد عنوان',
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
                    Clipboard.setData(ClipboardData(text: item['value']));
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
                      archiveCubit.deleteArchive(item['ArchiveItemId']);
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

  Future<dynamic> buildArchiveItemDialog({
    required BuildContext context,
    required String title,
    required String value,
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
          child: ArchiveItemDialog(title: title, value: value),
        );
      },
    );
  }

  void buildDeleteArchiveDialog(BuildContext context, VoidCallback onDelete) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('تأكيد الحذف'),
          content: const Text('هل أنت متأكد أنك تريد حذف هذا العنصر؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: onDelete,
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );
  }
}

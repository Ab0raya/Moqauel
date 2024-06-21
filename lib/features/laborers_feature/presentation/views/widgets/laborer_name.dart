import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../controller/laborer_cubit/laborer_cubit.dart';

class LaborerName extends StatelessWidget {
  final int laborerId;

  const LaborerName({
    Key? key,
    required this.laborerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: BlocProvider.of<LaborerCubit>(context).fetchLaborerName(laborerId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              '${S.of(context).errorHappened}: ${snapshot.error}',
              style: Styles.textStyle24.copyWith(color: Colors.red),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              S.of(context).laborerNotFound,
              style: Styles.textStyle24.copyWith(color: DarkMode.kPrimaryColor),
            ),
          );
        } else {
          return Text(
            snapshot.data!,
            style: Styles.textStyle37.copyWith(color: DarkMode.kPrimaryColor),
          );
        }
      },
    );
  }
}

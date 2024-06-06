import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/core/utils/styles.dart';

import '../../controller/laborer_cubit/laborer_cubit.dart';
import 'laborer_card.dart';

class LaborerList extends StatelessWidget {
  const LaborerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaborerCubit, LaborerState>(
      builder: (context, state) {
        if (state is AddLaborerSuccessfully) {
          return _buildLaborerList(context);
        } else {
          return _buildLaborerList(context);
        }
      },
    );
  }

  Widget _buildLaborerList(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: context.read<LaborerCubit>().fetchLaborerData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: Styles.textStyle24.copyWith(color: Colors.red),
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'No laborers to display',
                style:
                    Styles.textStyle24.copyWith(color: DarkMode.kPrimaryColor),
              ),
            ),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                int reversedIndex = snapshot.data!.length - 1 - index;
                final Map<String, dynamic> laborerData =
                    snapshot.data![reversedIndex];
                return LaborerCard(
                    name: laborerData['name'] ?? '',
                    onTap: (){
                      print('navigate');
                      //context.go(AppRouter.homeViewPath, extra: laborerData);
                    },
                    isVisible: true,
                    onAddAttendance: (){},
                );
              },
              childCount: snapshot.data!.length,
            ),
          );
        }
      },
    );
  }
}

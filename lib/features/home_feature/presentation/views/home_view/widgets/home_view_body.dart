import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/features/home_feature/presentation/controller/filter_section_cubit/filter_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/controller/filter_section_cubit/filter_state.dart';

import 'add_account_item.dart';
import 'custom_appbar.dart';
import 'filter_section.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final filterCubit = BlocProvider.of<FilterCubit>(context);
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      (getScreenHeight(context) * 0.01).sh,

                      const CustomAppBar(),
                      (getScreenHeight(context) * 0.05).sh,

                      const FilterSection(),
                      (getScreenHeight(context) * 0.03).sh,

                      const AddAccountItem(),
                    ],
                  ),
                ),
              ),
            ),
            filterCubit.bodyContent[filterCubit.currentIndex],
            SliverToBoxAdapter(
              child: (getScreenHeight(context) * 0.06).sh ,
            ),
          ],
        );
      },
    );
  }
}

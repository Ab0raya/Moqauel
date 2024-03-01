import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/features/home_feature/presentation/widgets/accounts_list.dart';
import 'package:shoghl/features/home_feature/presentation/widgets/add_account_item.dart';
import 'package:shoghl/features/home_feature/presentation/widgets/custom_appbar.dart';
import 'package:shoghl/features/home_feature/presentation/widgets/filter_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: getScreenHeight(context) * 0.01,
                  ),
                  const CustomAppBar(),
                  SizedBox(
                    height: getScreenHeight(context) * 0.05,
                  ),
                   FilterSection(),
                  SizedBox(
                    height: getScreenHeight(context) * 0.03,
                  ),
                  const AddAccountItem(),
                ],
              ),
            ),
          ),
        ),
        const AccountList(),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/features/home_feature/presentation/views/personal_account_view/widgets/personal_account_view_body.dart';

class PersonalAccountView extends StatelessWidget {
  const PersonalAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
         context.go(AppRouter.homeViewPath);
        }, icon: const Icon(CupertinoIcons.back)),
      ),
      body: const SafeArea(child: PersonalAccountViewBody()),
    );
  }
}

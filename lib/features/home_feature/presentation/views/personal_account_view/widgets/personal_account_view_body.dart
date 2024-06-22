import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/features/home_feature/presentation/views/personal_account_view/widgets/property_row.dart';
import 'package:shoghl/features/home_feature/presentation/views/personal_account_view/widgets/theme_icon.dart';
import 'package:shoghl/features/home_feature/presentation/views/personal_account_view/widgets/user_name.dart';
import '../../../../../../generated/l10n.dart';
import 'account_action.dart';
import 'avatar.dart';
import 'custom_divider.dart';
import 'divider_row.dart';
import 'info_container.dart';
import 'info_tile.dart';
import 'language_icon.dart';

class PersonalAccountViewBody extends StatelessWidget {
  const PersonalAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const Avatar(),
          const UserName(),
          PropertyRow(title: S.of(context).properties),
          InfoContainer(
            children: [
              InfoTile(
                leadingText: S.of(context).language,
                children: [
                  const LanguageIcon(asset: 'assets/images/flags/egypt.png'),
                  10.sw,
                  const LanguageIcon(asset: 'assets/images/flags/united-kingdom.png'),
                ],
              ),
              const CustomDivider(),
              InfoTile(
                leadingText: S.of(context).theme,
                children: const [
                  ThemeIcon(color: Colors.red),
                  ThemeIcon(color: Colors.yellow),
                  ThemeIcon(color: Colors.blue),
                  ThemeIcon(color: Colors.white),
                ],
              ),
            ],
          ),
          PropertyRow(title: S.of(context).myAcc),
          InfoContainer(
            children: [
              AccountAction(
                leadingText: S.of(context).editName,
                icon: CupertinoIcons.pen,
              ),
              const CustomDivider(),
              AccountAction(
                leadingText: S.of(context).editAvatar,
                icon: CupertinoIcons.photo_camera_solid,
              ),
            ],
          ),
          const Spacer(),
          const DividerRow(),
        ],
      ),
    );
  }
}




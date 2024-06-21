import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/features/archive_feature/presentation/views/archive_view.dart';
import 'package:shoghl/features/laborers_feature/presentation/views/laborers_view.dart';

import '../../../../../generated/l10n.dart';
import '../../../../home_feature/presentation/views/home_view/widgets/home_view_body.dart';
import '../../../../invoice_feature/presentation/views/invoice_view/invoice_view.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> with WidgetsBindingObserver {
  final BuildContext context;

  BottomNavigationBarCubit(this.context) : super(BottomNavigationBarInitial()) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final isKeyboardVisible = bottomInset > 0.0;
    if (isKeyboardVisible) {
      emit(BottomNavigationBarHidden());
    } else {
      emit(BottomNavigationBarVisible());
    }
  }
  int currentIndex = 0;

  bottomNavBarDataF(BuildContext context){
    return  [
      {
        //S.of(context). how to access context here
        'label': S.of(context).home,
        'icon': CupertinoIcons.home,
        'index': 0,
      },
      {
        'label': S.of(context).laborers,
        'icon': CupertinoIcons.group_solid,
        'index': 1,
      },
      {
        'label': S.of(context).invoice,
        'icon': CupertinoIcons.paperclip,
        'index': 2,
      },
      {
        'label': S.of(context).archive,
        'icon': CupertinoIcons.archivebox_fill,
        'index': 3,
      },
    ];
  }
  List<Map<String, dynamic>> bottomNavBarData = [
    {
      //S.of(context). how to access context here
      'label': "الرئيسية",
      'icon': CupertinoIcons.home,
      'index': 0,
    },
    {
      'label': "الأفراد",
      'icon': CupertinoIcons.group_solid,
      'index': 1,
    },
    {
      'label': "فاتورة",
      'icon': CupertinoIcons.paperclip,
      'index': 2,
    },
    {
      'label': "الأرشيف",
      'icon': CupertinoIcons.archivebox_fill,
      'index': 3,
    },
  ];
  List views = const [
    HomeViewBody(),
    LaborersView(),
    InvoiceView(),
    ArchiveView(),
  ];

  changeItem(int index) {
    currentIndex = index;
    emit(BottomNavigationBarItemTapped());
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/features/laborers_feature/presentation/views/laborers_view.dart';

import '../../../../home_feature/presentation/views/home_view/widgets/home_view_body.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());
  int currentIndex = 0 ;
  List<Map<String, dynamic>> bottomNavBarData = [
    {
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
      'label': "حسابي",
      'icon': CupertinoIcons.person_alt_circle_fill,
      'index': 3,
    },

  ];
  List views = const [
     HomeViewBody(),
     LaborersView(),
     Scaffold(backgroundColor: Colors.green,),
     Scaffold(backgroundColor: Colors.blue,),
  ];
  changeItem(int index){
    currentIndex = index ;
    emit(BottomNavigationBarItemTapped());
  }
}

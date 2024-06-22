import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_feature_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  List onBoardingDate = [
    {
      'index': 0,
      'title': 'الحسابات',
      'Description':
      'سَجِّل معاملاتك سواء مصروفات \nأو مدخولات بالتاريخ و الوقت وشارك PDF بكل التفاصيل',
    },
    {
      'index': 1,
      'title': 'الأفراد',
      'Description': '0',
    },
    {
      'index': 2,
      'title': 'الفاتورة',
      'Description': '0',
    },
    {
      'index': 3,
      'title': 'الأرشيف',
      'Description': '0',
    },
  ] ;
  int currentIndex = 0 ;
  changeIndex(int page){
    currentIndex = page;
    print('index changed $currentIndex');
  }
  OnboardingCubit()
      : super(OnboardingState(
    onBoardingData: [
      {
        'index': 0,
        'title': 'الحسابات',
        'Description':
        'سَجِّل معاملاتك سواء مصروفات \nأو مدخولات بالتاريخ و الوقت وشارك PDF بكل التفاصيل',
      },
      {
        'index': 1,
        'title': 'الأفراد',
        'Description': '0',
      },
      {
        'index': 2,
        'title': 'الفاتورة',
        'Description': '0',
      },
      {
        'index': 3,
        'title': 'الأرشيف',
        'Description': '0',
      },
    ],
    currentPage: 0,
    pageController: PageController(),
  ));

  void setPage(int page) {
    state.pageController.animateToPage(page, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    emit(OnboardingState(onBoardingData: state.onBoardingData, currentPage: page, pageController: state.pageController));
  }
}
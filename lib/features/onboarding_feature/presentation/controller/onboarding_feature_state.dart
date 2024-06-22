import 'package:flutter/material.dart';

class OnboardingState {
  final List<Map<String, dynamic>> onBoardingData;
  final int currentPage;
  final PageController pageController;

  OnboardingState({required this.onBoardingData, required this.currentPage, required this.pageController});
}
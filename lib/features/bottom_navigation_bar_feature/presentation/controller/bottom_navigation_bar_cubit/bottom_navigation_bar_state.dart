part of 'bottom_navigation_bar_cubit.dart';

@immutable
abstract class BottomNavigationBarState {}

class BottomNavigationBarInitial extends BottomNavigationBarState {}

class BottomNavigationBarItemTapped extends BottomNavigationBarState {}

class BottomNavigationBarHidden extends BottomNavigationBarState {}

class BottomNavigationBarVisible extends BottomNavigationBarState {}

part of 'switch_cubit.dart';

@immutable
abstract class SwitchState {}

class SwitchInitial extends SwitchState {}
class SwitchChanged extends SwitchState {}

part of 'username_cubit.dart';

@immutable
sealed class UsernameState {}

final class UsernameInitial extends UsernameState {}
final class UsernameAddedSuccessfully extends UsernameState {}
final class UsernameEditedSuccessfully extends UsernameState {}
final class UserAvatarAddedSuccessfully extends UsernameState {}
final class UserAvatarEditedSuccessfully extends UsernameState {}
final class InitialViewValueInserted extends UsernameState {}

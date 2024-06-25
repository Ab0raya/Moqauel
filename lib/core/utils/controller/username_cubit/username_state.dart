part of 'username_cubit.dart';

@immutable
sealed class UsernameState {}

final class UsernameInitial extends UsernameState {}
final class UsernameLoading extends UsernameState {}
final class UsernameLoadingFailed extends UsernameState {}
final class AvatarLoading extends UsernameState {}
final class AvatarLoadingFailed extends UsernameState {}
final class UsernameAddedSuccessfully extends UsernameState {}
final class UsernameEditedSuccessfully extends UsernameState {}
final class UserAvatarAddedSuccessfully extends UsernameState {}
final class UserAvatarEditedSuccessfully extends UsernameState {}
final class InitialViewValueInserted extends UsernameState {}

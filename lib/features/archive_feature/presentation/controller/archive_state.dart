part of 'archive_cubit.dart';

@immutable
abstract class ArchiveState {}

class ArchiveInitial extends ArchiveState {}

class ArchiveAddingLoading extends ArchiveState {}

class ArchiveAddedSuccessfully extends ArchiveState {}

class ArchiveAddingError extends ArchiveState {}

class ArchiveFetchingLoading extends ArchiveState {}

class ArchiveFetchedSuccessfully extends ArchiveState {
  final List<Map<String, dynamic>> data;

  ArchiveFetchedSuccessfully({required this.data});
}

class ArchiveFetchingError extends ArchiveState {}

part of 'archive_cubit.dart';

@immutable
abstract class ArchiveState {}

class ArchiveInitial extends ArchiveState {}
class ArchiveAddingLoading extends ArchiveState {}
class ArchiveAddedSuccessfully extends ArchiveState {}
class ArchiveAddingError extends ArchiveState {}

class ArchiveDeletingLoading extends ArchiveState {}
class ArchiveDeletingSuccessfully extends ArchiveState {}
class ArchiveDeletingError extends ArchiveState {}

class ArchiveFetchingLoading extends ArchiveState {}

class ArchiveFetchedSuccessfully extends ArchiveState {

}

class ArchiveFetchingError extends ArchiveState {}

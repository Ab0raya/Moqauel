import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoghl/features/archive_feature/data/models/archive_feature_model.dart';
import '../../../../core/SQlite/local_database/local_db.dart';

part 'archive_state.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit() : super(ArchiveInitial());
  LocalDatabase sqlDB = LocalDatabase();

  void addArchive({
    required var formKey,
    required String title,
    required String value,
  }) async {
    emit(ArchiveAddingLoading());
    ArchiveItem archiveItem = ArchiveItem(title: title, value: value);
    int insert = await sqlDB.insertArchiveDate(archiveItem: archiveItem);
    if (insert > 0) {
      emit(ArchiveAddedSuccessfully());

    }
  }

  Future<List<Map<String, dynamic>>> fetchArchiveData() async {
      List<Map<String, dynamic>> data = await sqlDB.getArchiveData();
      emit(ArchiveFetchedSuccessfully(data: data));
      return data;



  }

  Future<void> deleteArchive(int archiveId) async {
    emit(ArchiveDeletingLoading());
    try {
      await sqlDB.deleteArchiveItem(archiveId: archiveId);
      emit(ArchiveDeletingSuccessfully());
      fetchArchiveData();  // Fetch updated data after deletion
    } catch (e) {
      emit(ArchiveDeletingError());
    }
  }
}

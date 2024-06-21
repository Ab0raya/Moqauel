import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shoghl/features/archive_feature/data/models/archive_feature_model.dart';
import '../../../../core/SQlite/local_database/local_db.dart';

part 'archive_state.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit() : super(ArchiveInitial());
  LocalDatabase sqlDB = LocalDatabase();
  File? _image;

  bool imagePicked = false;

  void addArchive({
    required var formKey,
    required String title,
    required String value,
  }) async {
    emit(ArchiveAddingLoading());
    ArchiveItem archiveItem = ArchiveItem(title: title, value: value, image: _image?.path);
    int insert = await sqlDB.insertArchiveDate(archiveItem: archiveItem);
    if (insert > 0) {
      emit(ArchiveAddedSuccessfully());
    }
  }

  Future<List<Map<String, dynamic>>> fetchArchiveData() async {
    return await sqlDB.getArchiveData();
  }

  Future<void> deleteArchive(int archiveId) async {
    emit(ArchiveDeletingLoading());
    try {
      await sqlDB.deleteArchiveItem(archiveId: archiveId);
      emit(ArchiveDeletingSuccessfully());
      fetchArchiveData(); // Fetch updated data after deletion
    } catch (e) {
      emit(ArchiveDeletingError());
    }
  }

  Future<void> getGalleryImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      imagePicked = true;
      emit(ArchiveImagePicked());
    } else {
      print('No image selected.');
    }
  }

  bool isImagePicked() {
    return imagePicked;
  }

  changeIcon(){
    imagePicked = false;
  }
}

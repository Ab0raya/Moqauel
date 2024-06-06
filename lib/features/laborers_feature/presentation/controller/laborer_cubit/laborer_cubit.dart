import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
import '../../../../../core/SQlite/local_database/local_db.dart';


import '../../../data/laborer_model.dart';

part 'laborer_state.dart';

class LaborerCubit extends Cubit<LaborerState> {
  LaborerCubit() : super(LaborerInitial());
  LocalDatabase sqlDB = LocalDatabase();
  String date = DateFormat('yyyy-MM-dd').format(DateTime.now());

  void addLaborer({required String laborerName})async{
    final String addingDate = DateFormat.yMMMd().format(DateTime.now());
    emit(AddLaborerLoading());
     Laborer laborer = Laborer(addingDate: addingDate, name: laborerName);
    int insert = await sqlDB.addLaborer(laborer: laborer);
    if (insert > 0) {
      emit(AddLaborerSuccessfully());
    }
  }

  Future<List<Map<String, dynamic>>> fetchLaborerData() async {
    return await sqlDB.getLaborers();
  }

  Future<void> deleteLaborerWithAttendance(int accountId) async {
    emit(DeleteLaborerLoading());
    try {
      await sqlDB.deleteLaborerWithAttendance(accountId);
      emit(DeleteLaborerSuccessfully());
    } catch (e) {
      emit(DeleteLaborerField());
    }
  }

}

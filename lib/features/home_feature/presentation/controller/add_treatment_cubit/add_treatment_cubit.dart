import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoghl/features/home_feature/data/SQlite/account_database/account_db.dart';
import 'package:shoghl/features/home_feature/data/model/treatment_model.dart';


part 'add_treatment_state.dart';

class AddTreatmentCubit extends Cubit<AddTreatmentState> {
  AddTreatmentCubit() : super(AddTreatmentInitial());
  bool isIncome = true;

  void updateIsIncome(bool value) {
    isIncome = value;
  }
  AccountDatabase sqlDb = AccountDatabase();

  addTreatment({
    required int accId,
    required String title,
    required String time,
    required String details,
    required int cost,
    required bool isIncome,
  }) async
  {
    emit(AddTreatmentLoading());
    Treatment treatment = Treatment(
      title: title,
      time: time,
      details: details,
      cost: cost,
      isIncome: isIncome,
    );
    int treatmentInserted =
        await sqlDb.insertTreatmentData(treatment: treatment, accId: accId);
    if (treatmentInserted > 0) {
      emit(AddTreatmentSuccessfully());
    }
  }

  Future<List<Map<String, dynamic>>> fetchData({required accId}) async {
    return await sqlDb.getTreatmentData(accId: accId);
  }
}

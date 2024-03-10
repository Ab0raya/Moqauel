import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/features/home_feature/data/SQlite/account_database/account_db.dart';
import 'package:shoghl/features/home_feature/data/model/treatment_model.dart';
import 'package:intl/intl.dart';


part 'add_treatment_state.dart';

class AddTreatmentCubit extends Cubit<AddTreatmentState> {
  AddTreatmentCubit() : super(AddTreatmentInitial());

  TextEditingController treatment = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController cost = TextEditingController();
  String hour = DateFormat('hh:mm a').format(DateTime.now());
  final formKey = GlobalKey<FormState>();
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
    fetchTotalExpenses(accId: accId);
    fetchTotalIncome(accId: accId);
    return await sqlDb.getTreatmentData(accId: accId);
  }

  Future<int> fetchTotalIncome({required int accId}) async {
    List<Map<String, dynamic>> treatmentData = await sqlDb.getTreatmentData(
        accId: accId);
    int totalExpenses = 0;
    for (var treatment in treatmentData) {
      if (treatment['isIncome'] != 1) {
        totalExpenses += treatment['cost'] as int;
      }
    }
    return totalExpenses;
  }

  Future<int> fetchTotalExpenses({required int accId}) async {
    List<Map<String, dynamic>> treatmentData = await sqlDb.getTreatmentData(
        accId: accId);
    int totalIncome = 0;
    for (var treatment in treatmentData) {
      if (treatment['isIncome'] == 1) {
        totalIncome += treatment['cost'] as int;
      }
    }
    return totalIncome;
  }

  Future<List<Map<String, dynamic>>> fetchAllData({required accId}) async {
    int totalIncome = await fetchTotalIncome(accId: accId);
    int totalExpenses = await fetchTotalExpenses(accId: accId);
    List<Map<String, dynamic>> treatmentData = await sqlDb.getTreatmentData(
        accId: accId);
    // print('===============res==========================');
    // print('${treatmentData[1]['totalExpenses']}');

    // print('=========================================');
    // print('${[
    //   {'totalIncome': totalIncome,},
    //   {'totalExpenses': totalExpenses,},
    //   {'treatmentData': treatmentData,},
    // ]}');
    // print('=========================================');

    return [
      {'totalIncome': totalIncome,},
      {'totalExpenses': totalExpenses,},
      {'treatmentData': treatmentData,},
    ];
  }


}

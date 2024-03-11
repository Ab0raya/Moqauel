import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import '../../../data/SQlite/account_database/account_db.dart';
import '../../../data/model/account_model.dart';

part 'add_account_state.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  AddAccountCubit() : super(AddAccountInitial());

  AccountDatabase sqlDB = AccountDatabase();

  void addAccount({
    required var formKey,
    required String ownerName,
    required String location,
  }) async {
    final String date = DateFormat.yMMMd().format(DateTime.now());
    emit(AddAccountLoading());
    Account account = Account(
      ownerName: ownerName,
      locationName: location,
      lastEdit: date,
      totalIncome: 0,
      totalExpenses: 0,
    );
    int insert = await sqlDB.insertAccountData(account: account);
    if (insert > 0) {
      emit(AddAccountSuccessfully());
    }
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    return await sqlDB.getAccountData();
  }

  Future<void> deleteAccountWithTreatments(int accountId) async {
    emit(AddAccountLoading());
    try {
      await sqlDB.deleteAccountWithTreatments(accountId);
      emit(AddAccountSuccessfully());
    } catch (e) {
      emit(AddAccountFailed());
    }
  }
}

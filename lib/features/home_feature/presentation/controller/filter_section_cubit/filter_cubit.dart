import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views/widgets/accounts_list.dart';
import '../../views/widgets/expense_list.dart';
import '../../views/widgets/income_list.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  List bodyContent = const [
     AccountList(),
     ExpenseList(),
     IncomeList()
  ];
  int currentIndex = 0;

  FilterCubit() : super(ChangeFilterIndex());

  void selectIndex(int index) {
    currentIndex = index;
    emit(ChangeFilterIndex());
  }
}

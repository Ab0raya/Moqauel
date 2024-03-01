import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/features/home_feature/presentation/controller/filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  int currentIndex = 0;

  FilterCubit() : super(ChangeFilterIndex());

  void selectIndex(int index) {
    currentIndex = index;
    emit(ChangeFilterIndex());
  }
}

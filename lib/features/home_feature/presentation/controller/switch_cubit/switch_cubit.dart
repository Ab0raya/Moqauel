import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchInitial());
  bool isIncome = true;
  changeValue({required bool val}){
    isIncome = val;
    emit(SwitchChanged());
  }
}

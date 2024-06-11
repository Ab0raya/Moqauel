part of 'treatment_cubit.dart';

@immutable
abstract class TreatmentState {}

class TreatmentInitial extends TreatmentState {}

class TreatmentLoading extends TreatmentState {}

class TreatmentSuccessfully extends TreatmentState {}

class TreatmentDeletedSuccessfully extends TreatmentState {}

class TreatmentFailed extends TreatmentState {}

class TreatmentIncomeExpensesLoaded extends TreatmentState {
  final int totalIncome;
  final int totalExpenses;

  TreatmentIncomeExpensesLoaded({required this.totalIncome, required this.totalExpenses});
}

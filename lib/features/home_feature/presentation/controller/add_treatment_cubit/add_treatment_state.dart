part of 'add_treatment_cubit.dart';

@immutable
abstract class AddTreatmentState {}

class AddTreatmentInitial extends AddTreatmentState {}
class AddTreatmentSuccessfully extends AddTreatmentState {}
class AddTreatmentLoading extends AddTreatmentState {}
class AddTreatmentFailed extends AddTreatmentState {}

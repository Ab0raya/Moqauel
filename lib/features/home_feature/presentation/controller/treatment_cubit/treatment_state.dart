part of 'treatment_cubit.dart';

@immutable
abstract class TreatmentState {}

class TreatmentInitial extends TreatmentState {}
class TreatmentSuccessfully extends TreatmentState {}
class TreatmentLoading extends TreatmentState {}
class TreatmentFailed extends TreatmentState {}
class TreatmentDeletedSuccessfully extends TreatmentState {}

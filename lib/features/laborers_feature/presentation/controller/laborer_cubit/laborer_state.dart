part of 'laborer_cubit.dart';

@immutable
sealed class LaborerState {}

final class LaborerInitial extends LaborerState {}

final class AddLaborerSuccessfully extends LaborerState {}
final class AddLaborerField extends LaborerState {}
final class AddLaborerLoading extends LaborerState {}

final class GetLaborerSuccessfully extends LaborerState {}
final class GetLaborerField extends LaborerState {}
final class GetLaborerLoading extends LaborerState {}

final class DeleteLaborerSuccessfully extends LaborerState {}
final class DeleteLaborerField extends LaborerState {}
final class DeleteLaborerLoading extends LaborerState {}

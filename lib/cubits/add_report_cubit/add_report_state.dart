part of 'add_report_cubit.dart';

@immutable
sealed class AddReportState {}

final class AddReportInitial extends AddReportState {}

final class AddReportLoading extends AddReportState {}

final class AddReportSuccsess extends AddReportState {}

final class AddReportFailure extends AddReportState {
  final String errMessage;

  AddReportFailure({required this.errMessage});
}

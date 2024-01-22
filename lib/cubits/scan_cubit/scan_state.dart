part of 'scan_cubit.dart';

@immutable
sealed class ScanState {}

final class ScanInitial extends ScanState {}

final class ScanFailed extends ScanState {
  ScanFailed({required this.errMessage});
  final String errMessage;
}

final class ScanSuccsess extends ScanState {}


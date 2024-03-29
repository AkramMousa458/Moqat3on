part of 'scan_cubit.dart';

@immutable
sealed class ScanState {}

final class ScanInitial extends ScanState {}

final class ScanLoading extends ScanState {}

final class ScanFailed extends ScanState {
  ScanFailed({required this.errMessage});
  final String errMessage;
}

final class ScanSuccsessCamera extends ScanState {}
final class ScanSuccsessGallery extends ScanState {}
final class ScanSuccsessNumber extends ScanState {}

part of 'get_barcodes_cubit.dart';

@immutable
sealed class GetBarcodesState {}

final class GetBarcodesInitial extends GetBarcodesState {}

final class GetBarcodesLoading extends GetBarcodesState {}

final class GetBarcodesSuccess extends GetBarcodesState {}

final class GetBarcodesFailure extends GetBarcodesState {
  final String errMessage;

  GetBarcodesFailure({required this.errMessage});
}


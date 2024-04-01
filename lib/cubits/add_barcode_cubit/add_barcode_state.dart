part of 'add_barcode_cubit.dart';

@immutable
sealed class AddBarcodeState {}

final class AddBarcodeInitial extends AddBarcodeState {}


final class AddBarcodeLoading extends AddBarcodeState {}

final class AddBarcodeSuccess extends AddBarcodeState {}

final class AddBarcodeFailure extends AddBarcodeState {
  final String errMessage;

  AddBarcodeFailure({required this.errMessage});
}

part of 'add_donate_cubit.dart';

@immutable
sealed class AddDonateState {}

final class AddDonateInitial extends AddDonateState {}

final class AddDonateLoading extends AddDonateState {}

final class AddDonateSuccess extends AddDonateState {}

final class AddDonateFailure extends AddDonateState {
  final String errMessage;

  AddDonateFailure({required this.errMessage});
}

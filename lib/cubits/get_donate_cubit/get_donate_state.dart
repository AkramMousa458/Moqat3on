part of 'get_donate_cubit.dart';

@immutable
sealed class GetDonateState {}

final class GetDonateInitial extends GetDonateState {}

final class GetDonateLoading extends GetDonateState {}

final class GetDonateSuccess extends GetDonateState {
  final List<DonateModel> donateList;

  GetDonateSuccess({required this.donateList});
}

final class GetDonateFailure extends GetDonateState {
  final String errMessage;

  GetDonateFailure({required this.errMessage});
}

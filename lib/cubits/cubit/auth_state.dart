
part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class CreateAccountLoadingState extends AuthState {}

final class CreateAccountSccessState extends AuthState {}

final class CreateAccountFailureState extends AuthState {
  final String error;
  CreateAccountFailureState({required this.error});
}


final class ObscureTextState extends AuthState {}

final class SignInLoadingState extends AuthState {}

final class SignInSccessState extends AuthState {}

final class SignInFailureState extends AuthState {
  final String error;
  SignInFailureState({required this.error});
}

 class RestPasswordLoadingState extends AuthState {}

final class RestPasswordSccessState extends AuthState {}

final class RestPasswordFailureState extends AuthState {
  final String error;
  RestPasswordFailureState({required this.error});
}

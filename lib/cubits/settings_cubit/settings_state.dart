part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class SettingsFailure extends SettingsState {
  final String errMessage;
  SettingsFailure({required this.errMessage});
}

final class SettingsSuccess extends SettingsState {}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scanner/helper/work_manager_service.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool activateNotification = true;
  final WorkManagerService workManagerService = WorkManagerService();

  void canelDuaaNotification() {
    try {
      workManagerService.stopNotification();
      activateNotification = false;
      emit(SettingsSuccess());
    } catch (e) {
      emit(SettingsFailure(errMessage: 'Error in cancel notification: $e'));
    }
  }

  void activateDuaaNotification() {
    try {
      workManagerService.init();
      activateNotification = true;
      emit(SettingsSuccess());
    } catch (e) {
      emit(SettingsFailure(errMessage: 'Error in activate notification: $e'));
    }
  }
}

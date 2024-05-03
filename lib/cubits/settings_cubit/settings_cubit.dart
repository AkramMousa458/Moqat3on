import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scanner/helper/shared_preferences.dart';
import 'package:scanner/helper/work_manager_service.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  late bool activateNotification;
  final WorkManagerService workManagerService = WorkManagerService();

  void changeNotificationStatus({required }) async{

  }

  // Future<void> canelDuaaNotification() async {
  //   try {
  //     workManagerService.stopNotification();
  //     Future.wait({
  //       NotificationSharedPreferences.setNotification(false),
  //       getNotificationValue(),
  //     });

  //     emit(SettingsSuccess(false));
  //   } catch (e) {
  //     emit(SettingsFailure(errMessage: 'Error in cancel notification: $e'));
  //   }
  // }

  // Future<void> activateDuaaNotification() async {
  //   try {
  //     workManagerService.init();
  //     Future.wait({
  //       NotificationSharedPreferences.setNotification(true),
  //       getNotificationValue(),
  //     });
  //     emit(SettingsSuccess(true));
  //   } catch (e) {
  //     emit(SettingsFailure(errMessage: 'Error in activate notification: $e'));
  //   }
  // }

  // Future<void> getNotificationValue() async {
  //   activateNotification =
  //       await NotificationSharedPreferences.getNotification() ?? true;
  //   emit(SettingsSuccess(activateNotification));
  // }
}

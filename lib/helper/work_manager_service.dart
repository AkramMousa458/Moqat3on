import 'package:scanner/helper/local_notification_service.dart';
import 'package:scanner/models/duaa_model.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  void _registerDuaaTask() async {
    await Workmanager().registerPeriodicTask(
      'duaaNotification',
      'show notification',
      frequency: const Duration(minutes: 15),
    );
  }

  Future<void> init() async {
    await Workmanager().initialize(_callbackDispatcher);
    _registerDuaaTask();
  }

  void stopNotification() {
    Workmanager().cancelByUniqueName('duaaNotification');
  }
}

@pragma('vm:entry-point')
void _callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    DuaaModel duaaModel = getRandomDuaa();
    LocalNotificationService.showDuaaNotification(duaaModel: duaaModel);
    return Future.value(true);
  });
}

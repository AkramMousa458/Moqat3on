part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}


final class NotificationActivated extends NotificationState {

}

final class NotificationDeactivated extends NotificationState {

}

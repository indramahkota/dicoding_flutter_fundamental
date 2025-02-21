import 'package:dicoding_flutter_fundamental/services/local_notification_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ServicesModule {
  @singleton
  LocalNotificationService localNotificationService() =>
      LocalNotificationService();
}

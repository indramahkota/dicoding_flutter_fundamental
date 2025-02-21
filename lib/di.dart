import 'package:dicoding_flutter_fundamental/services/local_notification_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
  await getIt.allReady();
  await getIt<LocalNotificationService>().configureLocalTimeZone();
}

import 'package:dicoding_flutter_fundamental/persist/services/local_database_service.dart';
import 'package:dicoding_flutter_fundamental/persist/services/shared_preferences_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class PersistModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  LocalDatabaseService database() => LocalDatabaseService();

  @singleton
  SharedPreferencesService preferences(SharedPreferences prefs) =>
      SharedPreferencesService(prefs);
}

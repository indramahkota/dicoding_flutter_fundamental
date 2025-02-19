import 'constant/app_constant.dart';

enum Flavor {
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'EatsEase';
      case Flavor.production:
        return 'EatsEase';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return AppConstant.appBaseUrl;

      case Flavor.production:
        return AppConstant.appBaseUrl;

      default:
        return AppConstant.appBaseUrl;
    }
  }

  static bool get isDebug => appFlavor == Flavor.development;
}

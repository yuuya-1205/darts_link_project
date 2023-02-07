class AdMob {
  /// 本番環境ではfalse,testではtrueにすること
  static bool isTest = true;
  static List<String> testDevices = [];
  static Map<String, Map<String, String>> productionAdIds = {
    'ios': {'banner': 'ca-app-pub-7382961316052725/2388488449'},
    'android': {'banner': 'ca-app-pub-7382961316052725/8159689873'}
  };
  static Map<String, Map<String, String>> testAdIds = {
    'ios': {'banner': 'ca-app-pub-3940256099942544/2934735716'},
    'android': {'banner': 'ca-app-pub-3940256099942544/6300978111'}
  };

  static String? getAdId(String? deviceType, String? adType) {
    if (isTest == true) {
      return testAdIds[deviceType]![adType];
    } else {
      return productionAdIds[deviceType]![adType];
    }
  }
}

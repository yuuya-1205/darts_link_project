import 'dart:convert';

import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:http/http.dart' as http;

class AreaRepository {
  static List<Pref> prefList = [];
  static Map<int, List<City>> cityMap = {};

  static String domain = 'opendata.resas-portal.go.jp';

  static Map<String, String> header = {
    'X-API-KEY': '0oJl8RTUfRePo1vcdGpEiT1PRjGAkEDZe2Ww4W3m'
  };
  static Future<List<Pref>> getPrefsData() async {
    http.Response response = await http.get(
      Uri.https(
        domain,
        'api/v1/prefectures',
      ),
      headers: header,
    );
    final decodedBody = jsonDecode(response.body);

    final List<dynamic> prefsMap = decodedBody['result'];

    final List<Pref> prefs = prefsMap
        .map((e) => Pref(
              code: e['prefCode'],
              name: e['prefName'],
            ))
        .toList();

    prefList = prefs;
    return prefs;
  }

  static Future<void> getCitiesData() async {
    await Future.forEach(prefList, (pref) async {
      http.Response response = await http.get(
        Uri.https(domain, 'api/v1/cities', {'prefCode': pref.code.toString()}),
        headers: header,
      );
      final decodedBody = jsonDecode(response.body);
      final List<dynamic> citiesMap = decodedBody['result'];

      final List<City> cities = citiesMap
          .map((e) => City(
                code: int.parse(e['cityCode']),
                name: e['cityName'],
              ))
          .toList();
      cityMap[pref.code] = cities;
    });
  }
}

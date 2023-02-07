import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert';

class AreaRepository {
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

    return prefs;
  }

  static Future<List<City>> getCitysData(String prefCode) async {
    http.Response response = await http.get(
      Uri.https(domain, 'api/v1/cities', {'prefCode': prefCode}),
      headers: header,
    );
    final decodedBody = jsonDecode(response.body);
    print(decodedBody['result'] is String);
    final List<dynamic> citysMap = decodedBody['result'];

    final List<City> citys = citysMap
        .map((e) => City(
              code: int.parse(e['cityCode']),
              name: e['cityName'],
            ))
        .toList();
    print(citys.length);
    return citys;
  }
}

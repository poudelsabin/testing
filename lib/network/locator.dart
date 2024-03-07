import 'package:event_buddy/network/dio_client.dart';
import 'package:event_buddy/utils/constants/app_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

latDioClient? kClient;
late AppPreference kPref;

void initLocator() async {
  kClient = DioClient();
  var sp = await SharedPreferences.getInstance();
  kPref = AppPreference(sp);
}

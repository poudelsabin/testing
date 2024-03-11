import 'package:event_buddy/network/dio_client.dart';
import 'package:event_buddy/utils/constants/app_prefs.dart';
// import 'package:shared_preferences/shared_preferences.dart';

DioClient kClient = DioClient();
AppPreference kPref = AppPreference();

Future<void> initLocator() async {
  kClient = DioClient();
  // final sp = await SharedPreferences.getInstance();
  // kPref = AppPreference(sp);
}

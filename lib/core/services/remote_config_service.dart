import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static final FirebaseRemoteConfig _rc = FirebaseRemoteConfig.instance;

  static Future<void> init() async {
    // أثناء التطوير خلي minimumFetchInterval قليل علشان تشوف التغييرات فوراً
    await _rc.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 0), // dev only
      ),
    );

    // قيم افتراضيه داخل الابلكيشن (in-app defaults)
    await _rc.setDefaults(<String, dynamic>{
      'welcome_message': 'أهلاً بيك!',
      'new_feature_enabled': false,
      'home_banner_json': '{"title":"Hello","show":false}',
    });

    // احصل على القيم من السيرفر وفعّلها
    try {
      await _rc.fetchAndActivate();
    } catch (e) {
      // لازم تتعامل مع الخطأ (شبكه - ثروتلنج - إلخ)
      print('Remote Config fetch failed: $e');
    }
  }

  static String getString(String key) => _rc.getString(key);
  static bool getBool(String key) => _rc.getBool(key);
  static int getInt(String key) => _rc.getInt(key);
  static double getDouble(String key) => _rc.getDouble(key);
}

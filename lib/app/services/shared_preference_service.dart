import 'package:pipv3/app/services/shared_preference_interface_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends ISharedPreferenceService{
  
  @override
  Future<bool> saveUserAuthData(String refreshToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString("refreshToken", refreshToken);
  }
  
}
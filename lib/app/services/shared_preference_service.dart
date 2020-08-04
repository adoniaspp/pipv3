import 'package:pipv3/app/services/shared_preference_interface_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends ISharedPreferenceService{
  
  SharedPreferences prefs;

  @override
  Future<bool> saveRefreshToken(String refreshToken) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs.setString("refreshToken", refreshToken);
  }

  @override
  Future<String> getRefreshToken(String refreshToken) async{
    prefs = await SharedPreferences.getInstance();
    return prefs.getString("refreshToken");
  }


  
}
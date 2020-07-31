abstract class ISharedPreferenceService
{
  Future<bool> saveUserAuthData(String refreshToken);
}
abstract class ISharedPreferenceService
{
  Future<bool> saveRefreshToken(String refreshToken);
  Future<String> getRefreshToken();
}
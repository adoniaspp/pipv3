abstract class IAuthLoginRepository
{
  Future signin(String user, String password);
  Future refreshToken(String refreshToken, String idphone);
}
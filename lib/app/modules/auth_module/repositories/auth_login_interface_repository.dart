abstract class IAuthLoginRepository
{
  Future signin(String user, String password);
  Future refreshToken(String refreshToken, String idphone);
  Future signUp(String user, String password, String idphone);
}
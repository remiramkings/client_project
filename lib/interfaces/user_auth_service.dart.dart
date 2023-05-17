abstract class UserAuthService{
  Future<bool> login(String email, String password);
  Future logout();
  Future<String?> authenticate();
}
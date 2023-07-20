class LoginRepository {
  Future login() async {
    await Future.delayed(const Duration(seconds: 1));

    throw Exception("Login failed");
  }
}

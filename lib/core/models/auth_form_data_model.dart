enum AuthMode { signup, login }

class AuthFormDataModel {
  String name = '';
  String email = '';
  String password = '';
  AuthMode _mode = AuthMode.login;

  bool get isLogin => _mode == AuthMode.login;

  bool get isSignup => _mode == AuthMode.signup;

  void toggleAuthMode () {
    _mode = isLogin ? AuthMode.signup : AuthMode.login;
  }
}

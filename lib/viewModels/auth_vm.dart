import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import '/services/auth_s.dart' as svAuth;
import '../config/constants.dart' as consts;

class AuthVm {
  String email = '';
  String password = '';
  String loginResultMsg = '';
  final svAuth.AuthService _authService = new svAuth.AuthService();

  Future<void> fbLogin() async {
    try {
      final fbAuth.User? user =
          await this._authService.fbLogin(this.email, this.password);
      this.loginResultMsg = 'Login Success';
    } catch (ex) {
      this.loginResultMsg = consts.ConstErr.login;
    }
  }
}

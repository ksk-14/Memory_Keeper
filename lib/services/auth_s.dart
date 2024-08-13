import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

class AuthService {
  Future<fbAuth.User?> fbLogin(String email, String password) async {
    try {
      final fbAuth.FirebaseAuth auth = fbAuth.FirebaseAuth.instance;
      final fbAuth.UserCredential result =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // 失敗したときはExceptionを確実に流すからNon-nullable
      return result.user!;
    } catch (ex) {
      throw ex;
    }
  }
}

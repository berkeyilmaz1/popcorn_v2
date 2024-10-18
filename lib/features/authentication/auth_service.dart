import 'package:firebase_auth/firebase_auth.dart';
import 'package:popcorn_v2/product/initialize/cache/enum/cache_items.dart';

final class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await fetchUserDetails(_auth.currentUser);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await fetchUserDetails(_auth.currentUser);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await removeTokenFromCache();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Reset Password Error: $e');
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } catch (e) {
      print('Send Email Verification Error: $e');
    }
  }

  Future<void> fetchUserDetails(User? user) async {
    if (user == null) return;
    final token = await user.getIdToken();
    await saveTokenToCache(token ?? '');
  }

  Future<void> saveTokenToCache(String token) async {
    await CacheItems.token.write(token);
  }

  Future<String?> getCachedToken() async {
    final token = CacheItems.token.read;
    return token;
  }

  Future<bool> removeTokenFromCache() {
    return CacheItems.token.delete();
  }

  Future<bool> isUserSignedIn() async {
    final currentUser = _auth.currentUser;
    return currentUser != null;
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}

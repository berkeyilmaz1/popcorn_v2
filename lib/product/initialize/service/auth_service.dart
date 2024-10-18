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

  ///TODO FIX THİS
  Future<bool> logInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) return false;

      await fetchUserDetails(userCredential.user);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e.message);
      }
    } catch (e) {
      print('An unknown error occurred.');
    }
    return false;
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

  Future<bool> checkEmailVerified() async {
    var user = _auth.currentUser;
    if (user == null) return false;
    await user.reload();
    user = _auth.currentUser;
    return user?.emailVerified ?? false;
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

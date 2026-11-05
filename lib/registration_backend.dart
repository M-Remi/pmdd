import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'email_service.dart';

class RegistrationBackend {
  Future<String?> registerUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }

    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await credential.user!.updateDisplayName(name);
      await EmailService.sendWelcomeEmail(name: name, email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'Email already exists';

        case 'weak-password':
          return 'Password is too weak';

        case 'invalid-email':
          return 'Invalid email address';

        default:
          return e.message ?? 'Registration failed';
      }
    }
  }

  Future<void> registerWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize();

      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      final bool isNewUser =
          userCredential.additionalUserInfo?.isNewUser ?? false;

      if (isNewUser) {
        await EmailService.sendWelcomeEmail(
          name: userCredential.user?.displayName ?? 'Friend',
          email: userCredential.user!.email!,
        );
      }
    } catch (e) {
      print("Google Sign-In Error: $e");
      rethrow;
    }
  }
}

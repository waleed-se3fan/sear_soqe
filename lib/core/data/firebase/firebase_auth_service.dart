import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// 🟢 Get Current User
  User? get currentUser => _auth.currentUser;

  /// 🟢 Stream to listen for auth changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// 🟢 Check if logged in
  bool get isLoggedIn => _auth.currentUser != null;

  // Sign-in anonymously (as a guest/visitor)
  Future<User?> signInAnonymously() async {
    try {
      // Sign in as anonymous user
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;

      if (user != null) {
        // You can also log or use the UID here
        print("User signed in anonymously with UID: ${user.uid}");
        return user; // Return the signed-in user
      } else {
        return null; // In case user is not signed in
      }
    } catch (e) {
      print("Error during anonymous sign-in: $e");
      return null; // If any error occurs
    }
  }

  /// 🟢 Sign Up with Email & Password
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// 🟢 Sign In with Email & Password
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// 🟢 Send Password Reset Email
  Future<void> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// 🟢 Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// 🟢 Delete Account
  Future<void> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// 🟢 Update Email
  // Future<void> updateEmail(String newEmail) async {
  //   try {
  //     await _auth.currentUser?.updateEmail(newEmail);
  //   } on FirebaseAuthException catch (e) {
  //     throw Exception(e.message);
  //   }
  // }

  /// 🟢 Update Password
  Future<void> updatePassword(String newPassword) async {
    try {
      await _auth.currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// 🟢 Sign In with Google
  // Future<User?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) return null;

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     final userCredential =
  //         await _auth.signInWithCredential(credential);

  //     return userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     throw Exception(e.message);
  //   }
  // }

  /// 🟢 Sign In with Phone Number
  Future<void> signInWithPhone(
    String phoneNumber, {
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(String, int?) onCodeSent,
    required Function(String) onCodeAutoRetrievalTimeout,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: onVerificationCompleted,
      verificationFailed: onVerificationFailed,
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
    );
  }

  Future<void> sendSignInLink(String email) async {
    final ActionCodeSettings actionCodeSettings = ActionCodeSettings(
      url: 'https://yourapp.page.link/emailSignIn',
      handleCodeInApp: true,
      androidPackageName: 'com.example.yourapp',
      androidInstallApp: true,
      androidMinimumVersion: '21',
      iOSBundleId: 'com.example.yourapp',
    );

    await _auth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: actionCodeSettings,
    );
  }

  Future<User?> signInWithEmailLink(String email, String emailLink) async {
    if (_auth.isSignInWithEmailLink(emailLink)) {
      final userCredential = await _auth.signInWithEmailLink(
        email: email,
        emailLink: emailLink,
      );
      return userCredential.user;
    }
    return null;
  }

  /// 🟢 Verify OTP for Phone Login
  Future<User?> verifyOTP(String verificationId, String smsCode) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}

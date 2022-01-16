import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagram/instagram/modal/apis/exceptions.dart';
import 'package:logger/logger.dart';

class AuthService {
  static int count = 0;
  late final Logger _logger;
  late final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth, [Logger? logger]) {
    logger == null ? _logger = Logger() : _logger = logger;
    // Check if user Auth done
    checkUserAuth();
    // For debugging purpose
    count++;
    _logger.wtf('Created Auth Service $count times');
  }

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future signOut() async {
    try {
      await _firebaseAuth.signOut().then((value) => _isAuthenticated = false);
      await GoogleSignIn().signOut();
      _logger.d('i ma here $_isAuthenticated');
    } catch (e) {
      throw UnknownException('Error while signOut Auth Service : $e');
    }
  }

  // Function stating at init of AuthService
  checkUserAuth() {
    _firebaseAuth.authStateChanges().distinct().listen(
      (state) {
        if (state?.uid != null) {
          _isAuthenticated = true;
        } else {
          _isAuthenticated = false;
        }
      },
      onDone: () => _logger.i('AuthService AuthStateChanges is Done'),
      onError: (error) => _logger.e('AuthService Error :- $error'),
    );
  }
}

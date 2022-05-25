import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  var _cachedUser = {"currentStreak": 0};

  getCachedUser() {
    return _cachedUser;
  }
}

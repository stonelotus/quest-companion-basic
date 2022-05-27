import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quest_companion/services/firebase.dart';

class UserService {
  var _cachedUser;
  var _cachedStreak;

  UserService() {
    refreshCachedUser();
    debugPrint(_cachedUser);
  }

  setCachedStreak(newStreak) {
    _cachedStreak = newStreak;
  }

  getCachedStreak() {
    return _cachedStreak;
  }

  refreshCachedUser() async {
    _cachedUser = await getUser();
    return _cachedUser;
  }

  getCachedUser() {
    debugPrint("HERE");
    debugPrint(_cachedUser.toString());
    return _cachedUser;
  }
}

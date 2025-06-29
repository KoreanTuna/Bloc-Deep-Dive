import 'dart:async';

import 'package:bloc_deep_dive/common/data/models/user.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      Duration(milliseconds: 300),
      () => _user = User(id: Uuid().v4(), name: 'Minwoo'),
    );
  }
}

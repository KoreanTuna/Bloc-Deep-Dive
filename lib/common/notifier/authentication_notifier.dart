import 'package:bloc_deep_dive/common/data/repository/authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Singleton(order: -1)
class AuthenticationNotifier extends ChangeNotifier {
  AuthenticationStatus _status = AuthenticationStatus.unknown;

  AuthenticationStatus get status => _status;

  void setStatus(AuthenticationStatus status) {
    _status = status;
    notifyListeners();
  }
}

import 'package:bloc_deep_dive/environment/getIt/getit.dart';
import 'package:bloc_deep_dive/util/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppBuilder {
  AppBuilder._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// GetIt config
    await setUpGetItConfig();

    /// API config
    await dotenv.load(fileName: ".env");

    Bloc.observer = SimpleBlocObserver();
  }
}

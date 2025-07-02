import 'package:door_stamp/environment/getIt/getit.dart';
import 'package:door_stamp/firebase_options.dart';
import 'package:door_stamp/util/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppBuilder {
  AppBuilder._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// GetIt config
    await setUpGetItConfig();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /// API config
    await dotenv.load(fileName: ".env");

    Bloc.observer = SimpleBlocObserver();
  }
}

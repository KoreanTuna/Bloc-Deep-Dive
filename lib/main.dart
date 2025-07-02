import 'package:door_stamp/common/bloc/authentication/authentication_bloc.dart';
import 'package:door_stamp/common/bloc/user/user_bloc.dart';
import 'package:door_stamp/common/data/data_source/firestore_data_source.dart';
import 'package:door_stamp/common/data/repository/authentication_repository.dart';
import 'package:door_stamp/common/data/repository/user_repository.dart';
import 'package:door_stamp/common/notifier/authentication_notifier.dart';
import 'package:door_stamp/environment/app_builder.dart';
import 'package:door_stamp/environment/getIt/getit.dart';
import 'package:door_stamp/util/local_storage/shared_pref_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  await AppBuilder.initialize();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthenticationRepository(),
          dispose: (repository) => repository.dispose(),
        ),
        RepositoryProvider(
          create:
              (_) => UserRepository(
                locator<SharedPrefUtil>(),
                locator<FirestoreDataSource>(),
              ),
        ),
      ],

      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create:
                (context) => AuthenticationBloc(
                  authenticationRepository:
                      context.read<AuthenticationRepository>(),
                  authenticationNotifier: locator<AuthenticationNotifier>(),
                )..add(AuthenticationSubscriptionRequested()),
          ),
          BlocProvider(
            create: (context) => UserBloc(context.read<UserRepository>()),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: locator<GoRouter>(),
          theme: ThemeData(colorSchemeSeed: Colors.indigo),
        ),
      ),
    );
  }
}

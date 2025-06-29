import 'package:bloc_deep_dive/common/bloc/authentication/authentication_bloc.dart';
import 'package:bloc_deep_dive/common/data/repository/authentication_repository.dart';
import 'package:bloc_deep_dive/common/data/repository/user_repository.dart';
import 'package:bloc_deep_dive/common/notifier/authentication_notifier.dart';
import 'package:bloc_deep_dive/environment/app_builder.dart';
import 'package:bloc_deep_dive/environment/getIt/getit.dart';
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
        RepositoryProvider(create: (_) => UserRepository()),
      ],
      child: BlocProvider(
        lazy: false,
        create:
            (context) => AuthenticationBloc(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
              userRepository: context.read<UserRepository>(),
              authenticationNotifier: locator<AuthenticationNotifier>(),
            )..add(AuthenticationSubscriptionRequested()),
        child: MaterialApp.router(
          routerConfig: locator<GoRouter>(),
          theme: ThemeData(colorSchemeSeed: Colors.indigo),
        ),
      ),
    );
  }
}

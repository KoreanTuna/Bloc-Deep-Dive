import 'package:bloc_deep_dive/common/bloc/authentication/authentication_bloc.dart';
import 'package:bloc_deep_dive/common/data/repository/authentication_repository.dart';
import 'package:bloc_deep_dive/presentation/widget/base/base_screen.dart';
import 'package:bloc_deep_dive/router/router_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            context.goNamed(RouterPath.home);
          case AuthenticationStatus.unauthenticated:
            context.goNamed(RouterPath.login);
          case AuthenticationStatus.unknown:
            context.goNamed(RouterPath.login);
            break;
        }
      },
      child: const Center(
        child: CupertinoActivityIndicator(color: Colors.indigo),
      ),
    );
  }
}

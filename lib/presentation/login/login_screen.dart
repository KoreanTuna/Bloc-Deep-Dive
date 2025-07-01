import 'package:bloc_deep_dive/common/data/repository/authentication_repository.dart';
import 'package:bloc_deep_dive/presentation/login/bloc/login_bloc.dart';
import 'package:bloc_deep_dive/presentation/login/widget/login_form.dart';
import 'package:bloc_deep_dive/presentation/widget/base/base_screen.dart';
import 'package:bloc_deep_dive/router/router_path.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({super.key});

  @override
  bool get setBottomSafeArea => false;

  @override
  bool get setTopSafeArea => false;

  @override
  Widget buildScreen(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
          ),
      child: LoginForm(
        onLoginButtonPressed: () => context.goNamed(RouterPath.splash),
      ),
    );
  }
}

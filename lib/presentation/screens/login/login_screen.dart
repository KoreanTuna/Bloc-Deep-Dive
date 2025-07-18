import 'package:door_stamp/common/data/repository/authentication_repository.dart';
import 'package:door_stamp/presentation/screens/login/bloc/login_bloc.dart';
import 'package:door_stamp/presentation/screens/login/widget/login_form.dart';
import 'package:door_stamp/presentation/widget/base/base_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: LoginForm(),
    );
  }
}

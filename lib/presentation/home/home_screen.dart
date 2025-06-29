import 'package:bloc_deep_dive/common/bloc/authentication/authentication_bloc.dart';
import 'package:bloc_deep_dive/presentation/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return Column(
      children: [
        const Text('Home Screen'),
        ElevatedButton(
          onPressed: () {
            context.read<AuthenticationBloc>().add(
              AuthenticationLogoutPressed(),
            );
          },
          child: const Text('Go to Login'),
        ),
      ],
    );
  }
}

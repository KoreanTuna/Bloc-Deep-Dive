import 'package:door_stamp/common/bloc/authentication/authentication_bloc.dart';
import 'package:door_stamp/common/bloc/user/user_bloc.dart';
import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/presentation/widget/base/base_screen.dart';
import 'package:door_stamp/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends BaseScreen {
  const ProfileScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        final UserModel user = (state as UserLoaded).user;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    user.name,
                    style: TextStyle().body1,
                  ),

                  /// Logout Button
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(
                        AuthenticationLogoutPressed(),
                      );
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),

              /// User Info
              ///
              ///

              ///
            ],
          ),
        );
      },
    );
  }
}

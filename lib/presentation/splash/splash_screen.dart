import 'package:door_stamp/common/bloc/authentication/authentication_bloc.dart';
import 'package:door_stamp/common/constant/png_image_path.dart';
import 'package:door_stamp/common/data/repository/authentication_repository.dart';
import 'package:door_stamp/common/extension/context_extension.dart';
import 'package:door_stamp/presentation/widget/base/base_screen.dart';
import 'package:door_stamp/presentation/widget/image_widget.dart';
import 'package:door_stamp/router/router_path.dart';
import 'package:door_stamp/util/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({super.key});
  @override
  Widget buildScreen(BuildContext context) {
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final state = context.read<AuthenticationBloc>().state;
          logger.d('SplashScreen: Checking AuthenticationState: $state');

          switch (state.status) {
            case AuthenticationStatus.authenticated:
              state.user.favoriteGenres == null ||
                      state.user.favoriteGenres!.isEmpty
                  ? context.goNamed(RouterPath.onboard)
                  : context.goNamed(RouterPath.home);
              break;
            case AuthenticationStatus.unauthenticated:
            case AuthenticationStatus.unknown:
              context.goNamed(RouterPath.login);
              break;
          }
        });

        return null;
      },
      [],
    );

    return SizedBox(
      width: context.screenSize.width,
      height: context.screenSize.height,
      child: PngImageWidget(
        imagePath: PngImagePath.splashLogo,
        fit: BoxFit.cover,
      ),
    );
  }
}

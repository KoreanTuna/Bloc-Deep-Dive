import 'package:bloc_deep_dive/common/bloc/authentication/authentication_bloc.dart';
import 'package:bloc_deep_dive/common/constant/png_image_path.dart';
import 'package:bloc_deep_dive/common/data/repository/authentication_repository.dart';
import 'package:bloc_deep_dive/common/extension/context_extension.dart';
import 'package:bloc_deep_dive/presentation/widget/base/base_screen.dart';
import 'package:bloc_deep_dive/presentation/widget/image_widget.dart';
import 'package:bloc_deep_dive/router/router_path.dart';
import 'package:bloc_deep_dive/util/logger.dart';
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
        logger.d('SplashScreen: AuthenticationState changed: $state');
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            context.goNamed(RouterPath.onboard);
            break;
          case AuthenticationStatus.unauthenticated:
          case AuthenticationStatus.unknown:
            context.goNamed(RouterPath.login);
            break;
        }
      },
      child: SizedBox(
        width: context.screenSize.width,
        height: context.screenSize.height,
        child: PngImageWidget(
          imagePath: PngImagePath.splashLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

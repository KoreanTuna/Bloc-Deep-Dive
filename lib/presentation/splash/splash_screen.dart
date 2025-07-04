import 'package:door_stamp/common/bloc/authentication/authentication_bloc.dart';
import 'package:door_stamp/common/bloc/user/user_bloc.dart';
import 'package:door_stamp/common/constant/png_image_path.dart';
import 'package:door_stamp/common/data/repository/authentication_repository.dart';
import 'package:door_stamp/common/extension/context_extension.dart';
import 'package:door_stamp/presentation/widget/base/base_screen.dart';
import 'package:door_stamp/presentation/widget/image_widget.dart';
import 'package:door_stamp/router/router_path.dart';
import 'package:door_stamp/util/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            /// Firebase Auth가 유효하지 않거나, 상태가 인증되지 않은 경우
            if (user == null ||
                state.status != AuthenticationStatus.authenticated) {
              logger.w('사용자 인증 상태가 유효하지 않음: ${state.status}');
              context.goNamed(RouterPath.login);
            } else {
              /// Firebase Auth가 유효하고, 상태가 인증된 경우
              context.read<UserBloc>().add(UserDataRequested(userId: user.uid));
            }
          });
        });
        return null;
      },
      [],
    );

    return BlocListener<UserBloc, UserState>(
      listenWhen:
          (previous, current) =>
              previous is! UserLoaded && current is UserLoaded,
      listener: (context, state) {
        /// 사용자 정보가 로드되었을 때, 즐겨찾기 장르가 없으면 온보딩 화면으로 이동
        if (state is UserLoaded) {
          if (state.user.favoriteGenres == null ||
              state.user.favoriteGenres!.isEmpty) {
            context.goNamed(RouterPath.onboard);
            return;
          } else {
            context.goNamed(RouterPath.home);
          }
        } else {
          context.goNamed(RouterPath.login);
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

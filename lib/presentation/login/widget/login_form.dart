import 'package:door_stamp/common/bloc/user/user_bloc.dart';
import 'package:door_stamp/common/constant/svg_image_path.dart';
import 'package:door_stamp/common/extension/context_extension.dart';
import 'package:door_stamp/presentation/login/bloc/login_bloc.dart';
import 'package:door_stamp/presentation/widget/image_widget.dart';
import 'package:door_stamp/router/router_path.dart';
import 'package:door_stamp/theme/color_style.dart';
import 'package:door_stamp/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isInProgressOrSuccess = context.select(
      (LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  '로그인에 실패했습니다.',
                  style: TextStyle().body2.copyWith(color: ColorStyle.white),
                ),
              ),
            );
        }

        if (state.status.isSuccess) {
          context.read<UserBloc>().add(
            UserDataRequested(userId: state.user.id),
          );
        }
      },
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    '사용자 정보를 가져오는 데 실패했습니다.',
                    style: TextStyle().body2.copyWith(color: ColorStyle.white),
                  ),
                ),
              );
            return;
          }

          /// 사용자 정보 불러오기 성공
          context.goNamed(RouterPath.splash);
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: context.screenSize.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox.shrink(),
                    Column(
                      spacing: 8,
                      children: [
                        SvgImageWidget(
                          width: 78,
                          height: 78,
                          fit: BoxFit.cover,
                          imagePath: SvgImagePath.logo,
                        ),
                        Text(
                          'DOOR STAMP',
                          style: TextStyle().subTitle3,
                        ),
                      ],
                    ),

                    Column(
                      spacing: 12,
                      children: [
                        Text(
                          ' 간편하게 로그인하고\n다양한 서비스를 이용하세요',
                          style: TextStyle().body2,
                          textAlign: TextAlign.center,
                        ),
                        Column(
                          children:
                              SSOType.values
                                  .map(
                                    (ssoType) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12.0,
                                      ),
                                      child: _LoginButton(
                                        ssoType: ssoType,
                                        onLoginButtonPressed: () {
                                          context.read<LoginBloc>().add(
                                            LoginSubmitted(ssoType),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                        Text(
                          '로그인 시 이용약관 / 개인정보 처리방침 동의로 간주합니다',
                          style: TextStyle().detail.copyWith(
                            color: ColorStyle.coolGray500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (isInProgressOrSuccess)
              Container(
                width: context.screenSize.width,
                height: context.screenSize.height,
                color: ColorStyle.gray850.withValues(alpha: 0.3),
                child: const Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.ssoType,
    required this.onLoginButtonPressed,
  });

  final VoidCallback onLoginButtonPressed;
  final SSOType ssoType;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ssoType.containerColor,
        borderRadius: BorderRadius.circular(360),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(360),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onLoginButtonPressed,
            child: Container(
              width: context.screenSize.width,
              height: 52,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ssoType.borderColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(360),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgImageWidget(
                    width: 24,
                    height: 24,
                    imagePath: ssoType.imagePath,
                  ),
                  Text(
                    ssoType.loginText,
                    style: TextStyle().subTitle3.copyWith(
                      color: ssoType.textColor,
                    ),
                  ),
                  SizedBox.square(dimension: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

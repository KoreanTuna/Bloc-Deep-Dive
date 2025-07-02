part of 'login_bloc.dart';

enum SSOType {
  apple,
  google,
  kakao;

  Color get containerColor {
    switch (this) {
      case SSOType.apple:
        return ColorStyle.appleContainerColor;
      case SSOType.google:
        return ColorStyle.white;
      case SSOType.kakao:
        return ColorStyle.kakaoContainerColor;
    }
  }

  String get loginText {
    switch (this) {
      case SSOType.apple:
        return '애플로 로그인';
      case SSOType.google:
        return '구글로 로그인';
      case SSOType.kakao:
        return '카카오로 로그인';
    }
  }

  Color get borderColor {
    switch (this) {
      case SSOType.apple:
        return ColorStyle.appleContainerColor;
      case SSOType.google:
        return ColorStyle.coolGray300;
      case SSOType.kakao:
        return ColorStyle.kakaoContainerColor;
    }
  }

  String get imagePath {
    switch (this) {
      case SSOType.apple:
        return SvgImagePath.appleFavicon;
      case SSOType.google:
        return SvgImagePath.googleFavicon;
      case SSOType.kakao:
        return SvgImagePath.kakaoFavicon;
    }
  }

  Color get textColor {
    switch (this) {
      case SSOType.apple:
        return ColorStyle.white;
      case SSOType.google:
        return ColorStyle.gray850;
      case SSOType.kakao:
        return ColorStyle.gray850;
    }
  }
}

final class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.ssoType,
    this.user = UserModel.empty,
  });

  final FormzSubmissionStatus status;
  final SSOType? ssoType;
  final UserModel user;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    SSOType? ssoType,
    UserModel? user,
  }) {
    return LoginState(
      status: status ?? this.status,
      ssoType: ssoType ?? this.ssoType,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, ssoType ?? '', user];
}

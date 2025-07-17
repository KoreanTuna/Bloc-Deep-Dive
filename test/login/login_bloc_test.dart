import 'package:bloc_test/bloc_test.dart';
import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/common/data/repository/authentication_repository.dart';
import 'package:door_stamp/presentation/screens/login/bloc/login_bloc.dart';
import 'package:door_stamp/util/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:formz/formz.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class FakeFirebaseUser extends Fake implements User {
  FakeFirebaseUser(this.uid, {this.email, this.displayName});

  @override
  final String uid;
  @override
  final String? email;
  @override
  final String? displayName;
}

class FakeOAuthCredential extends Fake implements OAuthCredential {
  FakeOAuthCredential(this.accessToken);

  @override
  final String? accessToken;

  @override
  String? get idToken => null;
}

class FakeUserCredential extends Fake implements UserCredential {
  FakeUserCredential({this.user, this.credential});

  @override
  final User? user;

  @override
  final AuthCredential? credential;

  @override
  AdditionalUserInfo? get additionalUserInfo => null;
}

void main() {
  group('LoginBloc', () {
    late AuthenticationRepository repository;

    setUp(() {
      repository = MockAuthenticationRepository();
    });

    final user = UserModel(
      id: '1',
      name: 'name',
      email: 'test@test.com',
      accessToken: 'token',
    );

    final credential = FakeUserCredential(
      user: FakeFirebaseUser(
        user.id,
        email: user.email,
        displayName: user.name,
      ),
      credential: FakeOAuthCredential(user.accessToken),
    );

    blocTest<LoginBloc, LoginState>(
      '[success] : 로그인 성공시 상태가 success로 변경된다.',
      build: () {
        when(() => repository.signInWithGoogle())
            .thenAnswer((_) async => Result.ok(credential));
        return LoginBloc(authenticationRepository: repository);
      },
      act: (bloc) => bloc.add(const LoginSubmitted(SSOType.google)),
      expect: () => [
        const LoginState(
          status: FormzSubmissionStatus.inProgress,
          ssoType: SSOType.google,
        ),
        LoginState(
          status: FormzSubmissionStatus.success,
          ssoType: SSOType.google,
          user: user.copyWith(provider: SSOType.google),
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      '[failure] : 로그인 실패시 상태가 failure로 변경된다.',
      build: () {
        when(() => repository.signInWithGoogle())
            .thenAnswer((_) async => Result.error(Exception('error')));
        return LoginBloc(authenticationRepository: repository);
      },
      act: (bloc) => bloc.add(const LoginSubmitted(SSOType.google)),
      expect: () => [
        const LoginState(
          status: FormzSubmissionStatus.inProgress,
          ssoType: SSOType.google,
        ),
        const LoginState(
          status: FormzSubmissionStatus.failure,
          ssoType: SSOType.google,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      '[reset] : LoginReset 이벤트가 발생하면 초기 상태로 변경된다.',
      build: () => LoginBloc(authenticationRepository: repository),
      seed: () => const LoginState(
        status: FormzSubmissionStatus.success,
        ssoType: SSOType.google,
      ),
      act: (bloc) => bloc.add(const LoginReset()),
      expect: () => [const LoginState()],
    );
  });
}

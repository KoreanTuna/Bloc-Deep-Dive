import 'dart:typed_data';

import 'package:door_stamp/common/bloc/user/user_bloc.dart';
import 'package:door_stamp/presentation/screens/login/bloc/login_bloc.dart';
import 'package:door_stamp/presentation/screens/login/widget/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/services.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState> implements LoginBloc {}
class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (_) async => ByteData(0));
  });

  testWidgets('shows login buttons for all SSO types', (tester) async {
    final loginBloc = MockLoginBloc();
    final userBloc = MockUserBloc();
    when(() => loginBloc.state).thenReturn(const LoginState());
    when(() => userBloc.state).thenReturn(const UserInitial());

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>.value(value: loginBloc),
            BlocProvider<UserBloc>.value(value: userBloc),
          ],
          child: const LoginForm(),
        ),
      ),
    );

    for (final type in SSOType.values) {
      expect(find.text(type.loginText), findsOneWidget);
    }
  });
}

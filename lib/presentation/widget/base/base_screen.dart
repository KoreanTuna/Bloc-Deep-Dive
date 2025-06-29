import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class BaseScreen extends HookWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      onInit(context);
      return () => onDispose();
    }, []);
    useOnAppLifecycleStateChange((previousState, state) {
      switch (state) {
        case AppLifecycleState.resumed:
          onResumed();
          break;
        case AppLifecycleState.paused:
          onPaused();
          break;
        case AppLifecycleState.inactive:
          onInactive();
          break;
        case AppLifecycleState.detached:
          onDetached();
          break;
        case AppLifecycleState.hidden:
          break;
      }
    });
    return PopScope(
      canPop: canPop,
      child: Scaffold(
        appBar: renderAppBar(context),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundGradient != null ? null : backgroundColor,
        bottomNavigationBar: renderBottomNavigationBar(context),
        floatingActionButton: renderFloatingActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            if (backgroundGradient != null)
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(gradient: backgroundGradient),
              ),
            SafeArea(
              top: setTopSafeArea,
              bottom: setBottomSafeArea,
              child: buildScreen(context),
            ),
          ],
        ),
      ),
    );
  }

  @protected
  Widget buildScreen(BuildContext context);

  @protected
  LinearGradient? get backgroundGradient => null;

  @protected
  bool get setBottomSafeArea => true;

  @protected
  bool get setTopSafeArea => true;

  @protected
  bool get canPop => false;

  @protected
  Color? get backgroundColor => Colors.white;

  @protected
  bool get resizeToAvoidBottomInset => true;

  @protected
  PreferredSizeWidget? renderAppBar(BuildContext context) => null;

  @protected
  Widget? renderBottomNavigationBar(BuildContext context) => null;

  @protected
  Widget? renderFloatingActionButton(BuildContext context) => null;

  /// 앱이 활성화된 상태로 돌아올 때 호출
  @protected
  void onResumed() {}

  /// 앱이 일시 정지될 때 호출
  @protected
  void onPaused() {}

  /// 앱이 비활성 상태로 전환될 때 호출
  @protected
  void onInactive() {}

  /// 앱이 분리되었을 때 호출
  @protected
  void onDetached() {}

  /// 페이지 초기화 시 호출
  @protected
  void onInit(BuildContext context) {}

  /// 페이지 해제 시 호출
  @protected
  void onDispose() {}

  /// will pop시
  @protected
  void onScreenPop() {}
}

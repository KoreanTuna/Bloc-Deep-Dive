import 'package:door_stamp/presentation/screens/shell/presentation/bloc/bottom_nav_cubit.dart';
import 'package:door_stamp/presentation/screens/shell/presentation/widget/bottom_nav_widget.dart';
import 'package:door_stamp/presentation/widget/base/base_screen.dart';
import 'package:door_stamp/core/router/router_path.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShellScreen extends BaseScreen {
  const ShellScreen({
    super.key,
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  bool get setTopSafeArea => false;

  @override
  bool get setBottomSafeArea => false;

  @override
  Widget buildScreen(BuildContext context) {
    final bottomNavCubit = context.watch<BottomNavCubit>();
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: Column(
        children: [
          Expanded(child: child),
          BottomNavWidget(
            currentItem: bottomNavCubit.state,
            onItemSelected: (BottomNavItem selectedItem) {
              switch (selectedItem) {
                case BottomNavItem.home:
                  bottomNavCubit.setHome();
                  context.goNamed(RouterPath.home);
                  break;
                case BottomNavItem.search:
                  bottomNavCubit.setSearch();
                  context.goNamed(RouterPath.search);

                  break;
                case BottomNavItem.profile:
                  bottomNavCubit.setProfile();
                  context.goNamed(RouterPath.profile);
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}

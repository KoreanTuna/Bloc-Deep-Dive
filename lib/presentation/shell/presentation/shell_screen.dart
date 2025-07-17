import 'package:door_stamp/presentation/shell/presentation/bloc/bottom_nav_cubit.dart';
import 'package:door_stamp/presentation/shell/presentation/widget/bottom_nav_widget.dart';
import 'package:door_stamp/router/router_path.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShellScreen extends StatelessWidget {
  const ShellScreen({
    super.key,
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
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

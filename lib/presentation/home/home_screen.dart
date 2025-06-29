import 'package:bloc_deep_dive/presentation/widget/base/base_screen.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return const Center(child: Text('Home Screen'));
  }
}

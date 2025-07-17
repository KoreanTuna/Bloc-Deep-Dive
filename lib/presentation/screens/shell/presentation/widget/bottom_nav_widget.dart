import 'package:door_stamp/presentation/screens/shell/presentation/bloc/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.currentItem,
    required this.onItemSelected,
  });

  final BottomNavItem currentItem;
  final void Function(BottomNavItem) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            BottomNavItem.values.map((item) {
              return IconButton(
                icon: Icon(item.icon),
                onPressed: () {
                  onItemSelected(item);
                },
                color: currentItem == item ? Colors.indigo : Colors.grey,
              );
            }).toList(),
      ),
    );
  }
}

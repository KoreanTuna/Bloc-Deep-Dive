import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavItem {
  home,
  search,
  profile;

  IconData get icon {
    switch (this) {
      case BottomNavItem.home:
        return Icons.home;
      case BottomNavItem.search:
        return Icons.search;
      case BottomNavItem.profile:
        return Icons.person;
    }
  }
}

class BottomNavCubit extends Cubit<BottomNavItem> {
  BottomNavCubit() : super(BottomNavItem.home);

  void _selectItem(BottomNavItem item) {
    emit(item);
  }

  void setHome() {
    _selectItem(BottomNavItem.home);
  }

  void setSearch() {
    _selectItem(BottomNavItem.search);
  }

  void setProfile() {
    _selectItem(BottomNavItem.profile);
  }
}

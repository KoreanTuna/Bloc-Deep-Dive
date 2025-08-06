import 'package:door_stamp/presentation/screens/search/data/repository/movie_search_repository.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_bloc.dart';
import 'package:door_stamp/presentation/screens/search/presentation/widget/search_view.dart';
import 'package:door_stamp/presentation/widget/base/base_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends BaseScreen {
  const SearchScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MovieSearchBloc(
          movieSearchRepository: context.read<MovieSearchRepository>(),
        );
      },
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: SearchView(),
      ),
    );
  }
}

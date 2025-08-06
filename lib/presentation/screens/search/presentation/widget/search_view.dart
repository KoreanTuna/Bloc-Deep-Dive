import 'package:door_stamp/core/theme/color_style.dart';
import 'package:door_stamp/core/theme/text_style.dart';
import 'package:door_stamp/presentation/screens/search/data/models/movie_model.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_bloc.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_event.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_state.dart';
import 'package:door_stamp/presentation/widget/textfield/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchView extends HookWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> movies =
        context.watch<MovieSearchBloc>().state.movies;
    return BlocBuilder<MovieSearchBloc, MovieSearchState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              hintText: '영화 제목을 입력해주세요',
              onChanged: (query) {
                context.read<MovieSearchBloc>().add(
                  MovieSearchQueryChanged(query),
                );
              },
            ),
            SizedBox(height: 16),
            if (state.status == MovieSearchStatus.loading)
              const Center(child: CircularProgressIndicator()),
            if (state.status == MovieSearchStatus.failure)
              Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyle().body2.copyWith(
                    color: ColorStyle.coolGray300,
                  ),
                ),
              ),
            if (state.status == MovieSearchStatus.success && movies.isEmpty)
              const Center(
                child: Text(
                  'No results found',
                  style: TextStyle(color: Colors.black),
                ),
              ),

            if (state.status == MovieSearchStatus.success && movies.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return ListTile(
                      title: Text(movie.title),
                      onTap: () {},
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}

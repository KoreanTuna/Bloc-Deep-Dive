import 'package:bloc_deep_dive/common/extension/context_extension.dart';
import 'package:bloc_deep_dive/presentation/on_board/data/models/favorite_genre_model.dart';
import 'package:bloc_deep_dive/presentation/on_board/presentation/bloc/on_board_bloc.dart';
import 'package:bloc_deep_dive/presentation/on_board/presentation/widget/genre_card.dart';
import 'package:bloc_deep_dive/presentation/widget/base/base_screen.dart';
import 'package:bloc_deep_dive/theme/color_style.dart';
import 'package:bloc_deep_dive/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

class OnBoardScreen extends BaseScreen {
  const OnBoardScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardBloc(),
      child: SizedBox(
        width: context.screenSize.width,
        child: Column(
          spacing: 40,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  Text(
                    '어떤 영화를 좋아하세요?',
                    style: TextStyle().subTitle1,
                  ),

                  Text(
                    '취향을 선택하고 나에게 맞는 추천을 받아보세요',
                    style: TextStyle().body1,
                  ),
                ],
              ),
            ),

            Expanded(
              child: ScrollShadow(
                size: 16,
                color: ColorStyle.gray850.withValues(alpha: 0.3),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: FavoriteGenre.values.length,
                  itemBuilder: (context, index) {
                    final genre = FavoriteGenre.values[index];
                    return BlocSelector<OnBoardBloc, OnBoardState, bool>(
                      selector: (state) => state.selectedGenres.contains(genre),
                      builder: (context, isSelected) {
                        return GenreCard(
                          onTap: (_) {
                            if (isSelected) {
                              context.read<OnBoardBloc>().add(
                                DeselectGenreEvent(genre),
                              );
                            } else {
                              context.read<OnBoardBloc>().add(
                                SelectGenreEvent(genre),
                              );
                            }
                          },
                          genre: genre,
                          isSelected: isSelected,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

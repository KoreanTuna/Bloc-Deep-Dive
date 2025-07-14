import 'package:door_stamp/common/data/data_source/firestore_data_source.dart';
import 'package:door_stamp/common/data/repository/user_repository.dart';
import 'package:door_stamp/common/extension/context_extension.dart';
import 'package:door_stamp/environment/getIt/getit.dart';
import 'package:door_stamp/presentation/on_board/data/models/favorite_genre_model.dart';
import 'package:door_stamp/presentation/on_board/data/repository/favorite_genre_repository.dart';
import 'package:door_stamp/presentation/on_board/presentation/bloc/on_board_bloc.dart';
import 'package:door_stamp/presentation/on_board/presentation/widget/genre_card.dart';
import 'package:door_stamp/presentation/widget/base/base_screen.dart';
import 'package:door_stamp/router/router_path.dart';
import 'package:door_stamp/theme/color_style.dart';
import 'package:door_stamp/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:go_router/go_router.dart';

class OnBoardScreen extends BaseScreen {
  const OnBoardScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return BlocProvider(
      create:
          (_) => OnBoardBloc(
            context.read<FavoriteGenreRepository>(),
          ),
      child: BlocListener<OnBoardBloc, OnBoardState>(
        listenWhen: (previous, current) {
          return previous.isSubmitted != current.isSubmitted;
        },

        /// OnBoardBloc의 isSubmitted 상태가 변경되었을 때만 실행
        listener: (context, state) {
          if (state.isSubmitted) {
            context.goNamed(RouterPath.home);
          }
        },
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                    itemCount: FavoriteGenre.values.length,
                    itemBuilder: (context, index) {
                      final genre = FavoriteGenre.values[index];
                      return BlocSelector<OnBoardBloc, OnBoardState, bool>(
                        selector:
                            (state) => state.selectedGenres.contains(genre),
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
              SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// 선택된 장르를 보여주는 영역
                      BlocSelector<
                        OnBoardBloc,
                        OnBoardState,
                        List<FavoriteGenre>
                      >(
                        selector: (state) => state.selectedGenres,
                        builder: (context, selectedGenres) {
                          /// 2개 이상인 경우는 +1 과 같이 표시
                          List<FavoriteGenre> filteredGenres = List.from(
                            selectedGenres,
                          );
                          if (filteredGenres.length > 2) {
                            filteredGenres = filteredGenres.take(2).toList();
                          }
                          return Row(
                            children: [
                              Row(
                                children: filteredGenres
                                    .map((genre) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorStyle.coolGray300
                                                .withValues(alpha: 0.3),
                                            borderRadius: BorderRadius.circular(
                                              48,
                                            ),
                                          ),
                                          child: Text(
                                            genre.korean,
                                            style: TextStyle().body1.copyWith(),
                                          ),
                                        ),
                                      );
                                    })
                                    .toList(growable: false),
                              ),
                              if (selectedGenres.length > 2)
                                Text(
                                  '+${selectedGenres.length - 2}',
                                  style: TextStyle().body1.copyWith(
                                    color: ColorStyle.coolGray500,
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      BlocSelector<
                        OnBoardBloc,
                        OnBoardState,
                        List<FavoriteGenre>
                      >(
                        selector: (state) => state.selectedGenres,
                        builder: (context, selectedGenres) {
                          final bool isEnabled = selectedGenres.isNotEmpty;
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isEnabled
                                      ? ColorStyle.primary500
                                      : ColorStyle.coolGray300,
                            ),
                            onPressed:
                                isEnabled
                                    ? () {
                                      context.read<OnBoardBloc>().add(
                                        SubmitOnBoardEvent(selectedGenres),
                                      );
                                    }
                                    : null,
                            child: Text(
                              '선택 완료',
                              style: TextStyle().body1.copyWith(
                                color:
                                    isEnabled
                                        ? Colors.white
                                        : ColorStyle.coolGray500,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

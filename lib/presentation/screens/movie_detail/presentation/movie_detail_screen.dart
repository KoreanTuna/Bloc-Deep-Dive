import 'package:door_stamp/environment/getIt/getit.dart';
import 'package:door_stamp/presentation/screens/movie_detail/data/repository/movie_detail_repository.dart';
import 'package:door_stamp/presentation/screens/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:door_stamp/presentation/screens/movie_detail/presentation/bloc/movie_detail_event.dart';
import 'package:door_stamp/presentation/screens/movie_detail/presentation/bloc/movie_detail_state.dart';
import 'package:door_stamp/presentation/screens/movie_detail/presentation/widget/movie_default_info.dart';
import 'package:door_stamp/presentation/screens/movie_detail/presentation/widget/movie_genre_info.dart';
import 'package:door_stamp/presentation/screens/movie_detail/presentation/widget/movie_people_info.dart';
import 'package:door_stamp/presentation/widget/base/base_screen.dart';
import 'package:door_stamp/theme/color_style.dart';
import 'package:door_stamp/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class MovieDetailScreen extends BaseScreen {
  const MovieDetailScreen({
    super.key,
    required this.movieCd,
    required this.prevDayTotalAudits,
  });

  final String movieCd;
  final int prevDayTotalAudits;

  @override
  PreferredSizeWidget? renderAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => context.pop(),
      ),
      title: Text(
        '영화 상세보기',
        style: TextStyle().subTitle3,
      ),
    );
  }

  @override
  Widget buildScreen(BuildContext context) {
    final ValueNotifier<int> selectedTabIndexState = useState(0);
    final TabController tabController = useTabController(
      initialLength: 3,
      initialIndex: selectedTabIndexState.value,
    );

    return BlocProvider(
      create:
          (context) => MovieDetailBloc(
            movieDetailRepository: locator<MovieDetailRepository>(),
          )..add(MovieDetailFetched(movieCd: movieCd)),
      child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state.status == MovieDetailStatus.initial) {
            return const Center(
              child: CupertinoActivityIndicator(color: Colors.indigo),
            );
          } else if (state.status == MovieDetailStatus.failure) {
            return const Center(child: Text('Failed to fetch data'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),

                  child: Text(
                    state.movieDetail?.movieInfo.movieNm ?? '영화 제목 없음',
                    style: TextStyle().title2,
                  ),
                ),
                const SizedBox(height: 12),

                /// 영화  기본정보 / 감독,출연 / 장르
                TabBar(
                  indicatorColor: ColorStyle.primary500,
                  controller: tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        '기본정보',
                        style: TextStyle().body1,
                      ),
                    ),
                    Tab(
                      child: Text(
                        '감독,출연',
                        style: TextStyle().body1,
                      ),
                    ),
                    Tab(
                      child: Text(
                        '장르',
                        style: TextStyle().body1,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        MovieDefaultInfo(
                          movieDetailInfo: state.movieDetail!.movieInfo,
                          prevDayTotalAudits: prevDayTotalAudits,
                        ),
                        MoviePeopleInfo(
                          movieDetailInfo: state.movieDetail!.movieInfo,
                        ),
                        MovieGenreInfo(
                          movieDetailInfo: state.movieDetail!.movieInfo,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

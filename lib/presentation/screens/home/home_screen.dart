import 'package:door_stamp/presentation/features/daily_box_office/data/repository/box_office_repository.dart';
import 'package:door_stamp/common/extension/date_time_extension.dart';
import 'package:door_stamp/environment/getIt/getit.dart';
import 'package:door_stamp/presentation/features/daily_box_office/presentation/bloc/daily_box_office_bloc.dart';
import 'package:door_stamp/presentation/features/daily_box_office/presentation/widget/daily_rank_widget.dart';
import 'package:door_stamp/presentation/screens/home/widget/home_title.dart';
import 'package:door_stamp/presentation/widget/base/base_screen.dart';
import 'package:door_stamp/core/router/router_path.dart';
import 'package:door_stamp/core/theme/color_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});
  @override
  bool get setBottomSafeArea => false;

  @override
  Widget buildScreen(BuildContext context) {
    return BlocProvider(
      create:
          (context) => DailyBoxOfficeBloc(
            boxOfficeRepository: locator<BoxOfficeRepository>(),
          )..add(
            DailyBoxOfficeFetched(
              targetDt:
                  DateTime.now().subtract(Duration(days: 1)).boxOfficeQueryTime,
            ), // Example date
          ),
      child: BlocBuilder<DailyBoxOfficeBloc, DailyBoxOfficeState>(
        builder: (context, state) {
          if (state.status == DailyBoxOfficeStatus.initial) {
            return const Center(
              child: CupertinoActivityIndicator(color: Colors.indigo),
            );
          } else if (state.status == DailyBoxOfficeStatus.failure) {
            return const Center(child: Text('Failed to fetch data'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeTitle(),
                      Divider(
                        color: ColorStyle.coolGray300,
                        thickness: 0.5,
                        height: 32,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: DailyRankWidget(
                    dailyBoxOfficeMovieList: state.boxOffices,
                    onMovieSelected:
                        (movieCd) => context.pushNamed(
                          RouterPath.movieDetail,
                          pathParameters: {
                            'movieCd': movieCd,
                            'prevDayTotalAudits':
                                state.boxOffices
                                    .firstWhere(
                                      (movie) => movie.movieCd == movieCd,
                                    )
                                    .audiCnt
                                    .toString(),
                          },
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

import 'package:bloc_deep_dive/common/data/repository/box_office_repository.dart';
import 'package:bloc_deep_dive/common/extension/date_time_extension.dart';
import 'package:bloc_deep_dive/environment/getIt/getit.dart';
import 'package:bloc_deep_dive/presentation/daily_box_office/bloc/daily_box_office_bloc.dart';
import 'package:bloc_deep_dive/presentation/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

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
      child: Column(
        children: [
          BlocBuilder<DailyBoxOfficeBloc, DailyBoxOfficeState>(
            builder: (context, state) {
              if (state.status == DailyBoxOfficeStatus.initial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == DailyBoxOfficeStatus.failure) {
                return const Center(child: Text('Failed to fetch data'));
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.boxOffices.length,
                  itemBuilder: (context, index) {
                    final boxOffice = state.boxOffices[index];
                    return ListTile(
                      title: Text(boxOffice.movieNm ?? 'Unknown Movie'),
                      subtitle: Text(boxOffice.audiAcc ?? 'No Audience Data'),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

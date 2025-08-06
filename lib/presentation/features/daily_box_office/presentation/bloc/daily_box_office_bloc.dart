import 'package:door_stamp/presentation/features/daily_box_office/data/models/daily_box_office_model.dart';
import 'package:door_stamp/presentation/features/daily_box_office/data/repository/box_office_repository.dart';
import 'package:door_stamp/core/util/result.dart';
import 'package:door_stamp/core/util/stream_transform.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daily_box_office_event.dart';
part 'daily_box_office_state.dart';

class DailyBoxOfficeBloc
    extends Bloc<DailyBoxOfficeEvent, DailyBoxOfficeState> {
  DailyBoxOfficeBloc({required BoxOfficeRepository boxOfficeRepository})
    : _boxOfficeRepository = boxOfficeRepository,
      super(const DailyBoxOfficeState()) {
    on<DailyBoxOfficeFetched>(
      _onFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final BoxOfficeRepository _boxOfficeRepository;

  Future<void> _onFetched(
    DailyBoxOfficeFetched event,
    Emitter<DailyBoxOfficeState> emit,
  ) async {
    final Result<DailyBoxOfficeModel> result = await _boxOfficeRepository
        .getDailyBoxOffice(targetDt: event.targetDt, itemPerPage: '10');

    result.when(
      ok: (DailyBoxOfficeModel data) {
        final List<DailyBoxOfficeMovieModel> boxOffices = List.from(
          data.dailyBoxOfficeList,
        );

        boxOffices.sort((a, b) {
          final int? rankA = int.tryParse(a.rank ?? '');
          final int? rankB = int.tryParse(b.rank ?? '');
          if (rankA == null && rankB == null) return 0;
          if (rankA == null) return 1;
          if (rankB == null) return -1;
          return rankA - rankB;
        });

        emit(
          state.copyWith(
            status: DailyBoxOfficeStatus.success,
            boxOffices: boxOffices,
          ),
        );
      },
      error: (Exception e) {
        emit(state.copyWith(status: DailyBoxOfficeStatus.failure));
      },
    );
  }
}

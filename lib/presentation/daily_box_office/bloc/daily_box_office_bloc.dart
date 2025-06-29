import 'package:bloc_deep_dive/common/data/models/box_office/daily_box_office_model.dart';
import 'package:bloc_deep_dive/common/data/repository/box_office_repository.dart';
import 'package:bloc_deep_dive/util/result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daily_box_office_event.dart';
part 'daily_box_office_state.dart';

class DailyBoxOfficeBloc
    extends Bloc<DailyBoxOfficeEvent, DailyBoxOfficeState> {
  DailyBoxOfficeBloc(this._boxOfficeRepository)
    : super(const DailyBoxOfficeState()) {
    on<DailyBoxOfficeFetched>(_onFetched);
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
        emit(
          state.copyWith(
            status: DailyBoxOfficeStatus.success,
            boxOffices: data.dailyBoxOfficeList,
          ),
        );
      },
      error: (Exception e) {
        emit(state.copyWith(status: DailyBoxOfficeStatus.failure));
      },
    );
  }
}

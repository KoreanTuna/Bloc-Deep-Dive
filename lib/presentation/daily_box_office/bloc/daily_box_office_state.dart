part of 'daily_box_office_bloc.dart';

enum DailyBoxOfficeStatus { initial, success, failure }

final class DailyBoxOfficeState extends Equatable {
  const DailyBoxOfficeState({
    this.status = DailyBoxOfficeStatus.initial,
    this.boxOffices = const <DailyBoxOfficeMovieModel>[],
  });

  final DailyBoxOfficeStatus status;
  final List<DailyBoxOfficeMovieModel> boxOffices;

  DailyBoxOfficeState copyWith({
    DailyBoxOfficeStatus? status,
    List<DailyBoxOfficeMovieModel>? boxOffices,
  }) {
    return DailyBoxOfficeState(
      status: status ?? this.status,
      boxOffices: boxOffices ?? this.boxOffices,
    );
  }

  @override
  List<Object> get props => [status, boxOffices];
}

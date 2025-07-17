part of 'daily_box_office_bloc.dart';

class DailyBoxOfficeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class DailyBoxOfficeFetched extends DailyBoxOfficeEvent {
  final String targetDt;

  DailyBoxOfficeFetched({required this.targetDt});

  @override
  List<Object> get props => [targetDt];
}

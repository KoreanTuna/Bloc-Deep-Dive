import 'package:bloc_deep_dive/common/constant/svg_image_path.dart';
import 'package:bloc_deep_dive/common/data/models/box_office/daily_box_office_model.dart';
import 'package:bloc_deep_dive/presentation/widget/image_widget.dart';
import 'package:bloc_deep_dive/theme/color_style.dart';
import 'package:bloc_deep_dive/theme/text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum DailyRankType {
  first,
  second,
  third;

  String get imagePath {
    switch (this) {
      case DailyRankType.first:
        return SvgImagePath.firstwin;
      case DailyRankType.second:
        return SvgImagePath.secondwin;
      case DailyRankType.third:
        return SvgImagePath.thirdwin;
    }
  }
}

class DailyRankWidget extends HookWidget {
  const DailyRankWidget({super.key, required this.dailyBoxOfficeMovieList});

  final List<DailyBoxOfficeMovieModel> dailyBoxOfficeMovieList;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(dailyBoxOfficeMovieList.length, (index) {
        if (index < 3) {
          return _RankWidget(
            key: ValueKey(dailyBoxOfficeMovieList[index].movieCd),
            rankType: DailyRankType.values[index],
            dailyBoxOfficeMovie: dailyBoxOfficeMovieList[index],
          );
        }
        return _UnknownRankWidget(
          isFirst: index == 3 && dailyBoxOfficeMovieList.length > 3,
          key: ValueKey(dailyBoxOfficeMovieList[index].movieCd),
          dailyBoxOfficeMovie: dailyBoxOfficeMovieList[index],
        );
      }),
    );
  }
}

class _RankWidget extends StatelessWidget {
  const _RankWidget({
    super.key,
    required this.rankType,
    required this.dailyBoxOfficeMovie,
  });

  final DailyRankType rankType;
  final DailyBoxOfficeMovieModel dailyBoxOfficeMovie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgImageWidget(
          imagePath: rankType.imagePath,
          fit: BoxFit.cover,
          width: 48,
          height: 48,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              dailyBoxOfficeMovie.movieNm ?? '제목 없음',
              style: TextStyle().subTitle2,
            ),
            _MovieDetailInfo(dailyBoxOfficeMovie: dailyBoxOfficeMovie),
          ],
        ),
      ],
    );
  }
}

class _UnknownRankWidget extends StatelessWidget {
  const _UnknownRankWidget({
    super.key,
    required this.dailyBoxOfficeMovie,
    this.isFirst = false,
  });

  final DailyBoxOfficeMovieModel dailyBoxOfficeMovie;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          isFirst
              ? const EdgeInsets.only(top: 16)
              : const EdgeInsets.only(top: 0),
      child: Row(
        spacing: 12,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorStyle.primary100,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                dailyBoxOfficeMovie.movieNm ?? '제목 없음',
                style: TextStyle().subTitle3,
              ),
              _MovieDetailInfo(dailyBoxOfficeMovie: dailyBoxOfficeMovie),
            ],
          ),
        ],
      ),
    );
  }
}

class _MovieDetailInfo extends StatelessWidget {
  const _MovieDetailInfo({super.key, required this.dailyBoxOfficeMovie});

  final DailyBoxOfficeMovieModel dailyBoxOfficeMovie;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Row(
          spacing: 4,
          children: [
            Text(
              '개봉일 :',
              style: TextStyle().detail.copyWith(
                color: ColorStyle.coolGray500,
              ),
            ),
            Text(
              '${dailyBoxOfficeMovie.openDt}',
              style: TextStyle().detail,
            ),
          ],
        ),
        Row(
          spacing: 4,
          children: [
            Text(
              '일일 관객수 :',
              style: TextStyle().detail.copyWith(
                color: ColorStyle.coolGray500,
              ),
            ),
            Text(
              '${dailyBoxOfficeMovie.audiCnt}',
              style: TextStyle().detail,
            ),
          ],
        ),
      ],
    );
  }
}

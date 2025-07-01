import 'package:bloc_deep_dive/presentation/movie_detail/data/models/movie_detail_model.dart';
import 'package:bloc_deep_dive/theme/color_style.dart';
import 'package:bloc_deep_dive/theme/text_style.dart';
import 'package:flutter/material.dart';

class MoviePeopleInfo extends StatelessWidget {
  const MoviePeopleInfo({
    super.key,
    required this.movieDetailInfo,
  });

  final MovieDetailInfoModel movieDetailInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '감독',
          style: TextStyle().body2.copyWith(color: ColorStyle.coolGray500),
        ),
        const SizedBox(height: 8),
        Text(
          movieDetailInfo.directors
              .map((director) => director.peopleNm)
              .join(', '),
          style: TextStyle().subTitle1,
        ),
        const SizedBox(height: 16),
        Text(
          '출연',
          style: TextStyle().body2.copyWith(color: ColorStyle.coolGray500),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children:
              movieDetailInfo.actors
                  .map(
                    (actor) => Theme(
                      data: Theme.of(context).copyWith(
                        chipTheme: ChipThemeData(
                          backgroundColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          color: WidgetStateProperty.all(Colors.transparent),
                        ),
                      ),
                      child: Chip(
                        label: Text('${actor.peopleNm}(${actor.cast})'),

                        color: WidgetStateProperty.all(Colors.white),
                        labelStyle: TextStyle().body2,
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}

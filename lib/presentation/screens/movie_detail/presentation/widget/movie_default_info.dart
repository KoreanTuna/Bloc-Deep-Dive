import 'package:door_stamp/presentation/screens/movie_detail/data/models/movie_detail_model.dart';
import 'package:door_stamp/core/theme/color_style.dart';
import 'package:door_stamp/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class MovieDefaultInfo extends StatelessWidget {
  const MovieDefaultInfo({
    super.key,
    required this.movieDetailInfo,
    required this.prevDayTotalAudits,
  });
  final MovieDetailInfoModel movieDetailInfo;
  final int prevDayTotalAudits;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        /// 개봉일
        ///
        _InfoRow(
          key: const Key('movie_default_info_release_date'),
          title: '개봉일',
          value: movieDetailInfo.openDt,
        ),

        /// 전체 관객 수
        ///
        _InfoRow(
          key: const Key('movie_default_info_total_audits'),
          title: '어제 관객 수',
          value: '$prevDayTotalAudits명',
        ),

        /// 런닝 타임
        ///
        _InfoRow(
          key: const Key('movie_default_info_running_time'),
          title: '런닝 타임',
          value: '${movieDetailInfo.showTm}분',
        ),

        /// 제작사
        ///
        _InfoRow(
          key: const Key('movie_default_info_companys'),
          title: '제작사',
          value: movieDetailInfo.companys
              .map((company) => company.companyNm)
              .join(', '),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            title,
            style: TextStyle().body1.copyWith(color: ColorStyle.coolGray500),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle().subTitle3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

import 'package:door_stamp/common/constant/svg_image_path.dart';
import 'package:door_stamp/common/extension/date_time_extension.dart';
import 'package:door_stamp/presentation/widget/image_widget.dart';
import 'package:door_stamp/theme/color_style.dart';
import 'package:door_stamp/theme/text_style.dart';
import 'package:flutter/widgets.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgImageWidget(
          width: 28,
          imagePath: SvgImagePath.logo,
        ),
        const SizedBox(height: 12),
        Text(
          '일일 박스오피스',
          style: TextStyle().title3,
        ),
        const SizedBox(height: 12),
        Text(
          '${DateTime.now().subtract(Duration(days: 1)).koreanDateTime} 기준(어제))',
          style: TextStyle().detail.copyWith(
            color: ColorStyle.coolGray500,
          ),
        ),
      ],
    );
  }
}

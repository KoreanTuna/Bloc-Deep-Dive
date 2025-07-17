import 'package:door_stamp/common/constant/png_image_path.dart';
import 'package:door_stamp/presentation/screens/movie_detail/data/models/movie_detail_model.dart';
import 'package:door_stamp/presentation/widget/image_widget.dart';
import 'package:door_stamp/theme/color_style.dart';
import 'package:door_stamp/theme/text_style.dart';
import 'package:flutter/cupertino.dart';

class MovieGenreInfo extends StatelessWidget {
  const MovieGenreInfo({
    super.key,
    required this.movieDetailInfo,
  });

  final MovieDetailInfoModel movieDetailInfo;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 8,
      ),
      itemCount: movieDetailInfo.genres.length,
      itemBuilder: (context, index) {
        final genre = movieDetailInfo.genres[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),

            border: Border.all(
              color: CupertinoColors.systemGrey3,
              width: 0.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PngImageWidget(
                width: 60,
                imagePath: PngImagePath.movieBubble,
              ),
              const SizedBox(height: 8),
              Text(
                genre.genreNm,
                style: TextStyle().body1.copyWith(
                  color: ColorStyle.coolGray500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

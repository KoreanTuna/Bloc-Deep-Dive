import 'package:door_stamp/common/constant/png_image_path.dart';
import 'package:door_stamp/presentation/screens/on_board/data/models/favorite_genre_model.dart';
import 'package:door_stamp/presentation/widget/image_widget.dart';
import 'package:door_stamp/theme/color_style.dart';
import 'package:door_stamp/theme/text_style.dart';
import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
    required this.genre,
    required this.isSelected,
    required this.onTap,
  });

  final FavoriteGenre genre;
  final bool isSelected;
  final void Function(FavoriteGenre genre) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(genre),
      child: Container(
        width: 128,
        height: 180,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF20212C) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ColorStyle.coolGray500,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SelectCheckBox(
              key: Key(genre.korean),
              onTap: () => onTap(genre),
              isSelected: isSelected,
            ),
            Center(child: PngImageWidget(imagePath: PngImagePath.movieBubble)),
            const SizedBox(height: 16),
            Text(
              genre.korean,
              style: TextStyle().subTitle3.copyWith(
                color: isSelected ? Colors.white : ColorStyle.gray850,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectCheckBox extends StatelessWidget {
  const _SelectCheckBox({
    super.key,
    required this.onTap,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: ColorStyle.coolGray300,
                width: 1,
              ),
              gradient:
                  isSelected
                      ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0, 0.27, 0.48, 0.71, 1],
                        colors: [
                          Color(0xFFF34DAF),
                          Color(0xFF9957E2),
                          Color(0xFF4F8FF7),
                          Color(0xFF72F3F6),
                          Color(0xFF9CFC8B),
                        ],
                      )
                      : null,
            ),
          ),
        ),
      ),
    );
  }
}

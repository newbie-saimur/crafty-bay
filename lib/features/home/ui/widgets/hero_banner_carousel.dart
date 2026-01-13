import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class HeroBannerCarousel extends StatelessWidget {
  const HeroBannerCarousel({
    super.key,
    required ValueNotifier<int> currentSlider,
  }) : _currentSlider = currentSlider;

  final ValueNotifier<int> _currentSlider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 140.0,
            viewportFraction: 1,
            onPageChanged: (int currentIndex, _) {
              _currentSlider.value = currentIndex;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _currentSlider,
          builder: (context, int currentIndex, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: BoxBorder.all(
                        color: currentIndex == i
                            ? AppColors.themeColor
                            : Colors.black12,
                        width: 1.5,
                      ),
                      color: currentIndex == i
                          ? AppColors.themeColor
                          : null,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

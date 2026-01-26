import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({super.key, required this.imageList});

  final List<String> imageList;

  @override
  State<ProductImageCarouselSlider> createState() =>
      _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState
    extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    if (widget.imageList.isEmpty) {
      return SizedBox(
        height: 200,
        child: Center(child: Text("No Image Found")),
      );
    }

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            onPageChanged: (int currentIndex, _) {
              _currentSlider.value = currentIndex;
            },
          ),
          items: widget.imageList.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.themeColor.withValues(alpha: 0.05),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 12,
                      child: ValueListenableBuilder(
                        valueListenable: _currentSlider,
                        builder: (context, int currentIndex, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < widget.imageList.length; i++)
                                Container(
                                  width: 12,
                                  height: 12,
                                  margin: EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: BoxBorder.all(
                                      color: currentIndex == i
                                          ? AppColors.themeColor
                                          : Colors.white,
                                      width: 1.5,
                                    ),
                                    color: currentIndex == i
                                        ? AppColors.themeColor
                                        : Colors.white,
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

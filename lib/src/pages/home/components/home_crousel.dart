import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_beginnings/src/app/app_export.dart';

class HomeCarouselWidget extends StatelessWidget {
  const HomeCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(23.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 19,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
        ),
        items: [
          GestureDetector(
            onTap: () {
              debugPrint('Tapped on Image');
            },
            child: const Image(
              image: AssetImage(AssetsConstants.crouselImage1),
            ),
          ),
          const Image(
            image: AssetImage(AssetsConstants.crouselImage1),
          ),
          const Image(
            image: AssetImage(AssetsConstants.crouselImage1),
          ),
        ],
      ),
    );
  }
}

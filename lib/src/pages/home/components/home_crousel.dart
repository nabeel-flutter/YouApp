import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_beginnings/src/app/app_export.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({Key? key}) : super(key: key);

  @override
  _HomeCarouselWidgetState createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(23.0),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 19,
              viewportFraction: 1,
              initialPage: _currentIndex,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
            ),
            items: [
              GestureDetector(
                onTap: () {
                  context.router.push(const AllDoctorsRoute());
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
          // Positioned(
          //   bottom: 10,
          //   right: 10,
          //   child: DotsIndicator(
          //     axis: Axis.horizontal,
          //     decorator: DotsDecorator(
          //       color: ColorConstants.white,
          //       activeColor: ColorConstants.subTextColor,
          //       activeSize: const Size(18, 8),
          //       size: const Size(8, 8),
          //       spacing: const EdgeInsets.symmetric(horizontal: 4),
          //       activeShape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //     ),
          //     dotsCount: 3,
          //     position: _currentIndex,
          //     reversed: false,
          //   ),
          // ),
        ],
      ),
    );
  }
}

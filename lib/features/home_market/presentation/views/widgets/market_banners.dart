import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/utils/app_colors.dart';

class MarketBanners extends StatefulWidget {
  const MarketBanners({super.key, required this.banners});
  final List<ImageURL> banners;
  @override
  State<MarketBanners> createState() => _MarketBannersState();
}

class _MarketBannersState extends State<MarketBanners> {
  late CarouselSliderController carouselController;
  int _currentIndex = 0;
  @override
  void initState() {
    carouselController = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount: widget.banners.length,
          itemBuilder: (context, index, realIndex) {
            final bannerImage = widget.banners[index].secureUrl;
            return Container(
              height: 160.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(bannerImage),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              4,
              (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 8.h,
                    width: index == _currentIndex ? 30.w : 8.w,
                    decoration: BoxDecoration(
                      color: index == _currentIndex
                          ? AppColors.primarybright
                          : AppColors.grayMediumlight,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

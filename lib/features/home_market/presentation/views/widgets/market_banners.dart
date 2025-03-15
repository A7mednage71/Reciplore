import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';

class MarketBanners extends StatefulWidget {
  const MarketBanners({super.key, this.images});
  final List<String>? images;
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

  List<String> banners = [
    'https://img.freepik.com/free-psd/new-collection-fashion-sale-web-banner-template_120329-1507.jpg?semt=ais_hybrid',
    'https://img.freepik.com/premium-psd/special-black-friday-women-bag-sale-banner-template_361928-1604.jpg?semt=ais_hybrid',
    'https://img.freepik.com/premium-psd/modern-furniture-sale-banner-design_345426-597.jpg?w=740',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount:
              widget.images != null ? widget.images!.length : banners.length,
          itemBuilder: (context, index, realIndex) {
            final bannerImage =
                widget.images != null ? widget.images![index] : banners[index];
            return Padding(
              padding: EdgeInsets.all(5.r),
              child: Container(
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(bannerImage),
                  ),
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

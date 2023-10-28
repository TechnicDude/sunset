import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sunsetgardenapp/api/api.dart';
import 'package:sunsetgardenapp/model/bannerModel.dart';
import 'package:sunsetgardenapp/utils/loaderscreen.dart';
import 'package:sunsetgardenapp/utils/loaderscreennew.dart';

final List<String> imgList = [
  'https://img.freepik.com/free-vector/architectural-style-evolution-image-modern-urban-residential-housing-apartment-blocks-3-concrete-multistory-buildings-illustration_1284-62260.jpg',
  'https://media.istockphoto.com/id/1157525825/photo/modern-apartment-buildings.jpg?s=612x612&w=0&k=20&c=3FYeLpBDu-8599WTxWZDyPgxPrfLiEJ-AMZlA3xTx6s=',
  'https://media.istockphoto.com/id/585292106/photo/3d-render-of-3-buildings-exterior.jpg?s=612x612&w=0&k=20&c=E78xCZwDHy9RioxSeXuZLbmOmBcQoIxwsmU9tXZoYJE=',
];

class SliderScreen extends StatelessWidget {
  final List<BannerData>? bannerdata;
  const SliderScreen({Key? key, this.bannerdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(bannerdata!.length);

    return ClipRRect(
      borderRadius: BorderRadius.circular(2.w),
      child: CarouselSlider.builder(
        itemCount: bannerdata!.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return InkWell(
            onTap: () {},
            child: CachedNetworkImage(
              imageUrl: APIURL.imageurl + bannerdata![itemIndex].image!,
              width: 100.w,
              fit: BoxFit.cover,
              placeholder: (context, url) => LoaderScreen(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        },
        options: CarouselOptions(
          enlargeCenterPage: false,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
        ),
      ),
    );
  }
}

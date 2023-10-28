import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainBarBottom extends StatelessWidget {
  final String? image;

  const MainBarBottom({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          height: 3.h,
          child: Center(
            child: Image.asset(
              image ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}

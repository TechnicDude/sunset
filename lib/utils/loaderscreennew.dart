import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';

class LoaderScreennew extends StatelessWidget {
  const LoaderScreennew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 30.h,
        child: SpinKitCircle(itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index.isEven
                  ? AppColors.splashloaderonecolor
                  : AppColors.splashloaderseccolor,
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class TextFormScreen extends StatelessWidget {
  final TextEditingController textEditingController;

  final String hinttext;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscure;
  final bool obscure1;
  final bool suffixIcon;
  final Widget? suffixIconWidget;
  final void Function()? onPressed;
  final TextInputType? keyboardType;

  const TextFormScreen({
    Key? key,
    required this.textEditingController,
    required this.hinttext,
    required this.icon,
    this.obscure = true,
    this.obscure1 = true,
    this.validator,
    this.readOnly = false,
    this.suffixIcon = false,
    this.suffixIconWidget,
    this.onPressed,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: textEditingController,
        readOnly: readOnly,
        obscureText: suffixIcon ? obscure : false,
        // obscureText1: suffixIcon ? obscure : false,
        keyboardType: keyboardType ?? TextInputType.text,
        cursorColor: AppColors.primarycolors,
        style: AppStyles.onboardbody.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
            fontSize: 16.5.sp),
        decoration: InputDecoration(
            fillColor: AppColors.colortextgrey,
            filled: true,
            hintText: hinttext,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                color: AppColors.colorgrey,
                fontFamily: 'Poppins'),
            contentPadding: const EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 10.0),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(2.w),
                )),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(2.w),
                )),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.all(
                  Radius.circular(2.w),
                )),
            prefixIcon: Icon(
              icon,
              size: 2.5.h,
              color: AppColors.primarycolors,
            ),
            suffixIcon: suffixIcon
                ? suffixIconWidget ??
                    IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          size: 2.5.h,
                          obscure ? Icons.visibility_off : Icons.visibility,
                          //   obscure1 ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.colorgrey,
                        ))
                : null),
        validator: validator,
      ),
    );
  }
}

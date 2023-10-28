// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sunsetgardenapp/localization/locale_constants.dart';
// import 'package:sunsetgardenapp/model/language_model.dart';
// import 'package:sunsetgardenapp/utils/appcolors.dart';

// class EditLanguagePopup extends StatefulWidget {
//   final Function? callback;
//   EditLanguagePopup({this.callback, super.key});

//   @override
//   State<EditLanguagePopup> createState() => _EditLanguagePopupState();
// }

// class _EditLanguagePopupState extends State<EditLanguagePopup> {
//   List<bool> checklanguage = [true, false];
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.all(2.h),
//         child: Stack(clipBehavior: Clip.none, children: [
//           Container(
//             // height: 40.h,
//             width: 90.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(2.h)),

//               //   border: Border.all(color: AppColors.whiteColor, width: 0.2),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey,
//                   spreadRadius: 1,
//                   blurRadius: 2,
//                   offset: Offset(1, 2),
//                 ),
//               ],
//               gradient: LinearGradient(
//                   colors: [
//                     AppColors.primarycolors,
//                     AppColors.secondrycolors,
//                   ],
//                   begin: const FractionalOffset(0.0, 0.0),
//                   end: const FractionalOffset(1.0, 0.0),
//                   stops: [0.0, 1.0],
//                   tileMode: TileMode.clamp),
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     IconButton(
//                       color: AppColors.colorswhite,
//                       onPressed: () {
//                         widget.callback!("ok");
//                       },
//                       icon: Icon(Icons.close),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     SizedBox(
//                       height: 1.h,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(2.h),
//                       child: ListView.builder(
//                           itemCount: 1,
//                           shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           itemBuilder: (context, index) {
//                             return Column(
//                               children: [
//                                 for (int i = 0;
//                                     i < LanguageModel.languageList().length;
//                                     i++)
//                                   InkWell(
//                                     onTap: () async {
//                                       for (int j = 0;
//                                           j < checklanguage.length;
//                                           j++) {
//                                         setState(() {
//                                           checklanguage[j] = false;
//                                         });
//                                       }

//                                       log(LanguageModel.languageList()[i]
//                                           .languageCode);
//                                       changeLanguage(
//                                           context,
//                                           LanguageModel.languageList()[i]
//                                               .languageCode);
//                                       SharedPreferences _prefs =
//                                           await SharedPreferences.getInstance();
//                                       String languageCode = _prefs.getString(
//                                               prefSelectedLanguageCode) ??
//                                           "en";
//                                       setState(() {
//                                         AppHelper.language =
//                                             LanguageModel.languageList()[i]
//                                                 .languageCode;
//                                       });

//                                       await _prefs.setString(
//                                           prefSelectedLanguageCode,
//                                           LanguageModel.languageList()[i]
//                                               .languageCode);
//                                       if (languageCode ==
//                                           LanguageModel.languageList()[i]
//                                               .languageCode) {
//                                         setState(() {
//                                           checklanguage[i] = true;
//                                         });
//                                       }

//                                       // Navigator.pushNamed(
//                                       //     context, Routes.onBoardScreen);
//                                     },
//                                     child: Padding(
//                                       padding: EdgeInsets.only(bottom: 2.h),
//                                       child: Container(
//                                         width: 80.w,
//                                         // height: 11.h,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(2.h),
//                                           border: checklanguage[i]
//                                               ? Border.all(
//                                                   color: AppColors.blackColor,
//                                                   width: 1)
//                                               : Border.all(
//                                                   color:
//                                                       AppColors.primarycolors,
//                                                   width: 1),
//                                         ),
//                                         child: Padding(
//                                           padding: EdgeInsets.all(2.h),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             // mainAxisAlignment:
//                                             //     MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 LanguageModel.languageList()[i]
//                                                     .flag,
//                                                 style: AppStyles.onboardtitle
//                                                     .copyWith(
//                                                         color: Colors.black,
//                                                         fontSize: 16.sp),
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     LanguageModel
//                                                             .languageList()[i]
//                                                         .name,
//                                                     style: AppStyles
//                                                         .onboardtitle
//                                                         .copyWith(
//                                                             color: AppColors
//                                                                 .primarycolors,
//                                                             fontSize: 14.sp),
//                                                   ),
//                                                   if (checklanguage[i])
//                                                     Icon(
//                                                       Icons.done,
//                                                       color: Colors.red,
//                                                     )
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             );
//                           }),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

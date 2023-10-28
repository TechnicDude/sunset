import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appbarforall.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/title_text_style.dart';
import 'package:sunsetgardenapp/view/screens/favoriteScreen/components/favoriteScreenCardUI.dart';

class FavoriteScreenActivity extends StatefulWidget {
  const FavoriteScreenActivity({super.key});

  @override
  State<FavoriteScreenActivity> createState() => _FavoriteScreenActivityState();
}

class _FavoriteScreenActivityState extends State<FavoriteScreenActivity> {
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorswhite,
        appBar: AppBar(
          backgroundColor: AppColors.colorswhite,
          iconTheme: const IconThemeData(
            color: AppColors.blackColor,
          ),
          elevation: 0,
          centerTitle: true,
          title: const TitleTextStyle(
            text: "My Favorites",
          ),
        ),
        body: Padding(
            padding:
                EdgeInsets.only(top: 1.h, bottom: 2.h, left: 2.w, right: 2.w),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: sercheditcontroler,
                        onChanged: ((value) {
                          setState(() {
                            searchString = sercheditcontroler.text;
                          });
                        }),
                        cursorColor: AppColors.primarycolors,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.colorgreydark),
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.w),
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.colorgreydark),
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.w),
                              )),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.colorgreydark),
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.w),
                              )),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: AppColors.primarycolors,
                            onPressed: () {
                              setState(() {
                                sercheditcontroler.clear();
                                searchString = '';
                              });
                            },
                          ),
                          hintText: 'favorite search...',
                          hintStyle: AppStyles.onboardbody
                              .copyWith(color: AppColors.colorgrey),
                        ),
                      ),
                    ],
                  ),
                ),

                Flexible(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: favoriteScreenCardUI(),
                            ),
                          );
                        })),

              ],
            )));
  }
}

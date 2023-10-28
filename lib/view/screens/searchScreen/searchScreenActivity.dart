import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appbarforall.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/view/screens/searchScreen/components/searchcardui.dart';

class SearchScreentActivity extends StatefulWidget {
  const SearchScreentActivity({super.key});

  @override
  State<SearchScreentActivity> createState() => _SearchScreentActivityState();
}

class _SearchScreentActivityState extends State<SearchScreentActivity> {
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBarScreens(
            text: "Search",
          ),
          preferredSize: Size(
              MediaQuery.of(context).size.width, AppBar().preferredSize.height),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(top: 2.h, bottom: 2.h, left: 2.w, right: 2.w),
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
                        hintText: 'search here ...',
                        hintStyle: AppStyles.onboardbody
                            .copyWith(color: AppColors.colorgrey),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${24} serach founds",
                          style: AppStyles.onboardsubtitle
                              .copyWith(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HomeSearchScreenActivityCard(),
                          ),
                        );
                      })),
            ],
          ),
        ));
  }
}

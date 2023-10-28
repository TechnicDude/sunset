import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/provider/DashboardServicesProvider.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/loaderscreen.dart';
import 'package:sunsetgardenapp/utils/loaderscreennew.dart';
import 'package:sunsetgardenapp/utils/nodatafounerror.dart';
import 'package:sunsetgardenapp/utils/title_text_bodystyle.dart';
import 'package:sunsetgardenapp/view/screens/homedashboard/homecardscreenui.dart';
import 'package:sunsetgardenapp/view/screens/homedashboard/sliderscreen.dart';
import 'package:sunsetgardenapp/view/screens/servicesScreens/components/ServicerecentcardSCreenACtivity.dart';

class ServicesScreenActivity extends StatefulWidget {
  // final String bannername;
  // final String servicetypeId;
  const ServicesScreenActivity({super.key});
  //required this.servicetypeId, required this.bannername,

  @override
  State<ServicesScreenActivity> createState() => _ServicesScreenActivityState();
}

class _ServicesScreenActivityState extends State<ServicesScreenActivity> {
  bool searchshow = false;
  TextEditingController sercheditcontroler = TextEditingController();

  DashBoradServicesProvider _dashBoradServicesProvider =
      DashBoradServicesProvider();

  @override
  void initState() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    _dashBoradServicesProvider =
        Provider.of<DashBoradServicesProvider>(context, listen: false);
    getalldata();
    print("userid ${AppHelper.userid}");
    print(AppHelper.userid);
    print(AppHelper.AUTH_TOKEN_VALUE);
    super.initState();
  }

  getalldata() async {
    await _dashBoradServicesProvider.bannerlist("services/");
    await _dashBoradServicesProvider.servicelist();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradServicesProvider>(
        builder: (context, dashBoradServicesProvider, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: searchshow
                ? Container(
                    width: double.infinity,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: AppColors.primarycolors, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: sercheditcontroler,
                          onSubmitted: ((value) {
                            // setState(() {
                            //   Adsprovider.allAdsdataserch(sercheditcontroler.text);
                            //   Adsprovider.allAdsSearch = true;
                            // });
                          }),
                          // onChanged: ((value) {
                          // }),
                          decoration: InputDecoration(
                              isDense: true,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: AppColors.primarycolors,
                                ),
                                onPressed: () {
                                  print("object ok");
                                  setState(() {
                                    searchshow = false;
                                    sercheditcontroler.clear();
                                  });
                                },
                              ),
                              hintText: "search",
                              hintStyle: AppStyles.onboardsubtitle
                                  .copyWith(fontSize: 14.sp),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  )
                : Text(
                    "Services",
                    style: AppStyles.onboardtitle.copyWith(fontSize: 17.sp),
                  ),
            leading: InkWell(
              child: Icon(
                Icons.arrow_back,
                color: AppColors.blackColor,
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.dashBoardScreenActivity);
                // Navigator.pop(context);
              },
            ),
            automaticallyImplyLeading: false,
            actions: [
              if (!searchshow)
                IconButton(
                  onPressed: () {
                    setState(() {
                      searchshow = true;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.blackColor,
                  ),
                ),
            ],
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.colorswhite,
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 3.w, right: 3.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        if (dashBoradServicesProvider.bannerList.isNotEmpty)
                          SliderScreen(
                              bannerdata: dashBoradServicesProvider.bannerList),
                        dashBoradServicesProvider.dashboardServicesModel.data !=
                                null
                            ? dashBoradServicesProvider.datanotfound
                                ? NoDataFoundErrorScreens(
                                    height: 50.h,
                                    title: "no data found",
                                  )
                                : HomeServiceContainerCard(
                                    servicelistdata:
                                        dashBoradServicesProvider.serviceList,
                                    type: "servicelisttype",
                                    searchString: '',
                                  )
                            : LoaderScreennew(),
                        TitleTextbodyStyle(
                          text: "Recent Booking",
                          style:
                              AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const Divider(
                          color: AppColors.primarycolors,
                          thickness: 2,
                        ),
                        const ServicerecentcardSCreenActivity(),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

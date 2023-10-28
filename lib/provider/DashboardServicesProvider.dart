import 'package:flutter/cupertino.dart';
import 'package:sunsetgardenapp/api/api.dart';
import 'package:sunsetgardenapp/api/network.dart';
import 'package:sunsetgardenapp/model/DashboardServicesModel.dart';
import 'package:sunsetgardenapp/model/bannerModel.dart';

class DashBoradServicesProvider extends ChangeNotifier {
  BannerListModel bannerListModel = BannerListModel();
  DashboardServicesModel dashboardServicesModel = DashboardServicesModel();

  List<BannerData> _bannerlist = [];
  List<BannerData> get bannerList => _bannerlist;

  List<ServicesData> _servicelist = [];
  List<ServicesData> get serviceList => _servicelist;

  bool datanotfound = false;
  bool bannerfetch = false;
  bool servicefetch = false;

  Future bannerlist(String bannertype) async {
    ServiceWithHeader _service =
        new ServiceWithHeader(APIURL.BANNERURL + bannertype);
    final response = await _service.data();
    bannerListModel = BannerListModel.fromJson(response);
    if (bannerListModel.data != null) {
      if (bannerListModel.data!.isNotEmpty) {
        _bannerlist = [];
        for (int i = 0; i < bannerListModel.data!.length; i++) {
          _bannerlist.add(bannerListModel.data![i]);
        }
      }
    }
    notifyListeners();
    return;
  }

  Future servicelist() async {
    servicefetch = false;
    var url = APIURL.services;
    ServiceWithHeader service = ServiceWithHeader(url);
    final response = await service.data();
    dashboardServicesModel = DashboardServicesModel.fromJson(response);
    _servicelist = [];
    if (dashboardServicesModel.data != null) {
      if (dashboardServicesModel.data!.isNotEmpty) {
        for (int i = 0; i < dashboardServicesModel.data!.length; i++) {
          _servicelist.add(dashboardServicesModel.data![i]);
        }
      }
    }
    servicefetch = true;
    notifyListeners();
    return;
  }

}

import 'package:flutter/cupertino.dart';
import 'package:sunsetgardenapp/api/api.dart';
import 'package:sunsetgardenapp/api/network.dart';
import 'package:sunsetgardenapp/model/bannerModel.dart';
class DashBoradProvider extends ChangeNotifier {

  BannerListModel bannerListModel = BannerListModel();

  List<BannerData> _bannerlist = [];
  List<BannerData> get bannerList => _bannerlist;

  bool datanotfound = false;

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
}

import 'package:flutter/material.dart';
import 'package:sunsetgardenapp/api/api.dart';
import 'package:sunsetgardenapp/api/network.dart';
import 'package:sunsetgardenapp/model/profilemodel.dart';
class ProfileUserProvider extends ChangeNotifier {
  ProfileUserModel profileuserModel = ProfileUserModel();

  List<ProfileUserData> _profileuserlist = [];
  List<ProfileUserData> get profileuserList => _profileuserlist;

  bool datanotfound = false;

  Future profileuserlist(String email) async {

    print("object data");

    var url = APIURL.USERPROFILE; //HOME + '/' + AppHelper.userid!;
    ServiceWithHeader _service = ServiceWithHeader(url);
    final response = await _service.data();
    print(response);
    _profileuserlist = [];
    profileuserModel = ProfileUserModel.fromJson(response);
    if (profileuserModel.data != null) {
      var profileuser = profileuserModel.data;
      _profileuserlist.add(profileuser!);
      notifyListeners();
    }
  }
}

import 'package:sunsetgardenapp/api/api.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/api/network.dart';

class LoginApi {
  final Map<String, dynamic> body;
  LoginApi(this.body);

  Future register() async {
    Service service = Service(APIURL.REGISTRATION, body);
    var data = await service.formdata();
    return data;
  }

  // Future verify() async {
  //   Service service = new Service(VERIFY, body);
  //   var data = await service.formdata();
  //   return data;
  // }

  Future login() async {
    Service service = Service(APIURL.LOGIN, body);
    var data = await service.formdata();
    return data;
  }

  Future verifyOtp() async {
    Service service = Service(APIURL.VERIFYOTP, body);
    var data = await service.formdata();

    return data;
  }

  Future sentotp() async {
    Service service = Service(APIURL.FORGETVERIFYOTP, body);
    var data = await service.formdata();

    return data;
  }
  // Future socialmedialogin() async {
  //   Service service = Service(APIURL.socialmediaLOGIN, body);
  //   var data = await service.formdata();
  //   return data;
  // }

  // Future googlesocialmedialogin() async {
  //   Service service = Service(APIURL.googlesocialmediaLOGIN, body);
  //   var data = await service.formdata();
  //   return data;
  // }

  // Future facebooksocialmedialogin() async {
  //   Service service = Service(APIURL.facebooksocialmediaLOGIN, body);
  //   var data = await service.formdata();
  //   return data;
  // }

  // Future appleocialmedialogin() async {
  //   Service service = Service(APIURL.applesocialmediaLOGIN, body);
  //   var data = await service.formdata();
  //   return data;
  // }

  // Future iostransactionsupdateuser() async {
  //   ServiceWithHeaderWithbody service =
  //       new ServiceWithHeaderWithbody(APIURL.transactionsupdateuser, body);
  //   var data = await service.postdatawithoutbody();
  //   return data;
  // }

  // Future factokenregister() async {
  //   ServiceWithHeaderWithbody service =
  //       ServiceWithHeaderWithbody(APIURL.registerfcmtoken, body);
  //   var data = await service.postdatawithoutbody();

  //   return data;
  // }

  // Future forgetverifyOtp() async {
  //   Service service = Service(APIURL.FORGETVERIFYOTP, body);
  //   var data = await service.formdata();

  //   return data;
  // }

  Future forgetpassword() async {
    Service service = Service(APIURL.FORGETPASSWORD, body);
    var data = await service.formdata();

    return data;
  }

  Future changenewPassword() async {
    Service service = Service(APIURL.SETNEWPASSWORD, body);
    var data = await service.formdata();
    return data;
  }

  Future changepassword() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(APIURL.CHANGEPASSWORD, body);
    var data = await service.postdatawithoutbody();
    return data;
  }

  Future userprofile() async {
    Service service = Service(APIURL.USERPROFILE, body);
    var data = await service.formdata();
    return data;
  }

  Future updateprofile() async {
    var url = APIURL.USERPROFILEUPDATE + AppHelper.userid!;
    ServicePUT service = ServicePUT(url, body);
    var data = await service.formdata();
    return data;
  }

  Future deleteaccount(String id) async {
    ServiceWithDelete service = ServiceWithDelete(
      APIURL.deleteaccount + id,
    );
    var data = await service.data();
    return data;
  }
}

class ProfileUserModel {
  String? status;
  ProfileUserData? data;

  ProfileUserModel({this.status, this.data});

  ProfileUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new ProfileUserData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileUserData {
  String? id;
  String? userAvatar;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? userType;
  String? userRole;
  int? phoneNumber;
  String? dateOfBirth;
  String? status;

  ProfileUserData(
      {this.id,
      this.userAvatar,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.userType,
      this.userRole,
      this.phoneNumber,
      this.dateOfBirth,
      this.status});

  ProfileUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userAvatar = json['user_avatar'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    emailAddress = json['email_address'];
    userType = json['user_type'];
    userRole = json['user_role'];
    phoneNumber = json['phone_number'];
    dateOfBirth = json['date_of_birth'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_avatar'] = this.userAvatar;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email_address'] = this.emailAddress;
    data['user_type'] = this.userType;
    data['user_role'] = this.userRole;
    data['phone_number'] = this.phoneNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['status'] = this.status;
    return data;
  }
}

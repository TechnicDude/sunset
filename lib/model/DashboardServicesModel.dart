class DashboardServicesModel {
  String? status;
  String? message;
  int? total;
  List<ServicesData>? data;

  DashboardServicesModel({this.status, this.message, this.total, this.data});

  DashboardServicesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <ServicesData>[];
      json['data'].forEach((v) {
        data!.add(new ServicesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServicesData {
  String? id;
  String? serviceName;
  String? image;
  String? colour;
  String? note;
  String? status;

  ServicesData(
      {this.id,
      this.serviceName,
      this.image,
      this.colour,
      this.note,
      this.status});

  ServicesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['serviceName'];
    image = json['image'];
    colour = json['colour'];
    note = json['note'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceName'] = this.serviceName;
    data['image'] = this.image;
    data['colour'] = this.colour;
    data['note'] = this.note;
    data['status'] = this.status;
    return data;
  }
}

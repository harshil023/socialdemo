class LoginMaster {
  int? code;
  String? message;
  LoginDetails? data;

  LoginMaster({this.code, this.message, this.data});

  LoginMaster.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new LoginDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginDetails {
  int? id;
  String? name;
  String? email;
  String? token;

  LoginDetails({this.id, this.name, this.email, this.token});

  LoginDetails.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    email = json['Email'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Token'] = this.token;
    return data;
  }
}
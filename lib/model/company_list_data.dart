class CompanyListData {
  CompanyListData({
      this.appDetail, 
      this.companies,});

  CompanyListData.fromJson(dynamic json) {
    appDetail = json['appDetail'] != null ? AppDetail.fromJson(json['appDetail']) : null;
    if (json['companies'] != null) {
      companies = [];
      json['companies'].forEach((v) {
        companies?.add(Companies.fromJson(v));
      });
    }
  }
  AppDetail? appDetail;
  List<Companies>? companies;
CompanyListData copyWith({  AppDetail? appDetail,
  List<Companies>? companies,
}) => CompanyListData(  appDetail: appDetail ?? this.appDetail,
  companies: companies ?? this.companies,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (appDetail != null) {
      map['appDetail'] = appDetail?.toJson();
    }
    if (companies != null) {
      map['companies'] = companies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Companies {
  Companies({
      this.createdOn, 
      this.companyId, 
      this.parentCompanyId, 
      this.appId, 
      this.name, 
      this.address, 
      this.contactPerson, 
      this.email, 
      this.mobileNo, 
      this.status,});

  Companies.fromJson(dynamic json) {
    createdOn = json['createdOn'];
    companyId = json['companyId'];
    parentCompanyId = json['parentCompanyId'];
    appId = json['appId'];
    name = json['name'];
    address = json['address'];
    contactPerson = json['contactPerson'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    status = json['status'];
  }
  num? createdOn;
  num? companyId;
  num? parentCompanyId;
  num? appId;
  String? name;
  String? address;
  String? contactPerson;
  String? email;
  String? mobileNo;
  num? status;
Companies copyWith({  num? createdOn,
  num? companyId,
  num? parentCompanyId,
  num? appId,
  String? name,
  String? address,
  String? contactPerson,
  String? email,
  String? mobileNo,
  num? status,
}) => Companies(  createdOn: createdOn ?? this.createdOn,
  companyId: companyId ?? this.companyId,
  parentCompanyId: parentCompanyId ?? this.parentCompanyId,
  appId: appId ?? this.appId,
  name: name ?? this.name,
  address: address ?? this.address,
  contactPerson: contactPerson ?? this.contactPerson,
  email: email ?? this.email,
  mobileNo: mobileNo ?? this.mobileNo,
  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdOn'] = createdOn;
    map['companyId'] = companyId;
    map['parentCompanyId'] = parentCompanyId;
    map['appId'] = appId;
    map['name'] = name;
    map['address'] = address;
    map['contactPerson'] = contactPerson;
    map['email'] = email;
    map['mobileNo'] = mobileNo;
    map['status'] = status;
    return map;
  }

}

class AppDetail {
  AppDetail({
      this.id, 
      this.name, 
      this.version, 
      this.tagline, 
      this.imageLogo, 
      this.imageHome, 
      this.autoUpdate, 
      this.ssoClinetId, 
      this.ssoClinetKey,});

  AppDetail.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    version = json['version'];
    tagline = json['tagline'];
    imageLogo = json['imageLogo'];
    imageHome = json['imageHome'];
    autoUpdate = json['autoUpdate'];
    ssoClinetId = json['ssoClinetId'];
    ssoClinetKey = json['ssoClinetKey'];
  }
  num? id;
  String? name;
  String? version;
  String? tagline;
  String? imageLogo;
  String? imageHome;
  bool? autoUpdate;
  String? ssoClinetId;
  String? ssoClinetKey;
AppDetail copyWith({  num? id,
  String? name,
  String? version,
  String? tagline,
  String? imageLogo,
  String? imageHome,
  bool? autoUpdate,
  String? ssoClinetId,
  String? ssoClinetKey,
}) => AppDetail(  id: id ?? this.id,
  name: name ?? this.name,
  version: version ?? this.version,
  tagline: tagline ?? this.tagline,
  imageLogo: imageLogo ?? this.imageLogo,
  imageHome: imageHome ?? this.imageHome,
  autoUpdate: autoUpdate ?? this.autoUpdate,
  ssoClinetId: ssoClinetId ?? this.ssoClinetId,
  ssoClinetKey: ssoClinetKey ?? this.ssoClinetKey,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['version'] = version;
    map['tagline'] = tagline;
    map['imageLogo'] = imageLogo;
    map['imageHome'] = imageHome;
    map['autoUpdate'] = autoUpdate;
    map['ssoClinetId'] = ssoClinetId;
    map['ssoClinetKey'] = ssoClinetKey;
    return map;
  }

}
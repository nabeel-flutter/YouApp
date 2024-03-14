class UserDetails {
  bool? success;
  Data? data;

  UserDetails({this.success, this.data});

  UserDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? avatar;
  String? alternatePhone;
  String? ssn;
  String? birthDate;
  String? paymentType;
  String? preferredLocation;
  String? suffix;
  GeoLocation? geoLocation;
  InsuranceDetails? insuranceDetails;
  String? role;
  String? insuranceId;

  Data(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.avatar,
      this.alternatePhone,
      this.ssn,
      this.birthDate,
      this.paymentType,
      this.preferredLocation,
      this.suffix,
      this.geoLocation,
      this.insuranceDetails,
      this.role,
      this.insuranceId});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    alternatePhone = json['alternatePhone'];
    ssn = json['ssn'];
    birthDate = json['birthDate'];
    paymentType = json['paymentType'];
    preferredLocation = json['preferredLocation'];
    suffix = json['suffix'];
    geoLocation = json['geoLocation'] != null
        ? new GeoLocation.fromJson(json['geoLocation'])
        : null;
    insuranceDetails = json['insuranceDetails'] != null
        ? new InsuranceDetails.fromJson(json['insuranceDetails'])
        : null;
    role = json['role'];
    insuranceId = json['insuranceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['alternatePhone'] = this.alternatePhone;
    data['ssn'] = this.ssn;
    data['birthDate'] = this.birthDate;
    data['paymentType'] = this.paymentType;
    data['preferredLocation'] = this.preferredLocation;
    data['suffix'] = this.suffix;
    if (this.geoLocation != null) {
      data['geoLocation'] = this.geoLocation!.toJson();
    }
    if (this.insuranceDetails != null) {
      data['insuranceDetails'] = this.insuranceDetails!.toJson();
    }
    data['role'] = this.role;
    data['insuranceId'] = this.insuranceId;
    return data;
  }
}

class GeoLocation {
  String? address;
  String? country;
  String? state;
  String? city;
  String? zip;

  GeoLocation({this.address, this.country, this.state, this.city, this.zip});

  GeoLocation.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zip'] = this.zip;
    return data;
  }
}

class InsuranceDetails {
  String? insuranceName;
  String? insurancePolicy;
  String? frontPic;
  String? backPic;

  InsuranceDetails(
      {this.insuranceName, this.insurancePolicy, this.frontPic, this.backPic});

  InsuranceDetails.fromJson(Map<String, dynamic> json) {
    insuranceName = json['insuranceName'];
    insurancePolicy = json['insurancePolicy'];
    frontPic = json['frontPic'];
    backPic = json['backPic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insuranceName'] = this.insuranceName;
    data['insurancePolicy'] = this.insurancePolicy;
    data['frontPic'] = this.frontPic;
    data['backPic'] = this.backPic;
    return data;
  }
}

class LogDetails {
  bool? success;
  List<LogData>?
      data; // Change this to a list to handle multiple LogData objects

  LogDetails({this.success, this.data});

  LogDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = []; // Initialize the list
      json['data'].forEach((v) {
        data!.add(new LogData.fromJson(
            v)); // Create a LogData object for each item in the list
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this
          .data!
          .map((v) => v.toJson())
          .toList(); // Convert each LogData object back to JSON
    }
    return data;
  }
}

class LogData {
  String? createdAt;
  String? id;
  String? appointmentDate;
  String? method;
  String? type;
  String? request;
  String? userId;
  String? paymentType;
  String? paymentStatus;
  String? timeSlot;
  String? isApproved;
  String? serviceName;
  double? price;
  String? email;
  String? location;
  String? name;
  String? avatar;

  LogData(
      {this.createdAt,
      this.id,
      this.appointmentDate,
      this.method,
      this.type,
      this.request,
      this.userId,
      this.paymentType,
      this.paymentStatus,
      this.timeSlot,
      this.isApproved,
      this.serviceName,
      this.price,
      this.email,
      this.location,
      this.name,
      this.avatar});

  LogData.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['_id'];
    appointmentDate = json['appointmentDate'];
    method = json['method'];
    type = json['type'];
    request = json['request'];
    userId = json['userId'];
    paymentType = json['paymentType'];
    paymentStatus = json['paymentStatus'];
    timeSlot = json['timeSlot'];
    isApproved = json['isApproved'];
    serviceName = json['serviceName'];
    // Adjusting to handle the case where json['price'] might be an int or a double
    if (json['price'] is int) {
      price = (json['price'] as int).toDouble();
    } else {
      price = json['price'];
    }
    email = json['email'];
    location = json['location'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['_id'] = id;
    data['appointmentDate'] = appointmentDate;
    data['method'] = method;
    data['type'] = type;
    data['request'] = request;
    data['userId'] = userId;
    data['paymentType'] = paymentType;
    data['paymentStatus'] = paymentStatus;
    data['timeSlot'] = timeSlot;
    data['isApproved'] = isApproved;
    data['serviceName'] = serviceName;
    data['price'] = price;
    data['email'] = email;
    data['location'] = location;
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }
}

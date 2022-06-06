class MdkDriver {
  MdkDriver({
    required this.status,
    required this.response,
  });
  late final int status;
  late final Response response;

  MdkDriver.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = Response.fromJson(json['response']);
  }
}

class Response {
  Response({
    required this.msg,
    required this.status,
    required this.data,
  });
  late final String msg;
  late final int status;
  late final Data data;

  Response.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.image,
    required this.id,
    required this.driverName,
    required this.email,
    required this.mobile,
  });
  late final String image;
  late final String id;
  late final String driverName;
  late final String email;
  late final String mobile;

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    driverName = json['driverName'];
    email = json['email'];
    mobile = json['mobile'];
  }
}

class Profile {
  Profile({
    required this.status,
    required this.response,
  });
  late final int status;
  late final Response response;

  Profile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = Response.fromJson(json['response']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['response'] = response.toJson();
    return _data;
  }
}

class Response {
  Response({
    required this.msg,
    required this.data,
  });
  late final String msg;
  late final Data data;

  Response.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.website,
    required this.address,
    required this.image,
    required this.mobile,
    required this.phone,
    required this.username,
  });
  late final String id;
  late final String name;
  late final String email;
  late final String website;
  late final String address;
  late final String image;
  late final String mobile;
  late final String phone;
  late final String username;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    website = json['website'];
    address = json['address'];
    image = json['image'];
    mobile = json['mobile'];
    phone = json['phone'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['website'] = website;
    _data['address'] = address;
    _data['image'] = image;
    _data['mobile'] = mobile;
    _data['phone'] = phone;
    _data['username'] = username;
    return _data;
  }
}

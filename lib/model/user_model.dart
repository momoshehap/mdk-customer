class User {
  User({
    required this.status,
    required this.response,
  });
  late final int status;
  late final Response response;

  User.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.area,
    required this.image,
    required this.id,
    required this.name,
    required this.token,
    required this.roleName,
  });
  late final List<dynamic>? area;
  late final String image;
  late final String id;
  late final String name;
  late final String token;
  late final String roleName;

  Data.fromJson(Map<String, dynamic> json) {
    area = List.from(json['area']).map((e) => Area.fromJson(e)).toList();
    image = json['image'];
    id = json['id'];
    name = json['name'];
    token = json['token'];
    roleName = json['role_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (area != null) {
      _data['area'] = area!.map((e) => e.toJson()).toList();
    }
    _data['image'] = image;
    _data['id'] = id;
    _data['name'] = name;
    _data['token'] = token;
    _data['role_name'] = roleName;
    return _data;
  }
}

class Area {
  Area({
    required this.id,
    required this.name,
    required this.arName,
  });
  late final String id;
  late final String name;
  late final String arName;

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arName = json['ar_name'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['ar_name'] = arName;
    return _data;
  }
}

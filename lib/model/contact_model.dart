class Contact {
  Contact({
    required this.status,
    required this.response,
  });
  late final int status;
  late final Response response;

  Contact.fromJson(Map<String, dynamic> json) {
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
  late final List<Data> data;

  Response.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.ArAddress,
    required this.customerAddress,
    required this.customerAddressOld,
    required this.customerId,
    required this.customerName,
    required this.customerPhone,
    required this.customerGPS,
    required this.customerType,
    required this.ArcustomerType,
    required this.cityName,
    required this.cityNameAr,
  });
  late final String ArAddress;
  late final String customerAddress;
  late final String customerAddressOld;
  late final String customerId;
  late final String customerName;
  late final String customerPhone;
  late final String customerGPS;
  late final String customerType;
  late final String ArcustomerType;
  late final String cityName;
  late final String cityNameAr;

  Data.fromJson(Map<String, dynamic> json) {
    ArAddress = json['ArAddress'];
    customerAddress = json['customerAddress'];
    customerAddressOld = json['customerAddress_old'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    customerGPS = json['customerGPS'];
    customerType = json['customerType'];
    ArcustomerType = json['ArcustomerType'];
    cityName = json['cityName'];
    cityNameAr = json['cityNameAr'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ArAddress'] = ArAddress;
    _data['customerAddress'] = customerAddress;
    _data['customerAddress_old'] = customerAddressOld;
    _data['customerId'] = customerId;
    _data['customerName'] = customerName;
    _data['customerPhone'] = customerPhone;
    _data['customerGPS'] = customerGPS;
    _data['customerType'] = customerType;
    _data['ArcustomerType'] = ArcustomerType;
    _data['cityName'] = cityName;
    _data['cityNameAr'] = cityNameAr;
    return _data;
  }
}

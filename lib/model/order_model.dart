class Order {
  Order({
    required this.status,
    required this.response,
  });
  late final int status;
  late final Response response;

  Order.fromJson(Map<String, dynamic> json) {
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
    required this.amount2,
    required this.currency2,
    required this.amount,
    required this.currency,
    required this.ArAddress,
    required this.customerAddress,
    required this.cityname,
    required this.arCityName,
    required this.areaname,
    required this.arAreaName,
    required this.orderType,
    required this.ArOrderType,
    required this.notes,
    required this.orderId,
    required this.Address,
    required this.customerName,
    required this.customerPhone,
    required this.customerGPS,
    required this.customerType,
    required this.ArcustomerType,
    required this.ifWithCollection,
    required this.voiceNote,
    required this.StatusName,
  });
  String? amount2;
  String? currency2;
  late final String amount;
  late final String currency;
  late final String ArAddress;
  late final String customerAddress;
  late final String cityname;
  late final String arCityName;
  late final String areaname;
  late final String arAreaName;
  late final String orderType;
  late final String ArOrderType;
  late final String notes;
  late final String orderId;
  late final String Address;
  late final String customerName;
  late final String customerPhone;
  late final String customerGPS;
  late final String customerType;
  late final String ArcustomerType;
  late final String ifWithCollection;
  late final String voiceNote;
  late final String StatusName;

  Data.fromJson(Map<String, dynamic> json) {
    amount2 = json['amount2'];
    currency2 = json['currency2'];
    amount = json['amount'];
    currency = json['currency'];
    ArAddress = json['ArAddress'];
    customerAddress = json['customerAddress'];
    cityname = json['cityname'];
    arCityName = json['arCityName'];
    areaname = json['areaname'];
    arAreaName = json['arAreaName'];
    orderType = json['orderType'];
    ArOrderType = json['Ar_orderType'];
    notes = json['notes'];
    orderId = json['orderId'];
    Address = json['Address'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    customerGPS = json['customerGPS'];
    customerType = json['customerType'];
    ArcustomerType = json['ArcustomerType'];
    ifWithCollection = json['ifWithCollection'];
    voiceNote = json['voiceNote'];
    StatusName = json['StatusName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount2'] = amount2;
    _data['currency2'] = currency2;
    _data['amount'] = amount;
    _data['currency'] = currency;
    _data['ArAddress'] = ArAddress;
    _data['customerAddress'] = customerAddress;
    _data['cityname'] = cityname;
    _data['arCityName'] = arCityName;
    _data['areaname'] = areaname;
    _data['arAreaName'] = arAreaName;
    _data['orderType'] = orderType;
    _data['Ar_orderType'] = ArOrderType;
    _data['notes'] = notes;
    _data['orderId'] = orderId;
    _data['Address'] = Address;
    _data['customerName'] = customerName;
    _data['customerPhone'] = customerPhone;
    _data['customerGPS'] = customerGPS;
    _data['customerType'] = customerType;
    _data['ArcustomerType'] = ArcustomerType;
    _data['ifWithCollection'] = ifWithCollection;
    _data['voiceNote'] = voiceNote;
    _data['StatusName'] = StatusName;
    return _data;
  }
}

import 'package:dio/dio.dart';

class PostOrder {
  PostOrder({
    required this.id,
    required this.image,
    required this.orders,
  });
  String? id;
  String? image;
  List<Orders>? orders;

  PostOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    orders = List.from(json['orders']).map((e) => Orders.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['orders'] = orders!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Orders {
  Orders({
    this.date,
    this.cityName,
    this.cityNameAr,
    this.customerAddress,
    this.customerGPS,
    this.customerId,
    this.customerName,
    this.customerPhone,
    this.customerType,
    this.ifWithCollection,
    this.index,
    this.notes,
    this.orderType,
    this.voice,
    this.voiceNote,
    this.amount,
    this.currency,
    this.image,
  });
  String? date;
  String? cityName;
  String? cityNameAr;
  String? customerAddress;
  String? customerGPS;
  String? customerId;
  String? customerName;
  String? customerPhone;
  String? customerType;
  bool? ifWithCollection;
  int? index;
  String? notes;
  String? orderType;
  String? voice;
  String? voiceNote;
  String? amount;
  String? currency;
  String? image;

  Orders.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    cityName = json['cityName'];
    cityNameAr = json['cityNameAr'];
    customerAddress = json['customerAddress'];
    customerGPS = json['customerGPS'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    customerType = json['customerType'];
    ifWithCollection = json['ifWithCollection'];
    index = json['index'];
    notes = json['notes'];
    orderType = json['orderType'];
    voice = json['voice'];
    voiceNote = json['voice_note'];
    amount = json['amount'];
    currency = json['currency'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Date'] = date;
    _data['cityName'] = cityName;
    _data['cityNameAr'] = cityNameAr;
    _data['customerAddress'] = customerAddress;
    _data['customerGPS'] = customerGPS;
    _data['customerId'] = customerId;
    _data['customerName'] = customerName;
    _data['customerPhone'] = customerPhone;
    _data['customerType'] = customerType;
    _data['ifWithCollection'] = ifWithCollection;
    _data['index'] = index;
    _data['notes'] = notes;
    _data['orderType'] = orderType;
    _data['voice'] = voice;
    _data['voice_note'] = voiceNote;
    _data['amount'] = amount;
    _data['currency'] = currency;
    _data['image'] = image;
    return _data;
  }
}

import 'package:bitirmeproje/core/models/user.dart';

class Advert {
  late String title;
  late String icon;
  late String category;
  late String saleType;
  late DateTime date;
  late double price;
  late String location;
  late String status;
  late String description;
  AppUser? advertiser;
  late String advertiserId;

  Advert(
      {required this.title,
      required this.icon,
      required this.category,
      required this.saleType,
      required this.date,
      required this.price,
      required this.location,
      required this.status,
      required this.description,
      required this.advertiserId,
      this.advertiser});

  Advert.fromJson(dynamic json) {
    title = json['title'];
    icon = json['icon'];
    category = json['category'];
    saleType = json['saleType'];
    date = json['date'].toDate();
    price = json['price'].toDouble();
    location = json['location'];
    status = json['status'];
    description = json['description'];
    advertiserId = json['advertiserId'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['icon'] = icon;
    map['category'] = category;
    map['saleType'] = saleType;
    map['date'] = date;
    map['price'] = price;
    map['location'] = location;
    map['status'] = status;
    map['description'] = description;
    map['advertiserId'] = advertiserId;
    return map;
  }
}

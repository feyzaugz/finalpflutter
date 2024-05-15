class Privilege {
  late String title;
  late String subtitle;
  late String image;

  Privilege({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  Privilege.fromJson(dynamic json) {
    title = json['title'];
    subtitle = json['subtitle'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['subtitle'] = subtitle;
    map['image'] = image;

    return map;
  }
}

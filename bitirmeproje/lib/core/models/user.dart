class AppUser {
  late String uid;
  late String name;
  late String lastName;
  late double debt;

  AppUser(
      {required this.uid,
      required this.debt,
      required this.name,
      required this.lastName});

  AppUser.fromJson(dynamic json) {
    uid = json['uid'];
    name = json['name'];
    lastName = json['lastName'];
    debt = json['debt'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = uid;
    map['name'] = name;
    map['lastName'] = lastName;
    map['debt'] = debt;
    return map;
  }
}

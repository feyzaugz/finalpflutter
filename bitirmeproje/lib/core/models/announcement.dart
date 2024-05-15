class Announcement {
  late String title;
  late DateTime date;
  late String description;

  Announcement({
    required this.title,
    required this.date,
    required this.description,
  });

  Announcement.fromJson(dynamic json) {
    title = json['title'];
    date = json['date'].toDate();
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['date'] = date;
    map['description'] = description;

    return map;
  }
}

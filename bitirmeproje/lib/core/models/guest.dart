class Guest {
  late String apartment;
  late DateTime date;
  late String explanation;
  late String plaka;

  Guest({
    required this.apartment,
    required this.date,
    required this.explanation,
    required this.plaka,
  });

  Guest.fromJson(dynamic json) {
    apartment = json['apartment'];
    date = json['date'].toDate();
    explanation = json['explanation'];
    plaka = json['plaka'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apartment'] = apartment;
    map['date'] = date;
    map['explanation'] = explanation;
    map['plaka'] = plaka;

    return map;
  }
}

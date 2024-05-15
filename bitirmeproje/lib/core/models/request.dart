class Request {
  late String subject;
  late String apartment;
  late String requestType;
  late String description;
  late String requester;

  Request(
      {required this.subject,
      required this.apartment,
      required this.requestType,
      required this.description,
      required this.requester});

  Request.fromJson(dynamic json) {
    subject = json["subject"];
    apartment = json["apartment"];
    requestType = json["requestType"];
    description = json["description"];
    requester = json["requester"];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["subject"] = subject;
    map["apartment"] = apartment;
    map["requestType"] = requestType;
    map["description"] = description;
    map["requester"] = requester;
    return map;
  }
}

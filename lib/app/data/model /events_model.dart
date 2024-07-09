class EventModel {
  String date;
  String hours;
  String place;
  String status;
  List<dynamic> subStatus;

  EventModel({
    required this.date,
    required this.hours,
    required this.place,
    required this.status,
    required this.subStatus,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      date: map['data'] as String,
      hours: map['hora'] as String,
      place: map['local'] as String,
      status: map['status'] as String,
      subStatus: map['subStatus'] as List<dynamic>,
    );
  }
}

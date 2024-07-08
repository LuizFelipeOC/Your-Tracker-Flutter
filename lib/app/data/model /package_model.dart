import 'package:your_tracker/app/data/model%20/events_model.dart';

class PackageModel {
  String code;
  String lastUpdate;
  List<EventModel> events;

  PackageModel({
    required this.code,
    required this.lastUpdate,
    required this.events,
  });

  factory PackageModel.fromJson(Map<String, dynamic> map) {
    return PackageModel(
      code: map['codigo'],
      lastUpdate: map['ultimo'],
      events: (map['eventos'] as List<dynamic>).map((e) => EventModel.fromMap(e)).toList(),
    );
  }
}

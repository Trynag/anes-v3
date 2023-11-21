// ignore_for_file: non_constant_identifier_names, prefer_collection_literals, prefer_typing_uninitialized_variables

class WorkModel {
  final int? id;
  final String process;
  final String place;
  final bool routines;
  final String poss_effect;
  final String description;
  final String activities;
  final String sources;
  final String individual;
  final String? create_at;
  final String? update_at;
  final int? user;
  final int? state;
  final danger_class;

  WorkModel({
    this.id,
    required this.process,
    required this.place,
    required this.routines,
    required this.poss_effect,
    required this.description,
    required this.activities,
    required this.sources,
    required this.individual,
    this.create_at,
    this.update_at,
    required this.user,
    this.state,
    required this.danger_class,
  });

  factory WorkModel.fromJson(Map<String, dynamic> json) {
    return WorkModel(
      id: json['id'] as int,
      process: json['process'] as String,
      place: json['place'] as String,
      routines: json['routines'] as bool,
      activities: json['activities'] as String,
      sources: json['sources'] as String,
      individual: json['individual'] as String,
      poss_effect: json['poss_effect'] as String,
      description: json['description'] as String,
      create_at: json['create_at'] as String,
      update_at: json['update_at'] as String,
      user: json['user'] as int,
      state: json['state'] as int,
      danger_class: json['danger_class'],
    );
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map["process"] = process;
    map["place"] = place;
    map["routines"] = routines;
    map["activities"] = activities;
    map["sources"] = sources;
    map["description"] = description;
    map["individual"] = individual;
    map["poss_effect"] = poss_effect;
    map["user"] = user;
    map["danger_class"] = danger_class;

    return map;
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_collection_literals, file_names

class ActionModel {
  final int? id;
  final String removes;
  final String substitutions;
  final String engineering_ctrls;
  final String administrative_ctrls;
  final String epp;
  final int no_exposed;
  final String wors_result;
  final int state;

  ActionModel(
      {this.id,
      required this.removes,
      required this.substitutions,
      required this.engineering_ctrls,
      required this.administrative_ctrls,
      required this.epp,
      required this.no_exposed,
      required this.wors_result,
      required this.state});

  factory ActionModel.fromJson(Map<String, dynamic> json) {
    return ActionModel(
      id: json['id'] as int?,
      removes: json['removes'] as String,
      substitutions: json['substitutions'] as String,
      engineering_ctrls: json['engineering_ctrls'] as String,
      administrative_ctrls: json['administrative_ctrls'] as String,
      epp: json['epp'] as String,
      no_exposed: json['no_exposed'] as int,
      wors_result: json['wors_result'] as String,
      state: json['state'] as int,
    );
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map["removes"] = removes;
    map["substitutions"] = substitutions;
    map["engineering_ctrls"] = engineering_ctrls;
    map["administrative_ctrls"] = administrative_ctrls;
    map["epp"] = epp;
    map["no_exposed"] = no_exposed;
    map["wors_result"] = wors_result;

    return map;
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_collection_literals, file_names, prefer_typing_uninitialized_variables
class RiskEvaluation {
  final int? id;
  final int deficiency_lvl;
  final int exposure_lvl;
  final int probability_lvl;
  final String interpretation_probability_lvl;
  final int consequence_lvl;
  final int risk_lvl;
  final String interpretation_risk_lvl;
  final String risk_accept;
  var image;
  final int? action;
  final int? work;
  final int state;

  RiskEvaluation(
      {this.id,
      required this.deficiency_lvl,
      required this.exposure_lvl,
      required this.probability_lvl,
      required this.interpretation_probability_lvl,
      required this.consequence_lvl,
      required this.risk_lvl,
      required this.interpretation_risk_lvl,
      required this.risk_accept,
      this.image,
      required this.action,
      required this.work,
      required this.state});

  factory RiskEvaluation.fromJson(Map<String, dynamic> json) {
    return RiskEvaluation(
      id: json['id'] as int?,
      deficiency_lvl: json['deficiency_lvl'] as int,
      exposure_lvl: json['exposure_lvl'] as int,
      probability_lvl: json['probability_lvl'] as int,
      interpretation_probability_lvl:
          json['interpretation_probability_lvl'] as String,
      consequence_lvl: json['consequence_lvl'] as int,
      risk_lvl: json['risk_lvl'] as int,
      interpretation_risk_lvl: json['interpretation_risk_lvl'] as String,
      risk_accept: json['risk_accept'] as String,
      image: json['image'],
      action: json['action'] as int?,
      work: json['work'] as int?,
      state: json['state'] as int,
    );
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map["deficiency_lvl"] = deficiency_lvl;
    map["exposure_lvl"] = exposure_lvl;
    map["probability_lvl"] = probability_lvl;
    map["interpretation_probability_lvl"] = interpretation_probability_lvl;
    map["consequence_lvl"] = consequence_lvl;
    map["risk_lvl"] = risk_lvl;
    map["interpretation_risk_lvl"] = interpretation_risk_lvl;
    map["risk_accept"] = risk_accept;
    map["image"] = image;
    map["action"] = action;
    map["work"] = work;
    map["state"] = state;

    return map;
  }
}

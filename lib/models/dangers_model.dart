class DangerClass {
  final int? id;
  final String name;
  final String? createAt;
  final String? updateAt;
  final int? state;

  DangerClass({
    this.id,
    required this.name,
    this.createAt,
    this.updateAt,
    this.state,
  });

  factory DangerClass.fromJson(Map<String, dynamic> json) {
    return DangerClass(
      id: json['id'] as int?,
      name: json['name'] as String,
      createAt: json['create_at'] as String?,
      updateAt: json['update_at'] as String?,
      state: json['state'] as int?,
    );
  }

  Map toMap() {
    var map = <String, String>{};
    map["name"] = name;

    return map;
  }
}

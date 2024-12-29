import 'package:json_annotation/json_annotation.dart';

import '_models.dart';

part 'sample.g.dart';

@JsonSerializable()
class Sample {
  Sample({
    this.dummy,
  });

  final String? dummy;
  
  @JsonKey(ignore: true)
  String? id;
  
  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);

  Map<String, dynamic> toJson() => _$SampleToJson(this);

  @override
  operator ==(Object other) => other is Sample && other.id == id;
  
  @override
  int get hashCode => id.hashCode;
  
  @override
  String toString() {
    return '<Sample id=$id>';
  }
}
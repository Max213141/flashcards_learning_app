import 'package:flutter/material.dart';

class Topic {
  final int? id;
  final String topicName;
  final int? colorValue;

  const Topic({this.id, required this.topicName, this.colorValue});

  Color? get color => colorValue == null ? null : Color(colorValue!);

  Topic copyWith({int? id, String? topicName, int? colorValue}) {
    return Topic(
      id: id ?? this.id,
      topicName: topicName ?? this.topicName,
      colorValue: colorValue ?? this.colorValue,
    );
  }

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      topicName: json['topicName'] as String,
      colorValue: json['colorValue'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topicName': topicName,
      if (colorValue != null) 'colorValue': colorValue,
    };
  }
}

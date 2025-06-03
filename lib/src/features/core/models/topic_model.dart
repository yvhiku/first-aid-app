// lib/src/features/core/models/topic_model.dart
import 'package:flutter/material.dart';

class Topic {
  final String id;
  final String title;
  final String image;
  final Widget screen;

  Topic({
    required this.id,
    required this.title,
    required this.image,
    required this.screen,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Topic && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
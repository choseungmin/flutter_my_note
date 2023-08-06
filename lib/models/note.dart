import 'package:flutter/foundation.dart';

class Note {
  final String id;
  final String title;
  final String content;
  final DateTime timestamp;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.timestamp,
  });

  Note copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? timestamp,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

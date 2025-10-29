import 'package:equatable/equatable.dart';
import 'category.dart';

class Note extends Equatable {
  final String id;
  final String title;
  final String content;
  final Category category;
  final DateTime createdAt;
  final bool isSynced;

  const Note({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.createdAt,
    this.isSynced = false,
  });

  Note copyWith({
    String? id,
    String? title,
    String? content,
    Category? category,
    DateTime? createdAt,
    bool? isSynced,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  List<Object?> get props => [id, title, content, category, createdAt, isSynced];
}

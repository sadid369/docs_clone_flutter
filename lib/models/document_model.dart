import 'dart:convert';

class DocumentModel {
  final String uid;
  final DateTime createdAt;
  final String title;
  final List content;
  final String id;
  DocumentModel({
    required this.uid,
    required this.createdAt,
    required this.title,
    required this.content,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'title': title,
      'content': content,
      'id': id,
    };
  }

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      uid: map['uid'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      title: map['title'] ?? '',
      content: List.from(map['content']),
      id: map['_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentModel.fromJson(String source) =>
      DocumentModel.fromMap(json.decode(source));
}

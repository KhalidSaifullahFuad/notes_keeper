import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String? id;
  String? userId;
  String title;
  String content;
  List<String> tags;
  DateTime? createdDate;
  DateTime updatedDate;

  Note({
    this.id,
    this.userId,
    required this.title,
    required this.content,
    this.tags = const [],
    this.createdDate,
    required this.updatedDate,
  });

  factory Note.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return Note(
      id: snapshot.id,
      title: data['title'],
      content: data['content'],
      tags: data['tags']?.cast<String>(),
      createdDate: data['createdDate']?.toDate(),
      updatedDate: data['updatedDate'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId ?? '',
      'title': title,
      'content': content,
      'tags': tags,
      'createdDate': createdDate ?? FieldValue.serverTimestamp(),
      'updatedDate': FieldValue.serverTimestamp(),
    };
  }
}

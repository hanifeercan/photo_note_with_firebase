import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_note.g.dart';
part 'photo_note.freezed.dart';
@freezed
abstract class PhotoNote with _$PhotoNote {
  const factory PhotoNote({
    required String id,
    @Default('') String title,
    @Default('') String desc,
    @Default('') String imagePath,
  }) = _PhotoNote;

  factory PhotoNote.fromJson(Map<String, dynamic> json) =>
      _$PhotoNoteFromJson(json);

  factory PhotoNote.fromMap(Map<String, dynamic> map) {
    return PhotoNote(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }

  factory PhotoNote.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return PhotoNote(
      id: doc.id,
      title: data['title'] ?? '',
      desc: data['desc'] ?? '',
      imagePath: data['imagePath'] ?? '',
    );
  }
}

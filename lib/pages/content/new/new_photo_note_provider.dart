import 'package:photo_note_with_firebase/repositories/photo_notes_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_photo_note_provider.g.dart';

@riverpod
FutureOr<void> addPhotoNote(
  AddPhotoNoteRef ref,
  String title,
  String desc,
  String imagePath,
) {
  return ref
      .watch(photoNotesRepositoryProvider)
      .addPhotoNote(title: title, desc: desc, imagePath: imagePath);
}

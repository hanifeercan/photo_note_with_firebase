import 'package:photo_note_with_firebase/models/photo_note/photo_note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/photo_notes_repository_provider.dart';

part 'home_provider.g.dart';

@riverpod
FutureOr<List<PhotoNote>> getPhotoNotes(GetPhotoNotesRef ref) {
  return ref.watch(photoNotesRepositoryProvider).getPhotoNotes();
}

@riverpod
FutureOr<void> removePhotoNote(RemovePhotoNoteRef ref, String id) {
  return ref.watch(photoNotesRepositoryProvider).removePhotoNote(id);
}
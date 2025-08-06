import 'photo_notes_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_notes_repository_provider.g.dart';

@riverpod
PhotoNotesRepository photoNotesRepository(PhotoNotesRepositoryRef ref) {
  return PhotoNotesRepository();
}

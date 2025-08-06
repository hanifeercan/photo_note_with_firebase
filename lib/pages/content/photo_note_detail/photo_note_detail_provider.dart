import 'package:photo_note_with_firebase/models/photo_note/photo_note.dart';
import 'package:photo_note_with_firebase/repositories/photo_notes_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_note_detail_provider.g.dart';

@riverpod
class PhotoNoteDetail extends _$PhotoNoteDetail {
  @override
  FutureOr<PhotoNote> build(String id) {
    return _getPhotoNote(id);
  }

  @riverpod
  FutureOr<PhotoNote> _getPhotoNote(String id) {
    return ref.watch(photoNotesRepositoryProvider).getPhotoNote(id);
  }

  @riverpod
  FutureOr<void> editPhotoNoteTitle(PhotoNote photoNote, String title) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref
          .watch(photoNotesRepositoryProvider)
          .editPhotoNoteTitle(photoNote, title);
      return photoNote.copyWith(title: title);
    });
  }

  @riverpod
  FutureOr<void> editPhotoNoteDesc(PhotoNote photoNote, String desc) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref
          .watch(photoNotesRepositoryProvider)
          .editPhotoNoteDesc(photoNote, desc);
      return photoNote.copyWith(desc: desc);
    });
  }

  @riverpod
  FutureOr<void> editPhotoNoteImage(
    PhotoNote photoNote,
    String imagePath,
  ) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref
          .watch(photoNotesRepositoryProvider)
          .editPhotoNoteImage(photoNote, imagePath);
      return photoNote.copyWith(imagePath: imagePath);
    });
  }
}

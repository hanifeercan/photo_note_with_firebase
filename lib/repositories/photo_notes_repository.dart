import 'package:photo_note_with_firebase/models/photo_note/photo_note.dart';
import 'package:uuid/uuid.dart';
import '../constants/firebase_constants.dart';
import 'handle_exception.dart';

class PhotoNotesRepository {
  Future<List<PhotoNote>> getPhotoNotes() async {
    try {
      final snapshot = await photoNotesCollection.get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs
            .map((doc) => PhotoNote.fromMap(doc.data()))
            .toList();
      }

      throw 'PhotoNote not found';
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> addPhotoNote({
    required String title,
    required String desc,
    required String imagePath,
  }) async {
    try {
      Uuid uuid = const Uuid();
      final id = uuid.v4();
      final PhotoNote photoNote = PhotoNote(
        id: id,
        title: title,
        desc: desc,
        imagePath: imagePath,
      );
      await photoNotesCollection.doc(id).set(photoNote.toJson());

      throw 'PhotoNote dont added';
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> removePhotoNote(String id) async {
    try {
      await photoNotesCollection.doc(id).delete();

      throw 'PhotoNote dont deleted';
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<PhotoNote> getPhotoNote(String id) async {
    try {
      final doc = await photoNotesCollection.doc(id).get();

      if (doc.exists) {
        return PhotoNote.fromDoc(doc);
      }

      throw 'PhotoNote not found';
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> editPhotoNoteTitle(PhotoNote photoNote, String title) async {
    final doc = await photoNotesCollection.doc(photoNote.id).get();

    if (doc.exists) {
      PhotoNote.fromDoc(doc);

      final updatePhotoNote = photoNote.copyWith(
        id: photoNote.id,
        title: title,
        desc: photoNote.desc,
        imagePath: photoNote.imagePath,
      );
      await photoNotesCollection
          .doc(photoNote.id)
          .update(updatePhotoNote.toJson());
    }
  }

  Future<void> editPhotoNoteDesc(PhotoNote photoNote, String desc) async {
    final doc = await photoNotesCollection.doc(photoNote.id).get();

    if (doc.exists) {
      PhotoNote.fromDoc(doc);

      final updatePhotoNote = photoNote.copyWith(
        id: photoNote.id,
        title: photoNote.title,
        desc: desc,
        imagePath: photoNote.imagePath,
      );
      await photoNotesCollection
          .doc(photoNote.id)
          .update(updatePhotoNote.toJson());
    }
  }

  Future<void> editPhotoNoteImage(PhotoNote photoNote, String imagePath) async {
    final doc = await photoNotesCollection.doc(photoNote.id).get();

    if (doc.exists) {
      PhotoNote.fromDoc(doc);

      final updatePhotoNote = photoNote.copyWith(
        id: photoNote.id,
        title: photoNote.title,
        desc: photoNote.desc,
        imagePath: imagePath,
      );
      await photoNotesCollection
          .doc(photoNote.id)
          .update(updatePhotoNote.toJson());
    }
  }
}

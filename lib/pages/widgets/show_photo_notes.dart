import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_note_with_firebase/models/photo_note/photo_note.dart';
import 'package:photo_note_with_firebase/pages/content/home/home_provider.dart';
import 'package:photo_note_with_firebase/pages/widgets/photo_note_item.dart';
import 'package:photo_note_with_firebase/providers/photo_note_item_provider.dart';

class ShowPhotoNotes extends ConsumerStatefulWidget {
  const ShowPhotoNotes({super.key});

  @override
  ConsumerState<ShowPhotoNotes> createState() => _ShowPhotoNotesState();
}

class _ShowPhotoNotesState extends ConsumerState<ShowPhotoNotes> {
  Widget prevTodosWidget = const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    final photoNotesState = ref.watch(getPhotoNotesProvider);

    return photoNotesState.when(
      skipError: false,
      data: (List<PhotoNote> allNotes) {
        if (allNotes.isEmpty) {
          prevTodosWidget = const Center(
            child: Text(
              'Your photo note list is empty! Let\'s create new photo note. ',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
          );
          return prevTodosWidget;
        }

        prevTodosWidget = ListView.builder(
          itemCount: allNotes.length,
          itemBuilder: (BuildContext context, int index) {
            final photoNote = allNotes[index];
            return ProviderScope(
              overrides: [photoNoteItemProvider.overrideWithValue(photoNote)],
              child: PhotoNoteItem(photoNote: photoNote),
            );
          },
        );
        return prevTodosWidget;
      },
      error: (error, _) {
        return const Center(
            child: Text(
              'Your photo note list is empty! Let\'s create new photo note. ',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
          );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

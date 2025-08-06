import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_note_with_firebase/config/router/router_names.dart';
import 'package:photo_note_with_firebase/models/photo_note/photo_note.dart';
import 'package:photo_note_with_firebase/pages/content/home/home_provider.dart';

class PhotoNoteItem extends ConsumerStatefulWidget {
  final PhotoNote photoNote;
  const PhotoNoteItem({super.key, required this.photoNote});

  @override
  ConsumerState<PhotoNoteItem> createState() => _PhotoNoteItemState();
}

class _PhotoNoteItemState extends ConsumerState<PhotoNoteItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ListTile(
          onTap: () {
            GoRouter.of(context).goNamed(RouteNames.detailPhotoNote, pathParameters:{'id': widget.photoNote.id});
          },
          title: Text(widget.photoNote.title, style: TextStyle(fontSize: 20)),
          trailing: IconButton(
            onPressed: () async {
              final removeOrNot = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you really want to delete?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );

              if (removeOrNot) {
                ref.read(removePhotoNoteProvider(widget.photoNote.id));
                ref.invalidate(getPhotoNotesProvider);
              }
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}

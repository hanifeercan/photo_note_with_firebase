import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_note_with_firebase/config/router/router_names.dart';
import 'package:photo_note_with_firebase/pages/widgets/show_photo_notes.dart';

import '../../../models/custom_error/custom_error.dart';
import '../../../repositories/auth_repository_provider.dart';
import '../../../utils/error_dialog.dart';
import 'home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Photo Note List"),
          titleTextStyle: TextStyle(fontSize: 24, color: Colors.brown),
          backgroundColor: const Color.fromARGB(255, 223, 221, 214),
          actions: [
            IconButton(
              onPressed: () async {
                try {
                  await ref.read(authRepositoryProvider).signout();
                } on CustomError catch (e) {
                  if (!context.mounted) return;
                  errorDialog(context, e);
                }
              },
              icon: const Icon(Icons.logout),
            ),
            IconButton(
              onPressed: () {
                ref.invalidate(getPhotoNotesProvider);
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(children: [Expanded(child: ShowPhotoNotes())]),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).goNamed(RouteNames.newPhotoNote);
          },
          backgroundColor: const Color.fromARGB(255, 223, 221, 214),
          foregroundColor: Colors.brown,
          elevation: 6,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

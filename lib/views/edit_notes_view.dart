import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/edit_notes_view_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key, this.note});

  static const String id = 'edit_notes_view';
  final NotesModel? note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNotesViewBody(note: note!),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/edit_notes_view_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key});

  static String id = 'EditNotesView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditNotesViewBody(),
    );
  }
}

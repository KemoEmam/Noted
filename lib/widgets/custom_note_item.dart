import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubit/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NotesModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNotesView(note: note);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 26),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(right: 10),
              title: Text(
                note.title,
                style: const TextStyle(fontSize: 21, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 22, top: 16),
              child: Text(
                note.date,
                style: TextStyle(color: Colors.black.withOpacity(.5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

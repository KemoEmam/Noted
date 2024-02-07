import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/constants.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});

  final NotesModel note;
  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, subTitle;
  TextEditingController? titleController, subTitleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    subTitleController = TextEditingController(text: widget.note.subTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextFormField(
            controller: titleController,
            onChanged: (value) {
              title = value;
            },
            borderColor: Colors.white.withOpacity(.7),
            focusedBorderColor: kPrimaryColor,
            textColor: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            controller: subTitleController,
            onChanged: (value) {
              subTitle = value;
            },
            borderColor: Colors.white.withOpacity(.7),
            focusedBorderColor: kPrimaryColor,
            textColor: Colors.grey,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}

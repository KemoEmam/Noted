import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Future addNote(NotesModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NotesModel>(kNotesBox);
      emit(AddNoteSuccess());
      await notesBox.add(note);
    } catch (e) {
      AddNoteFailure(e.toString());
    }
  }
}

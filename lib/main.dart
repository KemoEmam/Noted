import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/edit_notes_view.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/widgets/constants.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>(kNotesBox);
  Bloc.observer = SimpleBlocObserver();

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        NotesView.id: (context) => const NotesView(),
        EditNotesView.id: (context) => const EditNotesView()
      },
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}

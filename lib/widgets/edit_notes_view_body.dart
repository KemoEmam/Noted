import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constants.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            borderColor: Colors.white.withOpacity(.7),
            hintText: 'Title',
            focusedBorderColor: kPrimaryColor,
            textColor: Colors.grey,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is required!';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            borderColor: Colors.white.withOpacity(.7),
            hintText: 'Content',
            focusedBorderColor: kPrimaryColor,
            textColor: Colors.grey,
            maxLines: 5,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is required!';
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }
}

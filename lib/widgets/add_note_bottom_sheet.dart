import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constants.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 32, right: 24, left: 24),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            borderColor: Colors.white.withOpacity(.7),
            hintText: 'Title',
            focusedBorderColor: kPrimaryColor,
            onSaved: (value) {
              value = title;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            borderColor: Colors.white.withOpacity(.7),
            hintText: 'Content',
            focusedBorderColor: kPrimaryColor,
            maxLines: 5,
            onSaved: (value) {
              value = subTitle;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            text: 'Add',
            buttonColor: kPrimaryColor,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

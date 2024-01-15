import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 26),
      decoration: BoxDecoration(
        color: const Color(0xFFFFCD7A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(right: 10),
            title: const Text(
              'Flutter Tips',
              style: TextStyle(fontSize: 21, color: Colors.black),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Text(
                'Build your career with Tharwat Samy',
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(.5)),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
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
              'May21 , 2024',
              style: TextStyle(color: Colors.black.withOpacity(.5)),
            ),
          )
        ],
      ),
    );
  }
}

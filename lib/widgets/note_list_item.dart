import 'package:flutter/material.dart';
import 'package:my_note/models/note.dart';
import 'package:my_note/screens/note_detail_screen.dart';

class NoteListItem extends StatelessWidget {
  final Note note;
  final Function(Note note) onNoteEdit;

  NoteListItem({required this.note, required this.onNoteEdit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteDetailScreen(
              note: note,
              onNoteEdit: onNoteEdit,
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_note/models/note.dart';
import 'package:my_note/widgets/note_list_item.dart';
import 'package:my_note/screens/note_edit_screen.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> notes = [];

  void editNote(int index, Note note) {
    setState(() {
      notes[index] = note;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteListItem(
            note: notes[index],
            onNoteEdit: (editedNote) => editNote(index, editedNote),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteEditScreen(
                onNoteSubmit: (newNote) {
                  setState(() {
                    notes.add(newNote);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

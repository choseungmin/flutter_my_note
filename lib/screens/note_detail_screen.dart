import 'package:flutter/material.dart';
import 'package:my_note/models/note.dart';
import 'package:my_note/screens/note_edit_screen.dart';

class NoteDetailScreen extends StatefulWidget {
  final Note note;
  final Function(Note note) onNoteEdit;

  NoteDetailScreen({required this.note, required this.onNoteEdit});

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {

  late Note _note;

  @override
  void initState() {
    super.initState();
    _note = widget.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_note.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              final editedNote = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteEditScreen(
                    note: _note,
                    onNoteSubmit: widget.onNoteEdit,
                  ),
                ),
              );

              if (editedNote != null) {
                setState(() {
                  _note = editedNote;
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(_note.content),
      ),
    );
  }
}

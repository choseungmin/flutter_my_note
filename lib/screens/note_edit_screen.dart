import 'package:flutter/material.dart';
import 'package:my_note/models/note.dart';
import 'package:my_note/screens/notes_screen.dart';


class NoteEditScreen extends StatefulWidget {
  final Note? note;
  final Function(Note note) onNoteSubmit;

  NoteEditScreen({this.note, required this.onNoteSubmit});

  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController =
        TextEditingController(text: widget.note?.content ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.note == null ? 'Add Note' : 'Edit Note'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            final id = widget.note?.id ?? DateTime
                .now()
                .millisecondsSinceEpoch
                .toString();
            final timestamp = DateTime.now();

            final note = Note(
              id: id,
              title: _titleController.text,
              content: _contentController.text,
              timestamp: timestamp,
            );
            widget.onNoteSubmit(note);
            Navigator.pop(context, note);
          },
        ),
    );
  }
}

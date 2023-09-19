import 'package:flutter/material.dart';
import 'package:notes_keeper/domain/models/note_model.dart';
import 'package:notes_keeper/presentation/viewmodels/note_viewmodel.dart';

class EditNoteScreen extends StatefulWidget {
  final Note? initialNote;
  final String? tag;

  const EditNoteScreen({super.key, this.initialNote, this.tag});

  @override
  EditNoteScreenState createState() => EditNoteScreenState();
}

class EditNoteScreenState extends State<EditNoteScreen> {
  final NoteViewModel noteViewModel = NoteViewModel();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialNote != null) {
      _titleController.text = widget.initialNote!.title;
      _contentController.text = widget.initialNote!.content;
    }
    print(widget.tag);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initialNote != null ? 'Edit Note' : 'Create Note'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        titleSpacing: 0.0,
        actions: [
          if (widget.initialNote != null)
            IconButton(
              onPressed: () async {
                await noteViewModel.deleteNoteById(widget.initialNote!.id);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_rounded),
            ),
          // add check icon to save note
          if (_titleController.text != '' && _contentController.text != '')
            IconButton(
              onPressed: () async {
                _saveNote();
              },
              icon: const Icon(Icons.check_rounded),
            ),
        ],
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Hero(
            tag: 'none',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                  cursorColor: colorScheme.primary,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    fillColor: Colors.grey[300],
                    hintText: 'Enter your note title',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: TextField(
                    minLines: 50,
                    textAlignVertical: TextAlignVertical.top,
                    controller: _contentController,
                    decoration: InputDecoration(
                      labelText: 'Content',
                      alignLabelWithHint: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 16),
                      fillColor: Colors.grey[300],
                      hintText: 'Enter your note text',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    maxLines: null,
                    // buildCounter: (BuildContext context,
                    //     {int? currentLength, int? maxLength, bool? isFocused}) {
                    //   if (isFocused!) {
                    //     Text(
                    //       '$currentLength',
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.grey.shade600,
                    //       ),
                    //     );
                    //   }
                    // },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide.none,
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    widget.initialNote != null ? 'Update Note' : 'Save Note',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _saveNote();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveNote() async {
    String title = _titleController.text;
    String content = _contentController.text.trim();

    if (title.isNotEmpty && content.isNotEmpty) {
      if (widget.initialNote != null) {
        await noteViewModel.updateNote(widget.initialNote!.id, title, content);
      } else {
        await noteViewModel.addNote(title, content);
      }
      Navigator.pop(context); // Return to previous screen
    } else {
      _showSnackBar('Please enter a title and content', color: Colors.red);
    }
  }

  void _showSnackBar(String message, {Color color = Colors.black}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}

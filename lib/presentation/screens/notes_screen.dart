import 'package:flutter/material.dart';
import 'package:notes_keeper/presentation/viewmodels/note_viewmodel.dart';

import 'package:notes_keeper/domain/models/note_model.dart';
import 'edit_note_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final NoteViewModel noteViewModel = NoteViewModel();
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  void _loadNotes() async {
    List<Note> notes = await NoteViewModel().getAllNotes();
    setState(() {
      _notes = notes;
      print(notes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        elevation: 2,
        title: const Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/note-edit', arguments: {
          //   'note': null,
          // }).then((_) {
          //   _loadNotes();
          // });

          // dont use pushNamed, use push instead
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditNoteScreen(),
            ),
          ).then((_) {
            _loadNotes();
          });
        },
        backgroundColor: colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 10),
              Expanded(
                child: _buildNoteList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search notes...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              suffixIcon: const Icon(Icons.filter_list),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteList() {
    // List<Note> notes = [];

    for (int i = 0; i < _notes.length; i++) {
      //   notes.add(
      //     Note(
      //       id: i,
      //       title: 'Note $i',
      //       content:
      //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam aliquam, nunc nisl aliquet nunc, quis aliquam nisl nunc quis nisl. Donec euismod, nisl eget aliquam aliquam, nunc nisl aliquet nunc, quis aliquam nisl nunc quis nisl.',
      //       createdDate: DateTime.now(),
      //     ),
      //   );
      print(_notes[i].title);
    }

    return ListView.builder(
      itemCount: _notes.length,
      itemBuilder: (context, index) {
        return _buildNoteCard(_notes[index]);
      },
    );
  }

  Widget _buildNoteCard(Note note) {
    return Hero(
      tag: 'note',
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          title: Text(
            note.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          dense: false,
          subtitle: Text(
            note.content,
            style: const TextStyle(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          visualDensity: VisualDensity.comfortable,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  EditNoteScreen(initialNote: note, tag: 'note-${note.id}'),
            ),
          ).then(
            (_) {
              _loadNotes();
            },
          ),
        ),
      ),
    );
  }
}

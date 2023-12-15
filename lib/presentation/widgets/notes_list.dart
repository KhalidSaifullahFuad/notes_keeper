import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:notes_keeper/utils/app_exports.dart';
import 'package:provider/provider.dart';

class NotesList extends StatefulWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final NotesViewModel notesViewModel =
          Provider.of<NotesViewModel>(context, listen: false);
      notesViewModel.getAllNotes(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    // final UserModel currentUser = Provider.of<UserModel>(context);

    return Consumer<NotesViewModel>(builder: (context, notesViewModel, child) {
      List<Note> notes = notesViewModel.notes;
      if (notesViewModel.isFetching) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (notes.isEmpty) {
        return Center(child: _buildEmptyState(colorScheme));
      } else if (notesViewModel.isListView) {
        return _buildNoteList(notes);
      } else {
        return _buildNoteGrid(notes);
      }

      // return FutureBuilder<List<Note>>(
      //   future: notesViewModel.getAllNotes(context),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (snapshot.hasError) {
      //       return const Center(
      //         child: Text(
      //           'Something went wrong',
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontWeight: FontWeight.w500,
      //           ),
      //         ),
      //       );
      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return Center(child: _buildEmptyState(colorScheme));
      //     } else {
      //       final List<Note> notes = snapshot.data as List<Note>;

      //       if (notesViewModel.isListView) {
      //         return _buildNoteList(notes);
      //       } else {
      //         return _buildNoteGrid(notes);
      //       }
      //     }
      //   },
      // );
    });
  }

  Widget _buildNoteList(List<Note> notes) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return _buildNoteCard(notes[index]);
      },
      physics: const BouncingScrollPhysics(),
    );
  }

  Widget _buildNoteGrid(List<Note> notes) {
    return MasonryGridView.builder(
      itemCount: notes.length,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return _buildNoteGridItem(notes[index]);
      },
      physics: const BouncingScrollPhysics(),
    );
  }

  Widget _buildNoteCard(Note note) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final noteTitle = note.title;
    final noteContent = note.content;
    final createDate = DateFormat('EEEEE d', 'en_US').format(note.createdDate!);
    final noteTags = note.tags ?? [];

    return GestureDetector(
      onTap: () {
        // setState(() {
        //   isNoteClicked = true;
        // });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CreateNoteScreen(initialNote: note),
          ),
        );
      },
      child: Card(
        key: ValueKey(note.id),
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 13,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      noteTitle,
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      noteContent,
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  for (String tag in noteTags)
                    Chip(
                      label: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                      backgroundColor: colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  const Spacer(flex: 1),
                  Text(
                    createDate,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoteGridItem(Note note) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final noteTitle = note.title;
    final noteContent = note.content;
    final createDate = DateFormat('EEEEE d', 'en_US').format(note.createdDate!);
    final noteTags = note.tags ?? [];

    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 13,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    noteTitle,
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    noteContent,
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontSize: 13.0,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 9,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                for (String tag in noteTags)
                  Chip(
                    label: Text(
                      tag,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                    backgroundColor: colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                const Spacer(flex: 1),
                Text(
                  createDate,
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/empty-state.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          Text(
            'No notes found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Click on the add button to create a new note',
            style: TextStyle(
              fontSize: 15,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}

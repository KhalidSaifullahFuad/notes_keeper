import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:notes_keeper/utils/app_exports.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  bool _isListLayout = false;
  bool isNoteClicked = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: _buildAppBar(),
      floatingActionButton: _buildFAB(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 4),
              _buildSearchBar(),
              const SizedBox(height: 10),
              CategoryList(
                categories: const [
                  'All',
                  'Personal',
                  'Work',
                  'Ideas',
                  'Home',
                  'Lists',
                  'Important',
                  'Others',
                  'Archive'
                ],
                onCategorySelected: (category) {
                  print("Clicked on $category");
                },
              ),
              const SizedBox(height: 8),
              Expanded(
                child: _isListLayout ? _buildNoteList() : _buildNoteGrid(),
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
          child: SearchInputField(
            controller: TextEditingController(),
            hintText: "Search your notes",
            prefixIcon: Icons.search_outlined,
            isListLayout: _isListLayout,
            onLayoutChanged: () {
              setState(() {
                _isListLayout = !_isListLayout;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNoteList() {
    // List<Note> notes = [];

    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return _buildNoteCard();
      },
      physics: const BouncingScrollPhysics(),
    );
  }

  Widget _buildNoteCard() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        setState(() {
          isNoteClicked = true;
        });
      },
      child: Card(
        color: isNoteClicked ? Colors.grey[300] : colorScheme.surface,
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
                      'Note Title',
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget tempor dapibus, nisl velit aliquet nunc, eget aliquam diam nisl quis urna.',
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
                  Chip(
                    label: Text(
                      'Personal',
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
                    'December 21',
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

  Widget _buildEmptyState() {
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
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Click on the add button to create a new note',
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: colorScheme.background,
      elevation: 0,
      title: Text(
        'Notes',
        style: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined),
          color: colorScheme.onBackground,
          splashRadius: 25,
        ),
        const SizedBox(width: 12),
      ],
      titleSpacing: 20,
      toolbarHeight: 70,
    );
  }

  Widget _buildFAB() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/${Routes.create_note.name}');
      },
      backgroundColor: colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        Icons.add,
        color: colorScheme.onPrimary,
      ),
    );
  }

  Widget _buildNoteGridItem() {
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
                    'Note Title',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
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
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget tempor dapibus, nisl velit aliquet nunc, eget aliquam diam nisl quis urna.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
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
                Chip(
                  label: Text(
                    'Personal',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  'Dec 21',
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
    );
  }

  Widget _buildNoteGrid() {
    return MasonryGridView.builder(
      itemCount: 15,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return _buildNoteGridItem();
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}

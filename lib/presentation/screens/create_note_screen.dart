import 'package:flutter/material.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 20,
          ),
          color: colorScheme.onBackground,
          splashRadius: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.undo_outlined,
              size: 20.0,
            ),
            color: colorScheme.onBackground,
            splashRadius: 20.0,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.redo_outlined,
              size: 20.0,
            ),
            color: colorScheme.onBackground,
            splashRadius: 20.0,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.check,
              size: 20.0,
            ),
            color: colorScheme.onBackground,
            splashRadius: 20.0,
            onPressed: () {},
          ),
          const SizedBox(width: 16.0)
        ],
        elevation: 0,
      ),
      backgroundColor: colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: null,
            ),
            TextFormField(
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Write your note here...',
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 20.0,
                fontFamily: 'Roboto',
              ),
              autofocus: true,
            ),
          ],
        ),
      ),
    );
  }
}

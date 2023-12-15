import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notes_keeper/utils/app_exports.dart';

class CreateNoteScreen extends StatefulWidget {
  final Note? initialNote;

  const CreateNoteScreen({Key? key, this.initialNote}) : super(key: key);

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final user = Provider.of<UserModel>(context);

    if (user == UserModel.empty) {
      print("user: ${user.id}, ${user.name}, ${user.email}, ${user.password}");

      Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => true);
    }

    return Consumer<NotesViewModel>(builder: (context, viewModel, child) {
      viewModel.currentUser = user;
      if (widget.initialNote != null) {
        viewModel.titleController.text = widget.initialNote!.title;
        viewModel.contentController.text = widget.initialNote!.content;
      }
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
              onPressed: () {
                if (widget.initialNote?.id != null) {
                  print("initial Note id: ${widget.initialNote?.id}");
                  viewModel.updateNote(widget.initialNote!.id!);
                } else {
                  viewModel.createNote();
                }
                Navigator.pop(context);
              },
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
                controller: viewModel.titleController,
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
                controller: viewModel.contentController,
                decoration: const InputDecoration(
                  hintText: 'Write your note here...',
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                ),
                maxLines: null,
                autofocus: true,
              ),
            ],
          ),
        ),
      );
    });
  }
}

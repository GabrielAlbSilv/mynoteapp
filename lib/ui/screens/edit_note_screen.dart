import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/models/category.dart';
import '../../bloc/note_bloc.dart';
import '../../bloc/note_event.dart';
import '../../models/note.dart';
import '../../utils/app_constants.dart';

class EditNoteScreen extends StatefulWidget {
  final Note note;

  const EditNoteScreen({super.key, required this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  Category? selectedCategory;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
    selectedCategory = widget.note.category; // categoria inicial
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void _saveNote() {
    if (titleController.text.isEmpty || contentController.text.isEmpty || selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos')),
      );
      return;
    }

    // Dispara evento de atualização no Bloc
    context.read<NoteBloc>().add(UpdateNote(
          noteId: widget.note.id,
          title: titleController.text,
          content: contentController.text,
          categoryId: selectedCategory!.id,
        ));

    Navigator.pop(context); // fecha a tela
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Nota')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),

            const SizedBox(height: 16),

            // Conteúdo
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Conteúdo'),
              maxLines: 5,
            ),

            const SizedBox(height: 16),

            // Categoria
            DropdownButton<Category>(
              value: selectedCategory,
              isExpanded: true,
              hint: const Text('Selecione a categoria'),
              items: AppConstants.categories.map((Category cat) {
                return DropdownMenuItem<Category>(
                  value: cat,
                  child: Text(cat.name),
                );
              }).toList(),
              onChanged: (Category? newCat) {
                setState(() {
                  selectedCategory = newCat;
                });
              },
            ),

            const SizedBox(height: 32),

            // Botão Salvar
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}

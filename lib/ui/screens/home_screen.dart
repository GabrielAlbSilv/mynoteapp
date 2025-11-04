import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/note_bloc.dart';
import '../../bloc/note_event.dart';
import '../../bloc/note_state.dart';
import '../../models/note.dart';
import '../../utils/app_constants.dart';
import '../widgets/note_card.dart';
import 'note_detail_screen.dart';

// Tela principal do app
class HomeScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeModeNotifier;

  const HomeScreen({super.key, required this.themeModeNotifier});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Carrega as notas quando a tela inicia
    context.read<NoteBloc>().add(LoadNotes());
  }

  // Mostra diálogo para adicionar uma nova nota
  void _showAddNoteDialog(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    String selectedCategoryId = AppConstants.categories.first.id;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Nova Nota'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Campo de título
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                // Campo de conteúdo
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    labelText: 'Conteúdo',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                // Seletor de categoria
                StatefulBuilder(
                  builder: (context, setStateDialog) {
                    return DropdownButtonFormField<String>(
                      value: selectedCategoryId,
                      decoration: const InputDecoration(
                        labelText: 'Categoria',
                        border: OutlineInputBorder(),
                      ),
                      items: AppConstants.categories.map((category) {
                        return DropdownMenuItem(
                          value: category.id,
                          child: Text(category.name),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setStateDialog(() {
                            selectedCategoryId = newValue;
                          });
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            // Botão cancelar
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancelar'),
            ),
            // Botão adicionar
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    contentController.text.isNotEmpty) {
                  // Adiciona a nota através do BLoC
                  context.read<NoteBloc>().add(
                        AddNote(
                          title: titleController.text,
                          content: contentController.text,
                          categoryId: selectedCategoryId,
                        ),
                      );
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  // Navega para a tela de detalhes da nota
  void _showNoteDetail(BuildContext context, Note note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailScreen(note: note),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Notas'),
        actions: [
          // Botão para alternar entre tema claro e escuro
          ValueListenableBuilder<ThemeMode>(
            valueListenable: widget.themeModeNotifier,
            builder: (context, currentMode, child) {
              return IconButton(
                icon: Icon(
                  currentMode == ThemeMode.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
                onPressed: () {
                  widget.themeModeNotifier.value =
                      currentMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                },
                tooltip: 'Alternar tema',
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          // Estado de carregamento
          if (state is NoteLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Estado com notas carregadas
          else if (state is NoteLoaded) {
            if (state.notes.isEmpty) {
              // Mensagem quando não há notas
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.note_add_outlined,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Nenhuma nota ainda',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Toque no + para adicionar sua primeira nota',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[500],
                          ),
                    ),
                  ],
                ),
              );
            }

            // Lista de notas com possibilidade de reordenar
            return ReorderableListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: state.notes.length,
              onReorder: (oldIndex, newIndex) {
                // Reordena as notas através do BLoC
                context.read<NoteBloc>().add(
                      ReorderNotes(
                        oldIndex: oldIndex,
                        newIndex: newIndex,
                      ),
                    );
              },
              itemBuilder: (context, index) {
                final note = state.notes[index];
                return NoteCard(
                  key: ValueKey(note.id),
                  note: note,
                  onTap: () => _showNoteDetail(context, note),
                  onDelete: () {
                    // Deleta a nota através do BLoC
                    context.read<NoteBloc>().add(
                          DeleteNote(noteId: note.id),
                        );
                    // Mostra mensagem de confirmação
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Nota deletada'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                );
              },
            );
          }

          // Estado de erro
          else if (state is NoteError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Colors.red[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Erro ao carregar notas',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }

          // Estado inicial
          return const Center(
            child: Text('Carregando...'),
          );
        },
      ),
      // Botão flutuante para adicionar nova nota
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNoteDialog(context),
        tooltip: 'Adicionar nota',
        child: const Icon(Icons.add),
      ),
    );
  }
}

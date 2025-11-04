import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../models/note.dart';
import '../utils/app_constants.dart';
import 'note_event.dart';
import 'note_state.dart';

// BLoC (Business Logic Component) - gerencia o estado das notas
class NoteBloc extends Bloc<NoteEvent, NoteState> {
  // Inicializa o BLoC com o estado inicial
  NoteBloc() : super(NoteInitial()) {
    // Registra os handlers para cada tipo de evento
    on<LoadNotes>(_onLoadNotes);
    on<AddNote>(_onAddNote);
    on<DeleteNote>(_onDeleteNote);
    on<ReorderNotes>(_onReorderNotes);
<<<<<<< HEAD
    on<EditNote>(_onEditNote); // ✅ handler de edição
=======
    on<UpdateNote>(_onUpdateNote); // NOVO: handler de edição
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
  }

  // Gerador de IDs únicos
  final Uuid _uuid = const Uuid();

  // Lista de notas em memória
  List<Note> _notes = [];

  // Handler para carregar as notas
  void _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
<<<<<<< HEAD

=======
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    await Future.delayed(const Duration(milliseconds: 500));

    _notes = [
      Note(
        id: _uuid.v4(),
        title: 'Lembrete de Compras',
        content: 'Comprar pão, leite, ovos, frutas e vegetais frescos.',
        category: AppConstants.categories[0],
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        isSynced: true,
      ),
      Note(
        id: _uuid.v4(),
        title: 'Ideias para o Projeto Flutter',
        content: 'Implementar animações, reordenamento de lista e tema escuro.',
        category: AppConstants.categories[1],
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        isSynced: false,
      ),
      Note(
        id: _uuid.v4(),
        title: 'Livros para Ler',
        content: 'Clean Code, The Pragmatic Programmer, Flutter in Action.',
        category: AppConstants.categories[2],
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        isSynced: true,
      ),
      Note(
        id: _uuid.v4(),
        title: 'Receita de Bolo',
        content: 'Farinha, açúcar, ovos, fermento. Assar a 180°C por 30min.',
        category: AppConstants.categories[0],
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        isSynced: false,
      ),
    ];

    emit(NoteLoaded(notes: List.from(_notes)));
  }

  // Handler para adicionar uma nova nota
  void _onAddNote(AddNote event, Emitter<NoteState> emit) async {
    if (state is NoteLoaded) {
      final currentNotes = List<Note>.from((state as NoteLoaded).notes);

      final newNote = Note(
        id: _uuid.v4(),
        title: event.title,
        content: event.content,
<<<<<<< HEAD
        category: AppConstants.categories.firstWhere(
          (cat) => cat.id == event.categoryId,
        ),
=======
        category: AppConstants.categories.firstWhere((cat) => cat.id == event.categoryId),
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
        createdAt: DateTime.now(),
        isSynced: false,
      );

      currentNotes.insert(0, newNote);
      _notes = currentNotes;

      emit(NoteLoaded(notes: List.from(_notes)));
    }
  }

  // Handler para deletar uma nota
  void _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    if (state is NoteLoaded) {
      final currentNotes = List<Note>.from((state as NoteLoaded).notes);
<<<<<<< HEAD

      currentNotes.removeWhere((note) => note.id == event.noteId);
      _notes = currentNotes;

=======
      currentNotes.removeWhere((note) => note.id == event.noteId);
      _notes = currentNotes;
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
      emit(NoteLoaded(notes: List.from(_notes)));
    }
  }

<<<<<<< HEAD
  // Handler para reordenar as notas (arrastar e soltar)
=======
  // Handler para reordenar notas
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
  void _onReorderNotes(ReorderNotes event, Emitter<NoteState> emit) {
    if (state is NoteLoaded) {
      final List<Note> currentNotes = List.from((state as NoteLoaded).notes);

      int newIndex = event.newIndex;
<<<<<<< HEAD
      if (newIndex > event.oldIndex) {
        newIndex -= 1;
      }
=======
      if (newIndex > event.oldIndex) newIndex -= 1;
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9

      final Note item = currentNotes.removeAt(event.oldIndex);
      currentNotes.insert(newIndex, item);

      _notes = currentNotes;
<<<<<<< HEAD

=======
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
      emit(NoteLoaded(notes: List.from(_notes)));
    }
  }

<<<<<<< HEAD
  // ✅ Handler único e correto para editar uma nota existente
  void _onEditNote(EditNote event, Emitter<NoteState> emit) async {
    if (state is NoteLoaded) {
      final currentNotes = List<Note>.from((state as NoteLoaded).notes);

      final noteIndex =
          currentNotes.indexWhere((note) => note.id == event.noteId);
      if (noteIndex != -1) {
        final oldNote = currentNotes[noteIndex];

        // Atualiza a nota usando copyWith (sem modifiedAt)
        final updatedNote = oldNote.copyWith(
          title: event.title,
          content: event.content,
          category: AppConstants.categories.firstWhere(
            (cat) => cat.id == event.categoryId,
          ),
          isSynced: false,
        );

        currentNotes[noteIndex] = updatedNote;
        _notes = currentNotes;

=======
  // NOVO: Handler para atualizar nota existente
  void _onUpdateNote(UpdateNote event, Emitter<NoteState> emit) {
    if (state is NoteLoaded) {
      final currentNotes = List<Note>.from((state as NoteLoaded).notes);
      final index = currentNotes.indexWhere((note) => note.id == event.noteId);

      if (index != -1) {
        final updatedNote = currentNotes[index].copyWith(
          title: event.title,
          content: event.content,
          category: AppConstants.categories.firstWhere((cat) => cat.id == event.categoryId),
          isSynced: false,
        );

        currentNotes[index] = updatedNote;
        _notes = currentNotes;
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
        emit(NoteLoaded(notes: List.from(_notes)));
      }
    }
  }
}

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
  }

  // Gerador de IDs únicos
  final Uuid _uuid = const Uuid();

  // Lista de notas em memória
  List<Note> _notes = [];

  // Handler para carregar as notas
  void _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async {
    // Emite estado de carregamento
    emit(NoteLoading());
    
    // Simula um delay (como se estivesse buscando de um servidor)
    await Future.delayed(const Duration(milliseconds: 500));

    // Cria algumas notas de exemplo
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
    
    // Emite as notas carregadas
    emit(NoteLoaded(notes: List.from(_notes)));
  }

  // Handler para adicionar uma nova nota
  void _onAddNote(AddNote event, Emitter<NoteState> emit) async {
    if (state is NoteLoaded) {
      // Pega as notas atuais
      final currentNotes = List<Note>.from((state as NoteLoaded).notes);
      
      // Cria a nova nota
      final newNote = Note(
        id: _uuid.v4(),
        title: event.title,
        content: event.content,
        category: AppConstants.categories.firstWhere((cat) => cat.id == event.categoryId),
        createdAt: DateTime.now(),
        isSynced: false,
      );
      
      // Adiciona no início da lista
      currentNotes.insert(0, newNote);
      _notes = currentNotes;
      
      // Emite o novo estado com a nota adicionada
      emit(NoteLoaded(notes: List.from(_notes)));
    }
  }

  // Handler para deletar uma nota
  void _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    if (state is NoteLoaded) {
      // Pega as notas atuais
      final currentNotes = List<Note>.from((state as NoteLoaded).notes);
      
      // Remove a nota com o ID especificado
      currentNotes.removeWhere((note) => note.id == event.noteId);
      _notes = currentNotes;
      
      // Emite o novo estado sem a nota deletada
      emit(NoteLoaded(notes: List.from(_notes)));
    }
  }

  // Handler para reordenar as notas (arrastar e soltar)
  void _onReorderNotes(ReorderNotes event, Emitter<NoteState> emit) {
    if (state is NoteLoaded) {
      // Pega as notas atuais
      final List<Note> currentNotes = List.from((state as NoteLoaded).notes);

      // Ajusta o índice se necessário
      int newIndex = event.newIndex;
      if (newIndex > event.oldIndex) {
        newIndex -= 1;
      }

      // Move a nota da posição antiga para a nova
      final Note item = currentNotes.removeAt(event.oldIndex);
      currentNotes.insert(newIndex, item);

      _notes = currentNotes;
      
      // Emite o novo estado com as notas reordenadas
      emit(NoteLoaded(notes: List.from(_notes)));
    }
  }
}

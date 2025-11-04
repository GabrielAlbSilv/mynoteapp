import 'package:equatable/equatable.dart';
import '../models/note.dart';

// Classe base para todos os estados relacionados a notas
abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

// Estado inicial (quando o app inicia)
class NoteInitial extends NoteState {}

// Estado de carregamento (enquanto busca as notas)
class NoteLoading extends NoteState {}

// Estado com notas carregadas
class NoteLoaded extends NoteState {
  final List<Note> notes;

  const NoteLoaded({required this.notes});

  @override
  List<Object> get props => [notes];
}

// Estado de erro (se algo deu errado)
class NoteError extends NoteState {
  final String message;

  const NoteError({required this.message});

  @override
  List<Object> get props => [message];
}

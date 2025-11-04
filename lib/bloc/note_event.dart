import 'package:equatable/equatable.dart';
<<<<<<< HEAD
import '../../models/category.dart'; // ✅ Import necessário (ajuste o caminho se for diferente)
=======
import 'package:helloworld/models/note.dart';
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9

// Classe base para todos os eventos relacionados a notas
abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

// Evento para carregar as notas
class LoadNotes extends NoteEvent {}

// Evento para adicionar uma nova nota
class AddNote extends NoteEvent {
  final String title;
  final String content;
  final String categoryId;

  const AddNote({
    required this.title,
    required this.content,
    required this.categoryId,
  });

  @override
  List<Object> get props => [title, content, categoryId];
}

// Evento para deletar uma nota
class DeleteNote extends NoteEvent {
  final String noteId;

  const DeleteNote({required this.noteId});

  @override
  List<Object> get props => [noteId];
}

// Evento para reordenar as notas (arrastar e soltar)
class ReorderNotes extends NoteEvent {
  final int oldIndex;
  final int newIndex;

  const ReorderNotes({
    required this.oldIndex,
    required this.newIndex,
  });

  @override
  List<Object> get props => [oldIndex, newIndex];
}

<<<<<<< HEAD
// ✅ Novo evento: Editar uma nota existente
class EditNote extends NoteEvent {
  final String noteId; // mantém a consistência com DeleteNote
  final String title;
  final String content;
  final String categoryId; // usar o ID da categoria, não o objeto inteiro

  const EditNote({
=======
class UpdateNoteEvent extends NoteEvent {
  final Note note;
  UpdateNoteEvent(this.note);
}
class UpdateNote extends NoteEvent {
  final String noteId;
  final String title;
  final String content;
  final String categoryId;

  UpdateNote({
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    required this.noteId,
    required this.title,
    required this.content,
    required this.categoryId,
  });
<<<<<<< HEAD

  @override
  List<Object> get props => [noteId, title, content, categoryId];
}
=======
}
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9

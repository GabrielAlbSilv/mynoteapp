import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/note.dart';
<<<<<<< HEAD
=======
import 'edit_note_screen.dart';
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9

// Tela para visualizar os detalhes de uma nota
class NoteDetailScreen extends StatelessWidget {
  final Note note;

  const NoteDetailScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Nota'),
        actions: [
          // Ícone de status de sincronização
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              note.isSynced ? Icons.cloud_done : Icons.cloud_upload_outlined,
              color: note.isSynced ? Colors.greenAccent : Colors.orangeAccent,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem da categoria com animação Hero
              Center(
                child: Hero(
                  tag: 'note_image_${note.id}',
                  child: CachedNetworkImage(
                    imageUrl: note.category.imageUrl,
                    placeholder: (context, url) => Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.broken_image,
                      size: 120,
                      color: colorScheme.error,
                    ),
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Categoria
              Text(
                'CATEGORIA',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                note.category.name,
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              
              // Título
              Text(
                'TÍTULO',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                note.title,
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              
              // Conteúdo
              Text(
                'CONTEÚDO',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                note.content,
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
<<<<<<< HEAD
              
=======

              
              IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditNoteScreen(note: note),
                            ),
                          );
                        },
                      ),
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
              // Data de criação
              Text(
                'DATA DE CRIAÇÃO',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${note.createdAt.day}/${note.createdAt.month}/${note.createdAt.year} às ${note.createdAt.hour}:${note.createdAt.minute.toString().padLeft(2, '0')}',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              
              // Status de sincronização
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: note.isSynced
                      ? Colors.green.withOpacity(0.1)
                      : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: note.isSynced ? Colors.green : Colors.orange,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      note.isSynced ? Icons.cloud_done : Icons.cloud_upload_outlined,
                      color: note.isSynced ? Colors.green : Colors.orange,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      note.isSynced
                          ? 'Sincronizado com a nuvem'
                          : 'Aguardando sincronização',
                      style: textTheme.bodyMedium?.copyWith(
                        color: note.isSynced ? Colors.green : Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
<<<<<<< HEAD
=======
                  
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


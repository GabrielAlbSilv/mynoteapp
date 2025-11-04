import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/note.dart';
<<<<<<< HEAD
import '../screens/note_edit_screen.dart';
=======
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9

// Widget que exibe um card com as informações de uma nota
class NoteCard extends StatefulWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.onDelete,
  });

  @override
  State<NoteCard> createState() => _NoteCardState();
}

<<<<<<< HEAD
class _NoteCardState extends State<NoteCard>
    with SingleTickerProviderStateMixin {
=======
class _NoteCardState extends State<NoteCard> with SingleTickerProviderStateMixin {
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
=======
    // Cria animação para quando o card é tocado
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
<<<<<<< HEAD
=======
    // Anima o card quando é tocado
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    _animationController.forward().then((_) => _animationController.reverse());
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ScaleTransition(
      scale: Tween<double>(begin: 1.0, end: 1.02).animate(
<<<<<<< HEAD
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
=======
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
      ),
      child: Card(
        key: widget.key,
        margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: AnimatedOpacity(
          opacity: _opacityAnimation.value,
          duration: _animationController.duration!,
          child: InkWell(
            onTap: _handleTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
<<<<<<< HEAD
                  // Ícone e imagem da categoria
=======
                  // Ícone de arrastar e imagem da categoria
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
                  Column(
                    children: [
                      Icon(Icons.drag_handle, color: Colors.grey[400]),
                      const SizedBox(height: 8),
<<<<<<< HEAD
=======
                      // Imagem da categoria com cache
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
                      Hero(
                        tag: 'note_image_${widget.note.id}',
                        child: CachedNetworkImage(
                          imageUrl: widget.note.category.imageUrl,
                          placeholder: (context, url) => Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.broken_image,
                            color: colorScheme.error,
                          ),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
<<<<<<< HEAD

=======
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
                  // Conteúdo da nota
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
<<<<<<< HEAD
                        // ✅ Título protegido com LayoutBuilder
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return SizedBox(
                              width: constraints.maxWidth,
                              child: Text(
                                widget.note.title,
                                style: textTheme.titleLarge?.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 4),

                        // ✅ Conteúdo protegido com LayoutBuilder
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return SizedBox(
                              width: constraints.maxWidth,
                              child: Text(
                                widget.note.content,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8),

                        // Categoria + data + status de sincronização
=======
                        // Título
                        Text(
                          widget.note.title,
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Conteúdo
                        Text(
                          widget.note.content,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        // Categoria, data e status de sincronização
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.note.category.name} | ${widget.note.createdAt.day}/${widget.note.createdAt.month}',
                              style: textTheme.bodySmall,
                            ),
                            Icon(
                              widget.note.isSynced
                                  ? Icons.cloud_done
                                  : Icons.cloud_upload_outlined,
                              color: widget.note.isSynced
                                  ? Colors.green
                                  : Colors.orange,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
<<<<<<< HEAD
                  // ✅ Botão de editar
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NoteEditScreen(note: widget.note), // ✅ correto
                        ),
                      );
                    },
                  ),

=======
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
                  // Botão de deletar
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    onPressed: widget.onDelete,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

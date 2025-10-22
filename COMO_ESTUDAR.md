# 📚 Como Estudar Este Projeto

Um guia passo a passo para entender o código e aprender Flutter aos poucos.

## 🎯 Ordem Recomendada de Estudo

### 1️⃣ Comece pelos Modelos (Mais Simples)

#### `lib/models/category.dart`
**O que faz**: Define o que é uma "Categoria" (Casa, Trabalho, etc.)

**Conceitos**:
- Classes em Dart
- Construtores
- `Equatable` (para comparar objetos)
- `const` (valores imutáveis)

**Experimente**:
```dart
// Adicione uma nova categoria em app_constants.dart
const Category(
    id: '5',
    name: 'Saúde',
    imageUrl: 'URL_DO_ICONE_AQUI',
),
```

---

#### `lib/models/note.dart`
**O que faz**: Define o que é uma "Nota"

**Conceitos**:
- Classes com múltiplos campos
- `DateTime` (datas)
- `copyWith` (clonar objetos com mudanças)
- Valores padrão (`isSynced = false`)

**Experimente**:
```dart
// Adicione um novo campo, como prioridade:
final int priority; // 1=baixa, 2=média, 3=alta

// Não esqueça de adicionar no construtor e copyWith!
```

---

### 2️⃣ Entenda os Estados e Eventos (BLoC Pattern)

#### `lib/bloc/note_event.dart`
**O que faz**: Define todas as AÇÕES que o usuário pode fazer

**Conceitos**:
- Classes abstratas (base para outras)
- Herança (`extends`)
- Override de métodos

**Eventos disponíveis**:
- `LoadNotes()` - "Carregue as notas"
- `AddNote()` - "Adicione uma nova nota"
- `DeleteNote()` - "Delete esta nota"
- `ReorderNotes()` - "Reordene a lista"

**Experimente**:
```dart
// Adicione um novo evento para editar nota:
class UpdateNote extends NoteEvent {
  final String noteId;
  final String newTitle;
  final String newContent;

  const UpdateNote({
    required this.noteId,
    required this.newTitle,
    required this.newContent,
  });

  @override
  List<Object> get props => [noteId, newTitle, newContent];
}
```

---

#### `lib/bloc/note_state.dart`
**O que faz**: Define todos os ESTADOS em que o app pode estar

**Conceitos**:
- Estados mutuamente exclusivos
- Imutabilidade

**Estados disponíveis**:
- `NoteInitial()` - App acabou de iniciar
- `NoteLoading()` - Carregando dados
- `NoteLoaded(notes)` - Notas prontas para exibir
- `NoteError(message)` - Algo deu errado

**Fluxo**:
```
Inicial → Loading → Loaded
           ↓
         Error
```

---

#### `lib/bloc/note_bloc.dart` ⭐ (MAIS IMPORTANTE)
**O que faz**: Recebe EVENTOS, processa, emite ESTADOS

**Conceitos**:
- `Emitter` (emite novos estados)
- `async` / `await` (operações assíncronas)
- Manipulação de listas
- UUIDs (IDs únicos)

**Fluxo de um evento**:
```
1. Usuário toca no botão "+" 
   ↓
2. UI dispara: add(AddNote(...))
   ↓
3. BLoC recebe o evento
   ↓
4. _onAddNote() é chamado
   ↓
5. Cria nova nota, adiciona na lista
   ↓
6. Emite novo estado: emit(NoteLoaded(novasNotas))
   ↓
7. UI reconstrói automaticamente
```

**Experimente**:
```dart
// Adicione um handler para o UpdateNote:
void _onUpdateNote(UpdateNote event, Emitter<NoteState> emit) {
  if (state is NoteLoaded) {
    final currentNotes = List<Note>.from((state as NoteLoaded).notes);
    
    // Encontre e atualize a nota
    final index = currentNotes.indexWhere((n) => n.id == event.noteId);
    if (index != -1) {
      currentNotes[index] = currentNotes[index].copyWith(
        title: event.newTitle,
        content: event.newContent,
      );
      _notes = currentNotes;
      emit(NoteLoaded(notes: List.from(_notes)));
    }
  }
}

// Não esqueça de registrar no construtor:
// on<UpdateNote>(_onUpdateNote);
```

---

### 3️⃣ Explore a Interface (UI)

#### `lib/ui/theme.dart`
**O que faz**: Define cores, fontes e estilos

**Conceitos**:
- `ThemeData`
- `ColorScheme`
- Material Design

**Experimente**:
```dart
// Mude a cor primária para verde:
colorScheme: ColorScheme.fromSeed(
  seedColor: Colors.green, // Era deepPurple
  // ...
),
```

---

#### `lib/ui/widgets/note_card.dart`
**O que faz**: Exibe um card de nota na lista

**Conceitos**:
- `StatefulWidget` (tem estado que muda)
- Animações (`AnimationController`)
- `Hero` (animação entre telas)
- Cache de imagens

**Experimente**:
```dart
// Mude a duração da animação:
duration: const Duration(milliseconds: 500), // Era 300
```

---

#### `lib/ui/screens/note_detail_screen.dart`
**O que faz**: Mostra os detalhes completos de uma nota

**Conceitos**:
- `StatelessWidget` (sem estado)
- `SingleChildScrollView` (rolagem)
- Layout com `Column`
- Hero animation

**Experimente**:
```dart
// Adicione um botão de editar na AppBar:
actions: [
  IconButton(
    icon: Icon(Icons.edit),
    onPressed: () {
      // TODO: Abrir diálogo de edição
    },
  ),
  // ... resto do código
],
```

---

#### `lib/ui/screens/home_screen.dart` ⭐ (TELA PRINCIPAL)
**O que faz**: Lista todas as notas, permite adicionar/deletar/reordenar

**Conceitos**:
- `BlocBuilder` (reconstrói quando estado muda)
- `ReorderableListView` (arrastar e soltar)
- `showDialog` (diálogos)
- `Navigator` (navegação)
- `ValueNotifier` (tema)

**Fluxo do BlocBuilder**:
```dart
BlocBuilder<NoteBloc, NoteState>(
  builder: (context, state) {
    if (state is NoteLoading) {
      return CircularProgressIndicator(); // Mostrar loading
    }
    else if (state is NoteLoaded) {
      return ListView(...); // Mostrar lista
    }
    else if (state is NoteError) {
      return Text(state.message); // Mostrar erro
    }
  },
)
```

**Experimente**:
```dart
// Adicione um contador de notas na AppBar:
title: BlocBuilder<NoteBloc, NoteState>(
  builder: (context, state) {
    if (state is NoteLoaded) {
      return Text('Minhas Notas (${state.notes.length})');
    }
    return const Text('Minhas Notas');
  },
),
```

---

### 4️⃣ Veja como tudo se conecta

#### `lib/main.dart`
**O que faz**: Ponto de entrada, conecta tudo

**Conceitos**:
- `MaterialApp`
- `BlocProvider` (fornece o BLoC)
- `ValueListenableBuilder` (escuta mudanças)
- Hot reload

**Estrutura**:
```
MyApp (raiz)
  └─ MaterialApp
      └─ BlocProvider (fornece NoteBloc)
          └─ HomeScreen
              ├─ BlocBuilder (escuta NoteBloc)
              └─ FloatingActionButton (dispara AddNote)
```

---

## 🔄 Como o BLoC Funciona (Exemplo Completo)

Vamos seguir o fluxo de "Adicionar uma nota":

### 1. Usuário toca no botão "+"
```dart
// home_screen.dart
FloatingActionButton(
  onPressed: () => _showAddNoteDialog(context),
  child: const Icon(Icons.add),
),
```

### 2. Diálogo é exibido
```dart
// home_screen.dart - _showAddNoteDialog()
showDialog(
  context: context,
  builder: (dialogContext) {
    return AlertDialog(
      title: const Text('Nova Nota'),
      // ... campos de texto
    );
  },
);
```

### 3. Usuário preenche e clica "Adicionar"
```dart
// home_screen.dart
ElevatedButton(
  onPressed: () {
    context.read<NoteBloc>().add(
      AddNote(
        title: titleController.text,
        content: contentController.text,
        categoryId: selectedCategoryId,
      ),
    );
    Navigator.pop(dialogContext);
  },
  child: const Text('Adicionar'),
),
```

### 4. BLoC recebe o evento
```dart
// note_bloc.dart
class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<AddNote>(_onAddNote); // ← Registra o handler
  }
}
```

### 5. Handler processa
```dart
// note_bloc.dart
void _onAddNote(AddNote event, Emitter<NoteState> emit) async {
  // Pega lista atual
  final currentNotes = List<Note>.from((state as NoteLoaded).notes);
  
  // Cria nova nota
  final newNote = Note(
    id: _uuid.v4(),
    title: event.title,
    content: event.content,
    category: AppConstants.categories.firstWhere((cat) => cat.id == event.categoryId),
    createdAt: DateTime.now(),
    isSynced: false,
  );
  
  // Adiciona no início
  currentNotes.insert(0, newNote);
  _notes = currentNotes;
  
  // Emite novo estado
  emit(NoteLoaded(notes: List.from(_notes)));
}
```

### 6. BlocBuilder reconstrói a UI
```dart
// home_screen.dart
BlocBuilder<NoteBloc, NoteState>(
  builder: (context, state) {
    if (state is NoteLoaded) {
      return ReorderableListView.builder(
        itemCount: state.notes.length, // ← Nova nota aparece aqui!
        itemBuilder: (context, index) {
          final note = state.notes[index];
          return NoteCard(note: note, ...);
        },
      );
    }
  },
)
```

### 7. Usuário vê a nova nota na lista! 🎉

---

## 🛠️ Exercícios Práticos

### Nível 1: Iniciante

1. **Mude as cores do tema**
   - Arquivo: `ui/theme.dart`
   - Troque `Colors.deepPurple` por `Colors.blue`

2. **Adicione uma nova categoria**
   - Arquivo: `utils/app_constants.dart`
   - Adicione "Compras" com um ícone

3. **Mude os textos**
   - Arquivo: `ui/screens/home_screen.dart`
   - Troque "Minhas Notas" por "Meus Lembretes"

### Nível 2: Intermediário

4. **Adicione um campo "prioridade" na nota**
   - Modifique: `models/note.dart`
   - Atualize: `bloc/note_bloc.dart` (nas notas de exemplo)
   - Exiba: `ui/widgets/note_card.dart` (com cores diferentes)

5. **Crie um diálogo de confirmação ao deletar**
   - Arquivo: `ui/screens/home_screen.dart`
   - Use `showDialog` antes de chamar `DeleteNote`

6. **Adicione um contador de palavras no conteúdo**
   - Arquivo: `ui/screens/note_detail_screen.dart`
   - Use `note.content.split(' ').length`

### Nível 3: Avançado

7. **Implemente edição de notas**
   - Adicione: `UpdateNote` event
   - Adicione: `_onUpdateNote` handler no BLoC
   - Crie: Tela ou diálogo de edição

8. **Adicione busca de notas**
   - Adicione: `SearchNotes` event com query
   - Filtre: Notas por título ou conteúdo
   - Crie: TextField de busca no AppBar

9. **Implemente filtro por categoria**
   - Adicione: `FilterByCategory` event
   - Modifique: Estado para incluir filtro ativo
   - Crie: Chips de categoria para filtrar

---

## 💡 Dicas de Depuração

### Print para Debug
```dart
print('Estado atual: $state');
print('Número de notas: ${(state as NoteLoaded).notes.length}');
```

### Use o DevTools
```bash
flutter run
# No terminal, pressione 'v' para abrir o DevTools
```

### Hot Reload
- **r** - Hot reload (rápido, mantém estado)
- **R** - Hot restart (reinicia o app)
- **q** - Quit (sair)

---

## 📖 Conceitos Importantes

### Imutabilidade
```dart
// ❌ ERRADO - Modifica diretamente
state.notes.add(newNote);

// ✅ CORRETO - Cria nova lista
final newList = List.from(state.notes)..add(newNote);
emit(NoteLoaded(notes: newList));
```

### Async/Await
```dart
// Simula operação demorada
await Future.delayed(Duration(seconds: 2));
```

### Context
```dart
// Acessa o BLoC
context.read<NoteBloc>().add(LoadNotes());

// Navega para outra tela
Navigator.push(context, MaterialPageRoute(...));

// Mostra snackbar
ScaffoldMessenger.of(context).showSnackBar(...);
```

---

## 🎓 Recursos Recomendados

1. **Flutter Documentation**: https://docs.flutter.dev/
2. **BLoC Library**: https://bloclibrary.dev/
3. **Dart Language**: https://dart.dev/guides
4. **Material Design**: https://m3.material.io/

---

**Divirta-se aprendendo Flutter! 🚀**

Qualquer dúvida, leia os comentários no código - eles explicam tudo em português!


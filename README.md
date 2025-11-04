# 📝 App de Notas - Projeto Flutter Simples

Um aplicativo de notas simples e bonito feito em Flutter para aprender desenvolvimento mobile aos poucos.

## ✨ Funcionalidades

- ✅ Criar notas com título, conteúdo e categoria
- ✅ Visualizar lista de notas
- ✅ Ver detalhes completos de cada nota
- ✅ Deletar notas
- ✅ Reordenar notas (arrastar e soltar)
- ✅ Tema claro e escuro
- ✅ Animações suaves
- ✅ Ícones de categorias com cache
- ✅ Status de sincronização visual

## 📁 Estrutura do Projeto

```
Hello-World/
├── lib/
│   ├── main.dart                 # Ponto de entrada do app
│   ├── bloc/                     # Gerenciamento de estado (BLoC)
│   │   ├── note_bloc.dart        # Lógica de negócio
│   │   ├── note_event.dart       # Eventos (ações do usuário)
│   │   └── note_state.dart       # Estados da aplicação
│   ├── models/                   # Modelos de dados
│   │   ├── note.dart             # Modelo de Nota
│   │   └── category.dart         # Modelo de Categoria
│   ├── ui/                       # Interface do usuário
│   │   ├── screens/              # Telas
│   │   │   ├── home_screen.dart  # Tela principal
│   │   │   └── note_detail_screen.dart  # Tela de detalhes
│   │   ├── widgets/              # Componentes reutilizáveis
│   │   │   └── note_card.dart    # Card de nota
│   │   └── theme.dart            # Temas claro e escuro
│   └── utils/                    # Utilitários
│       └── app_constants.dart    # Constantes (categorias)
└── pubspec.yaml                  # Dependências do projeto
```

## 🎯 Conceitos que você vai aprender

### 1. **BLoC Pattern (Gerenciamento de Estado)**
O BLoC (Business Logic Component) separa a lógica de negócio da interface:
- **Events**: O que o usuário quer fazer (ex: adicionar nota)
- **States**: Como o app está agora (ex: carregando, pronto)
- **BLoC**: Recebe events, processa e emite novos states

### 2. **Modelos de Dados**
Classes que representam os dados do app (Note, Category)

### 3. **Widgets Flutter**
- **Stateful**: Widgets que mudam (tem estado)
- **Stateless**: Widgets fixos (sem estado)
- **BlocBuilder**: Reconstrói a UI quando o estado muda
- **BlocProvider**: Fornece o BLoC para os widgets

### 4. **Navegação**
- `Navigator.push()`: Vai para outra tela
- `Hero`: Animação entre telas

### 5. **Temas**
- Tema claro e escuro personalizados
- Material Design 3

## 🚀 Como Usar

### 1. Instalar Dependências
```bash
cd Hello-World
flutter pub get
```

### 2. Rodar o App
```bash
flutter run
```

### 3. Funcionalidades do App

#### Adicionar Nota
1. Toque no botão **+** (flutuante no canto inferior direito)
2. Preencha título, conteúdo e escolha a categoria
3. Toque em **Adicionar**

#### Ver Detalhes
1. Toque em qualquer nota da lista
2. Veja todos os detalhes formatados

#### Deletar Nota
1. Toque no ícone de **lixeira** no card da nota
2. A nota será removida

#### Reordenar Notas
1. Segure e arraste o ícone de **três linhas** no card
2. Solte na nova posição

#### Alternar Tema
1. Toque no ícone de **sol/lua** no canto superior direito
2. O tema muda entre claro e escuro

## 📦 Dependências

- **flutter_bloc** (^8.1.5): Gerenciamento de estado
- **equatable** (^2.0.5): Comparação de objetos
- **uuid** (^4.3.3): Geração de IDs únicos
- **cached_network_image** (^3.3.1): Cache de imagens

## 🎨 Categorias Disponíveis

1. **Casa** 🏠
2. **Trabalho** 💼
3. **Estudo** 📚
4. **Pessoal** 👤

## 📚 Próximos Passos para Aprender

Depois de entender este projeto, você pode:

1. Adicionar persistência local (SQLite)
2. Adicionar API de sincronização
3. Implementar busca de notas
4. Adicionar edição de notas
5. Implementar filtro por categoria
6. Adicionar notificações
7. Implementar backup em nuvem

## 🐛 Resolução de Problemas

### Erro ao rodar `flutter pub get`
Certifique-se de que o Flutter está instalado e no PATH:
```bash
flutter doctor
```

### Imagens não carregam
Verifique sua conexão com a internet (as imagens vêm de URLs externas)

### App não compila
1. Limpe o build: `flutter clean`
2. Reinstale dependências: `flutter pub get`
3. Rode novamente: `flutter run`

## 💡 Dicas de Aprendizado

1. **Leia os comentários no código** - Explico tudo em português
2. **Modifique aos poucos** - Mude cores, textos, adicione campos
3. **Experimente quebrar** - Veja o que acontece se remover algo
4. **Use o hot reload** - Salve o arquivo e veja mudanças instantâneas (R no terminal)
5. **Explore os widgets** - Ctrl+Click em qualquer widget para ver o código fonte

## 🎓 Recursos para Estudar

- [Documentação Flutter](https://docs.flutter.dev/)
- [Flutter BLoC Library](https://bloclibrary.dev/)
- [Material Design 3](https://m3.material.io/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

---

**Feito com ❤️ para aprender Flutter**

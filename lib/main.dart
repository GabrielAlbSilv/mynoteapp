import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/note_bloc.dart';
import 'ui/screens/home_screen.dart';
import 'ui/theme.dart';

// Função principal - ponto de entrada do app
void main() {
  runApp(const MyApp());
}

// Widget raiz do aplicativo
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Gerencia o modo de tema (claro/escuro)
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.light);

  @override
  void dispose() {
    _themeMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Escuta mudanças no tema
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeMode,
      builder: (context, currentThemeMode, child) {
        return MaterialApp(
          title: 'Minhas Notas',
          debugShowCheckedModeBanner: false,
          
          // Configura os temas
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentThemeMode,
          
          // Fornece o BLoC para toda a árvore de widgets
          home: BlocProvider(
            create: (context) => NoteBloc(),
            child: HomeScreen(themeModeNotifier: _themeMode),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/note_bloc.dart';
<<<<<<< HEAD
import 'bloc/note_event.dart';
import 'ui/screens/home_screen.dart';
import 'ui/theme.dart';

=======
import 'ui/screens/home_screen.dart';
import 'ui/theme.dart';

// Função principal - ponto de entrada do app
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
void main() {
  runApp(const MyApp());
}

<<<<<<< HEAD
=======
// Widget raiz do aplicativo
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
<<<<<<< HEAD
=======
  // Gerencia o modo de tema (claro/escuro)
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.light);

  @override
  void dispose() {
    _themeMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeMode,
      builder: (context, currentThemeMode, child) {
        return BlocProvider(
          create: (context) => NoteBloc()..add(LoadNotes()),
          child: MaterialApp(
            title: 'Minhas Notas',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: currentThemeMode,
            home: HomeScreen(themeModeNotifier: _themeMode),
=======
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
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

// Define os temas claro e escuro do app
class AppTheme {
  // Tema claro
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
<<<<<<< HEAD

=======
    
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    // Esquema de cores
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: Colors.deepPurple,
      secondary: Colors.amber,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
<<<<<<< HEAD

=======
    
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    // Estilo da barra superior
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      elevation: 4,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
<<<<<<< HEAD

    // Estilo dos cards
    // Estilo dos cards
    cardTheme: const CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    ),
=======
    
    // Estilo dos cards
    // Estilo dos cards
    cardTheme: const CardThemeData(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  ),
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    // Estilo do botão flutuante
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
<<<<<<< HEAD

=======
    
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    // Estilos de texto
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.black54,
      ),
    ),
  );

  // Tema escuro
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple[700],
<<<<<<< HEAD

=======
    
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    // Esquema de cores escuro
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
      primary: Colors.deepPurple[400],
      secondary: Colors.amber[400],
      surface: Colors.grey[900],
      onSurface: Colors.white70,
    ),
<<<<<<< HEAD

=======
    
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    // Estilo da barra superior (escuro)
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
      elevation: 4,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
<<<<<<< HEAD

    // Estilo dos cards (escuro)
    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    ),

=======
    
    // Estilo dos cards (escuro)
    cardTheme: CardThemeData(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    ),

    
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    // Estilo do botão flutuante (escuro)
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurple[400],
      foregroundColor: Colors.white,
    ),
<<<<<<< HEAD

=======
    
>>>>>>> fc0304a8b9ddcd5dde35e41a81afff9d80bac4a9
    // Estilos de texto (escuro)
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple[300],
      ),
      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontSize: 16,
        color: Colors.white70,
      ),
      bodySmall: const TextStyle(
        fontSize: 14,
        color: Colors.white54,
      ),
    ),
  );
}

import '../models/category.dart';

class AppConstants {
  // Categorias padrão para as notas
  static final List<Category> categories = [
    const Category(
      id: '1',
      name: 'Casa',
      imageUrl: 'https://cdn-icons-png.flaticon.com/128/619/619153.png',
    ),
    const Category(
      id: '2',
      name: 'Trabalho',
      imageUrl: 'https://cdn-icons-png.flaticon.com/128/3281/3281307.png',
    ),
    const Category(
      id: '3',
      name: 'Estudo',
      imageUrl: 'https://cdn-icons-png.flaticon.com/128/2995/2995455.png',
    ),
    const Category(
      id: '4',
      name: 'Pessoal',
      imageUrl: 'https://cdn-icons-png.flaticon.com/128/14991/14991730.png',
    ),
  ];
}

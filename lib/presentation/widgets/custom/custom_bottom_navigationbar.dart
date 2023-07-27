import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavigationbar extends StatelessWidget {
  final int currentIndex;

  const CustomBottonNavigationbar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation:
          0, //=> Elimina la linea que separa el BottomNavigationBar de la pagina (en alguno s dispositivos es mas visible que en otros)
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.label_outline), label: 'Categorias'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined), label: 'Favoritos'),
      ],
      onTap: (value) {
        onItemClick(context, value);
      },
    );
  }

  void onItemClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      default:
        context.go('/home/0');
        break;
    }
  }
}

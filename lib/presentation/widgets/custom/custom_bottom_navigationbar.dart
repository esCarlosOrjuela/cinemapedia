import 'package:flutter/material.dart';

class CustomBottonNavigationbar extends StatelessWidget {
  const CustomBottonNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0, //=> Elimina la linea que separa el BottomNavigationBar de la pagina (en alguno s dispositivos es mas visible que en otros)
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_max),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.label_outline), label: 'Categorias'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), label: 'Favoritos'),
      ],
    );
  }
}
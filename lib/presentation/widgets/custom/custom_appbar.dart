import 'package:cinemapedia/config/theme/theme_manager.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      bottom: false, // => eliminar espacio inferior
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colorsTheme.primary),
              const SizedBox(width: 10),
              Text('Cinemapedia', style: textTheme.titleMedium),
              const Spacer(), //=> Ocupa todo el espacio vacio hasta dejar el siguiente elemento contra la margen
              IconButton(
                  onPressed: ThemeManager.switchTheme,
                  icon: Icon(
                    ThemeManager.isLightTheme
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

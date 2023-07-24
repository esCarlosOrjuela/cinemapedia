import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando Películas',
      'Comprobando datos',
      'Cargando recomendaciones para ti',
      'ya casi terminamos',
    ];

    return Stream.periodic(const Duration(milliseconds: 1300), (iteration) {
      return messages[iteration];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Espere por favor'),
        const SizedBox(height: 10),
        const CircularProgressIndicator(strokeWidth: 2),
        const SizedBox(height: 10),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, message) {
            if(!message.hasData) {
              return const Text('Cargando...');
            }
            return Text(message.data!);
          },
        )
      ],
    ));
  }
}

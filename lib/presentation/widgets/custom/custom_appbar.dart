import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../delegates/search_movie_delegate.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
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
                onPressed: () {
                  final searchedMovies = ref.read(searchMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context, 
                    delegate: SearchMovieDelegate(searchMovies: ref.read(searchMoviesProvider.notifier).searchMoviesByQuery, initialMovies: [])
                  ).then((movieSelected) {
                    if(movieSelected == null) return;
                    ref.read(searchQueryProvider.notifier).update((state) => movieSelected.title);
                    context.push('/movieScreen/${movieSelected.id}');
                  });

                },
                icon: const Icon(Icons.search)
              )
            ],
          ),
        ),
      ),
    );
  }
}

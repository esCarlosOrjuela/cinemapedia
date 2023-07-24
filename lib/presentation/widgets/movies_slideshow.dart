import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MoviesSlideShow extends StatelessWidget {
  final List<Movie> movieCollection;
  const MoviesSlideShow({super.key, required this.movieCollection});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper( //=> paquete card_swiper
        autoplay: true,
        scale: 0.9, // => escala las tarjetas anterior y siguinete al elemento actual
        viewportFraction: 0.8, // => me permite ver las tarjetas anterior y siguinete al elemento actual
        itemCount: movieCollection.length,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(bottom: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colorTheme.primary, 
            color: colorTheme.secondary 
          )
        ),
        itemBuilder: (context, index) => _Slide(movie: movieCollection[index]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
          decoration: loadMovieBoxDecoration(),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.backdropPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) =>
                    eventActionLoadingProgress(child, loadingProgress),
              ))),
    );
  }

  BoxDecoration loadMovieBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 10),
            color: Colors.black45,
          )
        ]);
  }

  eventActionLoadingProgress(Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress != null) {
      return const DecoratedBox(
          decoration: BoxDecoration(color: Colors.black12));
    }

    return FadeIn(child: child);
  }
}

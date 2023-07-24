import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/helpers/human_formats.dart';

class MovieHorizontalListView extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  @override
  State<MovieHorizontalListView> createState() =>
      _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    }); // => estar escuchando cambios
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          if (widget.title != null && widget.subTitle != null)
            _TitleBarView(widget.title, widget.subTitle),
          _ListViewMovies(
              movies: widget.movies, scrollController: scrollController)
        ],
      ),
    );
  }
}

class _TitleBarView extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _TitleBarView(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          if (title != null) Text(title!, style: textStyle.titleLarge),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
              onPressed: () => {},
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              child: Text(subTitle!),
            ),
        ],
      ),
    );
  }
}

class _ListViewMovies extends StatelessWidget {
  final List<Movie> movies;
  final ScrollController scrollController;

  const _ListViewMovies({required this.movies, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
        child: ListView.builder(
      controller: scrollController,
      itemCount: movies.length,
      scrollDirection: Axis.horizontal,
      physics:
          const BouncingScrollPhysics(), //=> comportamiento igual en Android y iOS
      itemBuilder: (context, index) {
        final movie = movies[index];

        return FadeInRight(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //** Contenedor Imagen */
                SizedBox(
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      movie.posterPath,
                      width: 150,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return const Padding(
                            padding: EdgeInsets.all(25),
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          );
                        }

                        return GestureDetector(
                            onTap: () => context.push('/movieScreen/${movie.id}'),
                            child: FadeInRight(child: child));
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                //**Rating */
                SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Icon(Icons.star_half_outlined,
                          color: Colors.yellow.shade800),
                      const SizedBox(width: 6),
                      Text('${movie.voteAverage}',
                          style: textTheme.bodyMedium
                              ?.copyWith(color: Colors.yellow.shade800)),
                      const Spacer(),
                      Text(HumanFormats.number(movie.popularity),
                          style: textTheme.bodyLarge),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                //** Titulo */
                SizedBox(
                  width: 150,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Text(
                        movie.title,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: textTheme.labelMedium,
                      )),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}

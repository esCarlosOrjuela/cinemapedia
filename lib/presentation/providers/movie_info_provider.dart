import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_repository_provider.dart';

/*
Map:
  {
    '476358' : Movie(),
    '748355' : Movie(),
    '783465' : Movie(),
    '346756' : Movie(),
    '897654' : Movie(),
  }
*/

/// Creamos la definición del Callaback (es una técnica que se utiliza en programación para pasar una función como argumento a otra función o método)
/// Asignamos una función que nos retornara la pelicula y que reciba un String
typedef GetMovieCallback = Future<Movie> Function(String movieId);

class ManageMovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovieCallback;

  //=> Contructor que recibe como parametro una función que cumpla con la firma: Que nos retornara la pelicula y que reciba un String
  ManageMovieMapNotifier({required this.getMovieCallback}) : super({});

  Future<void> loadMovie(String movieId) async {
    // Si el Id ya existe en el diccionario, no lo consultamos,
    // retornamos lo que existe (datos en memoria)
    if (state[movieId] != null) return;

    // Si el Id no existe en el diccionario, lo consultamos al API
    // usamos la función enviada en el Callaback
    final movie = await getMovieCallback(movieId);

    // Ajustamos el estado de nuestra clase MovieMapNotifier
    // state = Map<String, Movie>
    // El nuevo mapa es luego asignado de nuevo a state.
    // Entonces, actualizamos el estado existente con un nuevo valor para movieId.
    // Si movieId ya existía en el mapa state, su valor será reemplazado por movie; si no existía, será añadido al mapa.
    // Similar a tener algo asi:
    /*
      var state = {'name': 'John', 'age': 30};
      var newId = 123;
      state = {...state, 'id': newId};
    */
    state = {...state, movieId: movie};
  }
}

// AHORA CREAMOS EL PROVEEDOR QUE NOTIFICARA EL ESTADO DE LA CLASE ManageMovieMapNotifier
final movieInfoStatusChangeProvider =
    StateNotifierProvider<ManageMovieMapNotifier, Map<String, Movie>>((ref) {
  // Asignamos la función esperada por el Callback GetMovieCallback
  // Usando a nuestro repositorio de datos
  final functionGetMovie = ref.watch(movieRepositoryProvider).getMovieById;
  // Invocamos a nuestro gestor de notificaciones para mapa de peliculas
  return ManageMovieMapNotifier(getMovieCallback: functionGetMovie);
});

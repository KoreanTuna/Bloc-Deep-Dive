import 'package:door_stamp/core/util/result.dart';
import 'package:door_stamp/presentation/screens/search/data/models/movie_model.dart';

class MovieSearchRepository {
  Future<Result<List<MovieModel>>> searchMovies({
    required String query,
    int? page = 1,
    int? pageSize = 10,
  }) async {
    if (query.isEmpty) {
      return Result.error(Exception('검색어가 비어있습니다.'));
    }

    await Future.delayed(const Duration(seconds: 1));

    final List<MovieModel> movies = [
      MovieModel(id: '1', title: 'Movie One'),
      MovieModel(id: '2', title: '기생충'),
      MovieModel(id: '3', title: 'Oldboy'),
      MovieModel(id: '4', title: '암살'),
      MovieModel(id: '5', title: 'Train to Busan'),
      MovieModel(id: '6', title: '명량'),
      MovieModel(id: '7', title: 'The Handmaiden'),
      MovieModel(id: '8', title: '극한직업'),
      MovieModel(id: '9', title: 'Burning'),
      MovieModel(id: '10', title: '신과함께'),
    ];

    return Result.ok(
      movies
          .where(
            (movie) =>
                movie.title.toLowerCase().startsWith(query.toLowerCase()),
          )
          .toList()
        ..sort((a, b) => a.title.compareTo(b.title)),
    );
  }
}

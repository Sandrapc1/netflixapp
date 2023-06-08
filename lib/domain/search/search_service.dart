import 'package:dartz/dartz.dart';
import 'package:netflix_project/domain/core/failures/main_failures.dart';
import 'package:netflix_project/domain/search/model/search_repo/search_repo.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchRepo>> searchMovies({
    required String movieQuery,
  });
}

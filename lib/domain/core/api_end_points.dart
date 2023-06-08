import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = '$kBaseUrl/trending/all/day?api_key=$apikey';
  static const search = '$kBaseUrl/search/movie?api_key=$apikey';

  static const hotandnewmovie = '$kBaseUrl/discover/movie?api_key=$apikey';
  static const hotandnewtv = '$kBaseUrl/discover/tv?api_key=$apikey';
}

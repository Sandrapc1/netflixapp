import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_project/core/constants.dart';

// import '../../../../core/constants.dart';
part 'search_repo.g.dart';

@JsonSerializable()
class SearchRepo {
  @JsonKey(name: 'results')
  List<SearchResult>? results;
  SearchRepo({this.results = const []});

  factory SearchRepo.fromJson(Map<String, dynamic> json) {
    return _$SearchRepoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRepoToJson(this);
}

@JsonSerializable()
class SearchResult {
//  @JsonKey(name: 'id')
//   int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  SearchResult({
    // this.id,

    this.originalTitle,
    this.posterPath,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return _$SearchResultFromJson(json);
  }

  get posterImageUrl => '$imageAppendUrl$posterPath';

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}

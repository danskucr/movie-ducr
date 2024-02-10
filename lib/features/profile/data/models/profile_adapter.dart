// // To parse this JSON data, do
// //
// //     final profileAdapter = profileAdapterFromJson(jsonString);

// import 'package:hive/hive.dart';
// import 'dart:convert';

// ProfileAdapter profileAdapterFromJson(String str) => ProfileAdapter.fromJson(json.decode(str));

// String profileAdapterToJson(ProfileAdapter data) => json.encode(data.toJson());

// @HiveType(typeId: 1)
// class ProfileAdapter extends HiveObject {
//     @HiveField(1)
//     int? page;
//     @HiveField(2)
//     List<Result>? results;
//     @HiveField(3)
//     int? totalPages;
//     @HiveField(4)
//     int? totalResults;

//     ProfileAdapter({
//          this.page,
//          this.results,
//          this.totalPages,
//          this.totalResults,
//     });
//     ProfileAdapter();

//     factory ProfileAdapter.fromJson(Map<String, dynamic> json) => ProfileAdapter(
//         page: json["page"],
//         results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//         totalPages: json["total_pages"],
//         totalResults: json["total_results"],
//     );

//     Map<String, dynamic> toJson() => {
//         "page": page,
//         "results": List<dynamic>.from(results!.map((x) => x.toJson())),
//         "total_pages": totalPages,
//         "total_results": totalResults,
//     };
// }

// @HiveType(typeId: 2)
// class Result {
//     @HiveField(1)
//     bool adult;
//     @HiveField(2)
//     String backdropPath;
//     @HiveField(3)
//     List<int> genreIds;
//     @HiveField(4)
//     int id;
//     @HiveField(5)
//     String originalLanguage;
//     @HiveField(6)
//     String originalTitle;
//     @HiveField(7)
//     String overview;
//     @HiveField(8)
//     double popularity;
//     @HiveField(9)
//     String posterPath;
//     @HiveField(10)
//     DateTime releaseDate;
//     @HiveField(11)
//     String title;
//     @HiveField(12)
//     bool video;
//     @HiveField(13)
//     double voteAverage;
//     @HiveField(14)
//     int voteCount;

//     Result({
//         required this.adult,
//         required this.backdropPath,
//         required this.genreIds,
//         required this.id,
//         required this.originalLanguage,
//         required this.originalTitle,
//         required this.overview,
//         required this.popularity,
//         required this.posterPath,
//         required this.releaseDate,
//         required this.title,
//         required this.video,
//         required this.voteAverage,
//         required this.voteCount,
//     });

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         adult: json["adult"],
//         backdropPath: json["backdrop_path"],
//         genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//         id: json["id"],
//         originalLanguage: json["original_language"],
//         originalTitle: json["original_title"],
//         overview: json["overview"],
//         popularity: json["popularity"]?.toDouble(),
//         posterPath: json["poster_path"],
//         releaseDate: DateTime.parse(json["release_date"]),
//         title: json["title"],
//         video: json["video"],
//         voteAverage: json["vote_average"]?.toDouble(),
//         voteCount: json["vote_count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "adult": adult,
//         "backdrop_path": backdropPath,
//         "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
//         "id": id,
//         "original_language": originalLanguage,
//         "original_title": originalTitle,
//         "overview": overview,
//         "popularity": popularity,
//         "poster_path": posterPath,
//         "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
//         "title": title,
//         "video": video,
//         "vote_average": voteAverage,
//         "vote_count": voteCount,
//     };
// }

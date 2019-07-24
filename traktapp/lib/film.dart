class Film {
  final String title;
  final int tmdb;
  Film({this.title, this.tmdb});
  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      tmdb: json['ids']['tmdb'],
    );
  }
  static List<Film> fromArray(var jsonArray) {
    List<Film> gelenFilmler = List<Film>();
    if (jsonArray != null) {
      for (Map<String, dynamic> json in jsonArray) {
        gelenFilmler.add(Film.fromJson(json));
      }
    }
    return gelenFilmler;
  }
}

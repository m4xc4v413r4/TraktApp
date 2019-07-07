class Film {
  final String title;
  final int year;
  Film( 
    {
      this.title,
      this.year
    }
  );
  factory Film.fromJson(Map<String,dynamic> json)
  {
    return Film(
      title: json['title'],
      year: json['year'],
    );
  }
  static List<Film> fromArray(var jsonArray)
  {
    List<Film> gelenFilmler = List<Film>();
    if(jsonArray != null)
    {
      for (Map<String, dynamic> json in jsonArray)
      {
        gelenFilmler.add(Film.fromJson(json));
      }
    }
    return gelenFilmler;
  }
}
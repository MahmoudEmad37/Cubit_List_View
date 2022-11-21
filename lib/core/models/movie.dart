class Movie {
   int? id;
   //String? popularity;
   String? title;
   String? overview;
   //String? rating;
   int? voteCount;
   String? date;
   String? originalTitle;

  Movie({
     this.id,
     //this.popularity,
     this.title,
     this.overview,
     //this.rating,
     this.voteCount,
     this.date,
     this.originalTitle,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    //rating = json['vote_average'].toString();
    title = json['title'];
    //popularity = json['popularity'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    date = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    //data['vote_average'] = this.rating;
    data['title'] = this.title;
    //data['popularity'] = this.popularity;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['release_date'] = this.date;
    return data;
  }
}


class Haberler{
  String resimUrl;
  String haberBaslik;
  String haberTanim;
  String haberIcerik;
  String haberUrl;

  Haberler({
  required this.resimUrl,
  required this.haberBaslik,
  required this.haberTanim,
  required this.haberIcerik,
  required this.haberUrl
  });

  static Haberler fromJson(Map<String, dynamic> article) {
    return Haberler(
        resimUrl: article["urlToImage"] ?? "https://www.shutterstock.com/shutterstock/photos/442698565/display_1500/stock-vector-news-anchor-on-tv-breaking-news-background-442698565.jpg",
        haberBaslik: article["title"] ?? "---",
        haberTanim: article["description"] ?? "---",
        haberIcerik: article["content"] ?? "---",
        haberUrl: article["url"] ?? "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en");
  }

}
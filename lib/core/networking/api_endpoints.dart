class ApiEndpoints {
  static const String baseUrl = 'https://dummyjson.com/';


  // home
  static String getTodayDealsProducts() {
    return 'products';
  }

  static String fetchProductsByCategory(String category){
    return 'products/category/$category';
  }



  // static String getPopularTvSeries() {
  //   return 'tv/popular?api_key=$apiKey';
  // }
  // static String getTopRatedTvSeries() {
  //   return 'tv/top_rated?api_key=$apiKey';
  // }
  // static String getOnAirTvSeries() {
  //   return 'tv/on_the_air?api_key=$apiKey';
  // }
//-----------------------------------------------------

}
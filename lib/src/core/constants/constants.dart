class Urls {
  static const String baseUrl = 'https://newsdata.io/api/1/news';
  static const String apiKey = 'pub_34702fa0b47493023de48136aa44fd49d33f2';

  static String getUsNews() => '$baseUrl?apikey=$apiKey&language=en';

  static String getUsNewsByCategory(String category) => '$baseUrl?apikey=$apiKey&language=en&category=$category';

  static String getNewsByCountryAndCategory(String country, String category) =>
      '$baseUrl?apikey=$apiKey&language=en&country=$country&category=$category';
}

class ArticleCategory {
  static const String business = 'business';
  static const String entertainment = 'entertainment';
  static const String general = 'general';
  static const String health = 'health';
  static const String science = 'science';
  static const String sports = 'sports';
  static const String technology = 'technology';
  static const String food = 'food';
  static const String travel = 'travel';
  static const String politics = 'politics';
}

class CountryCode {
  static const String ae = 'ae';
  static const String ar = 'ar';
  static const String at = 'at';
  static const String au = 'au';
  static const String be = 'be';
  static const String bg = 'bg';
  static const String br = 'br';
  static const String ca = 'ca';
  static const String ch = 'ch';
  static const String cn = 'cn';
  static const String co = 'co';
  static const String cu = 'cu';
  static const String cz = 'cz';
  static const String de = 'de';
  static const String eg = 'eg';
  static const String fr = 'fr';
  static const String gb = 'gb';
  static const String gr = 'gr';
  static const String hk = 'hk';
  static const String hu = 'hu';
  static const String id = 'id';
  static const String ie = 'ie';
  static const String il = 'il';
  static const String it = 'it';
  static const String jp = 'jp';
  static const String kr = 'kr';
  static const String lt = 'lt';
  static const String lv = 'lv';
  static const String ma = 'ma';
  static const String mx = 'mx';
  static const String my = 'my';
  static const String ng = 'ng';
  static const String nl = 'nl';
  static const String no = 'no';
  static const String nz = 'nz';
  static const String ph = 'ph';
  static const String pl = 'pl';
  static const String pt = 'pt';
  static const String ro = 'ro';
  static const String rs = 'rs';
  static const String ru = 'ru';
  static const String sa = 'sa';
  static const String se = 'se';
  static const String sg = 'sg';
  static const String si = 'si';
  static const String sk = 'sk';
  static const String th = 'th';
  static const String tr = 'tr';
  static const String tw = 'tw';
  static const String ua = 'ua';
  static const String us = 'us';
  static const String ve = 've';
  static const String za = 'za';
}

class CategoryImages {
  static const String business = 'assets/categories/business.jpg';
  static const String entertainment = 'assets/categories/entertainment.jpg';
  static const String general = 'assets/categories/general.jpg';
  static const String health = 'assets/categories/health.jpg';
  static const String science = 'assets/categories/science.jpg';
  static const String sports = 'assets/categories/sports.jpg';
  static const String technology = 'assets/categories/technology.jpg';
  static const String food = 'assets/categories/food.jpg';
  static const String travel = 'assets/categories/travel.jpg';
  static const String politics = 'assets/categories/politics.jpg';
}

class AssetImages {
  static const String noImage = 'assets/no_image.png';
}

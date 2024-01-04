import 'package:dio/dio.dart';

import '../models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apikey=4aed9d0a2ef745e69f977d7d71a45809&country=us&category=$category');
//بتبقى Map أو List على حسب شكل البيانات اللى عندى
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel =ArticleModel.fromJson(article);

        //حطينا بدالها فى ال model
        /* ArticleModel(
            image: article['urlToImage'],
            title: article['title'],
            subTitle: article['description']);*/

        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}


// import 'package:news_app_ui_setup/models/article_model.dart';

// class NewsService {
//   final Dio dio;

//   NewsService(this.dio);

//   Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
//     try {
//       var response = await dio.get(
//           'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c88955c487e4d9db668f011dd85e737&category=$category');

//       Map<String, dynamic> jsonData = response.data;

//       List<dynamic> articles = jsonData['articles'];

//       List<ArticleModel> articlesList = [];

//       for (var article in articles) {
//         ArticleModel articleModel = ArticleModel(
//           image: article['urlToImage'],
//           title: article['title'],
//           subTitle: article['description'],
//         );
//         articlesList.add(articleModel);
//       }

//       return articlesList;
//     } catch (e) {
//       return [];
//     }
//   }
// }

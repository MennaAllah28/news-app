import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_card.dart';
import 'package:dio/dio.dart';
import '../models/article_model.dart';
import '../services/news_service.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/news_list_view.dart';
import '../widgets/news_list_view_builder.dart';
import '../widgets/news_tile.dart';
//import 'package:news_app_ui_setup/widgets/categories_list_view.dart';

//import '../widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Cloud',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              NewsListViewBuilder(
                category: 'general',
              ),
            ],
          ),
          // child: Column(
          //   children: [
          //     CategoriesListView(),
          //     SizedBox(
          //       height: 320,
          //     ),
          //     Expanded(child: NewsListView()),
          //   ],
          // ),
        ));
  }
}


//https://newsapi.org/v2/everything?q=bitcoin&apikey=3c88955c487e4d9db668f011dd85e737
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
  final List<CategoryModel> categories = const [
    CategoryModel(
        image: 'assets/images/entertaiment.avif', categoryName: 'Business'),
    CategoryModel(
        image: 'assets/images/entertaiment.avif', categoryName: 'Entertainment'),
    CategoryModel(
        image: 'assets/images/entertaiment.avif', categoryName: 'General'),
    CategoryModel(
        image: 'assets/images/entertaiment.avif', categoryName: 'Health'),
    CategoryModel(
        image: 'assetsimages/entertaiment.avif', categoryName: 'Science'),
    CategoryModel(
        image: 'assets/images/entertaiment.avif', categoryName: 'Sports'),
    CategoryModel(
        image: 'assets/images/technology.jpeg', categoryName: 'Technology'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
            );
          }),
    );
  }
}

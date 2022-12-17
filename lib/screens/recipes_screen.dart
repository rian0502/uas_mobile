import 'dart:developer';


import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';

import '../components/recipe_grid_view.dart';
import '../models/explore_data.dart';


class RecipesScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();
  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return RecipeGridView(recipes: snapshot.data!.simpleRecipes!);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }


}


import 'package:flutter/material.dart';


import '../api/mock_fooderlich_service.dart';
import '../components/friend_post_list_view.dart';
import '../components/today_recipe_list_view.dart';
import '../models/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  final mockServic = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockServic.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final exploreData = snapshot.data;
            return ListView(
              children: [
                TodayRecipeListView(recipes: exploreData!.todayRecipes!),
                const SizedBox(height: 16),
                FriendPostListView(friendPosts: exploreData.friendPosts!),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

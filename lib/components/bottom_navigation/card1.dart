
import 'package:flutter/material.dart';

import '../../thema.dart';
import '../../models/explore_recipe.dart';

class Card1 extends StatelessWidget {

  final ExploreRecipe recipe;

  const Card1({Key? key, required this.recipe}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Stack(children: [
              Text(
                recipe.subtitle.toString(),
                style: Thema.darkTextTheme.bodyText1,
              ),
              Positioned(
                child: Text(
                  recipe.title.toString(),
                  style: Thema.darkTextTheme.headline2,
                ),
                top: 20,
              ),
              Positioned(
                child: Text(
                  recipe.message.toString(),
                  style: Thema.darkTextTheme.bodyText1,
                ),
                bottom: 30,
                right: 0,
              ),
              Positioned(
                child: Text(
                  recipe.authorName.toString(),
                  style: Thema.darkTextTheme.bodyText1,
                ),
                bottom: 10,
                right: 0,
              ),
            ]),
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints.expand(width: 350, height: 450),
            decoration: BoxDecoration(
                image:  DecorationImage(
                    image: AssetImage(recipe.backgroundImage.toString()), fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 10),
                      blurRadius: 10)
                ]
            )
        )
    );
  }
}

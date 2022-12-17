import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/app_state_manager.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/fooderlich_assets/empty_list.png'),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'No Groceries',
              style: TextStyle(fontSize: 21.0),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Shooping for ingredients?\nTap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              onPressed: () {
                context.goNamed(
                    'home',
                    params: {
                    'tab': '${FooderlichTab.recipes}',
                    },
                );
              },
              color: Colors.green[400],
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: const Text('Browse Recipes'),
            ),
          ],
        ),
      ),
    );
  }
}

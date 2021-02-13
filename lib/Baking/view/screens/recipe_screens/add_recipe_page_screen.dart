import 'package:baking_app/Baking/view/screens/recipe_screens/add_recipe_screen.dart';
import 'package:baking_app/Baking/view/screens/recipe_screens/pastry_detail_screen.dart';
import 'package:flutter/material.dart';





class AddRecipePageScreen extends StatefulWidget {
  @override
  _AddRecipePageScreenState createState() => _AddRecipePageScreenState();
}

class _AddRecipePageScreenState extends State<AddRecipePageScreen> {
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          
          children: [
            AddRecipeScreen(),
             AddRecipeScreen(),
           PastryDetailScreen(),
          ],
        ),
      ),
    );
  }
}

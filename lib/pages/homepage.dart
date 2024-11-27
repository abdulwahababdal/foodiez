import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodiez/pages/chineserecipes.dart';
import 'package:foodiez/pages/egyptionrecipes.dart';
import 'package:foodiez/pages/indianRecipes.dart';
import 'package:foodiez/pages/japaneserecipes.dart';
import 'package:foodiez/pages/kuwaitirecipes.dart';
import 'package:foodiez/pages/recipepage.dart';
import 'package:foodiez/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final List<String> imagePaths = [
    'assets/images/chinessfood.webp',
    'assets/images/Egyptfood.webp',
    'assets/images/kuwaitifood.jpeg',
  ];

  final List<Map<String, dynamic>> categories = [
    {'image': 'assets/images/chinese.png', 'title': 'Chinese Food'},
    {'image': 'assets/images/egypt.png', 'title': 'Egyptian Food'},
    {'image': 'assets/images/kuwait.png', 'title': 'Kuwaiti Food'},
    {'image': 'assets/images/indian.png', 'title': 'Indian Food'},
    {'image': 'assets/images/japanese.png', 'title': 'Japanese Food'},
  ];

  final List<Map<String, dynamic>> popularRecipes = [
    {
      'image': 'assets/images/chinessfood.webp',
      'name': 'Sweet and Sour Chicken',
      'description': 'A delicious Chinese dish with sweet and tangy flavors.',
      'ingredients': ['Chicken', 'Bell Peppers', 'Pineapple', 'Soy Sauce'],
      'steps': [
        'Heat oil in a pan.',
        'Add chicken and cook until golden brown.',
        'Mix in bell peppers and pineapple.',
        'Add soy sauce and simmer for 10 minutes.',
      ],
    },
    // (other recipes omitted for brevity) ...
  ];

  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DishCraft',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      drawer: CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /////// 3 Photos
          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          //////// dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imagePaths.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ////// categories section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Food Type Categories',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: () {
                      ////// navigate based on the category title
                      if (categories[index]['title'] == 'Chinese Food') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChineseRecipesPage()),
                        );
                      } else if (categories[index]['title'] ==
                          'Egyptian Food') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EgyptianRecipesPage()),
                        );
                      } else if (categories[index]['title'] == 'Kuwaiti Food') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KuwaitiRecipesPage()),
                        );
                      } else if (categories[index]['title'] == 'Indian Food') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IndianRecipesPage()),
                        );
                      } else if (categories[index]['title'] ==
                          'Japanese Food') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JapaneseRecipesPage()),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              categories[index]['image']!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          categories[index]['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ////////// title for popular recipes
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Popular Recipes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          ///////// popular recipes list
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: popularRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = popularRecipes[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipePage(
                            image: recipe['image']!,
                            name: recipe['name']!,
                            description: recipe['description']!,
                            ingredients:
                                List<String>.from(recipe['ingredients']),
                            steps: List<String>.from(recipe['steps']),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          recipe['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

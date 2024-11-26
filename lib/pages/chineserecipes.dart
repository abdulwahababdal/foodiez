import 'package:flutter/material.dart';

class ChineseRecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, String>> chineseRecipes = [
      {
        'name': 'Sweet and Sour Chicken',
        'image': 'assets/images/chinessfood.webp',
      },
      {
        'name': 'Kung Pao Chicken',
        'image': 'images/KungPaoChicken.jpeg',
      },
      {'name': 'Spring Rolls', 
      'image': 'images/SpringRolls.jpg',
      }, 
      {'name': 'Fried Rice',
       'image': 'images/FriedRice.jpg',
      },  
      {'name': 'Hot and Sour Soup',
       'image': 'images/HotSourSoup.jpg',
       }, 
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chinese Recipes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: chineseRecipes.length,
          itemBuilder: (context, index) {
            final recipe = chineseRecipes[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                height: 200, // height for cards
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    
                    ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(15),
                      ),
                      child: recipe['image']!.isNotEmpty
                          ? Image.asset(
                              recipe['image']!,
                              width: 180, //  width for  image
                              height: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: 100,
                              color: Colors.grey[300], 
                              child: Icon(Icons.image, size: 40),
                            ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe['name']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16, 
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Click to learn more",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12, 
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:foodiez/models/recipe.dart';

import 'package:foodiez/services/client.dart';

class DioClient {
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes = [];
    try {
      Response response = await Client.dio.get('/recipes');
      // print((response.data as List));
      recipes = (response.data as List).map((recipe) {
        return Recipe.fromJson(recipe);
      }).toList();
    } on DioException catch (error) {
      print('cannot get recipes');
      print(error);
    }
    return recipes;
  }

  Future<Recipe> createRecipe({required Recipe recipe}) async {
    late Recipe retrievedRecipe;
    try {
      FormData data = FormData.fromMap({
        "name": recipe.name,
        "username": recipe.username,
        "ingredients": recipe.ingredients,
        "description": recipe.description,
        "category": recipe.category,
        //await MultipartFile.fromFile(

        //),
      });
      Response response = await Client.dio.post('/recipes', data: data);
      // print(response.data);
      // print(response.data['recipe']);
      retrievedRecipe = Recipe.fromJson2(response.data['recipe']);
      // print(retrievedRecipe);
    } on DioException catch (error) {
      print(error);
    }
    return retrievedRecipe;
  }

  Future<Recipe> updateRecipe({required Recipe recipe}) async {
    late Recipe retrievedRecipe;
    try {
      FormData data = FormData.fromMap({
        "name": recipe.name,
        "username": recipe.username,
        "ingredients": recipe.ingredients,
        "description": recipe.description,
        "category": recipe.category,
        "image": recipe.image,
        //await MultipartFile.fromFile(recipe.image),
      });

      Response response =
          await Client.dio.put('/recipes/${recipe.id}', data: data);
      retrievedRecipe = Recipe.fromJson(response.data);
    } on DioException catch (error) {
      print(error);
    }
    return retrievedRecipe;
  }

  Future<void> deleteRecipe({required String recipeId}) async {
    try {
      await Client.dio.delete('/recipes/$recipeId');
    } on DioException catch (error) {
      print(error);
    }
  }
}

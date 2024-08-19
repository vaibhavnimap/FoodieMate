import 'dart:convert';

import 'package:foodiemate/data/models/restaurant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;
  RxList<Restaurant> filterRestaurants = <Restaurant>[].obs;

  Future<void> fetchRestaurants() async {
    final url =
        'https://mocki.io/v1/ce484d1c-f1e0-4513-97fb-5f60e6ac035c'; // Replace with your API URL
    https: //mocki.io/v1/ce484d1c-f1e0-4513-97fb-5f60e6ac035c

    final response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      var restaurantList = jsonResponse['Restaurant'] as List;

      restaurants.value =
          restaurantList.map((item) => Restaurant.fromJson(item)).toList();
      filterRestaurants.value = restaurants;
    } else {
      // If the server did not return an OK response, throw an exception
      throw Exception('Failed to load restaurants');
    }
  }

  void searchFunc(String searchText) {
    if (searchText.isEmpty) {
      filterRestaurants.value = restaurants;
    } else {
      filterRestaurants.value = restaurants
          .where((m) => m.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }
}

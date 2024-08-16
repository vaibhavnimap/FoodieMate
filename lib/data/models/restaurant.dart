class Restaurant {
  final String name;
  final String location;
  final double rating;
  final String image;
  final List<Category> category;

  Restaurant({
    required this.name,
    required this.location,
    required this.rating,
    required this.image,
    required this.category,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    var list = json['Category'] as List;
    List<Category> categoryList =
        list.map((i) => Category.fromJson(i)).toList();

    return Restaurant(
      name: json['Name'],
      location: json['Location'],
      rating: json['Rating'].toDouble(),
      image: json['Image'],
      category: categoryList,
    );
  }
}

class Category {
  final String catName;
  final List<Product> product;

  Category({
    required this.catName,
    required this.product,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var list = json['Product'] as List;
    List<Product> productList = list.map((i) => Product.fromJson(i)).toList();

    return Category(
      catName: json['Cat_name'],
      product: productList,
    );
  }
}

class Product {
  final String productName;
  final String productDescription;
  final double price;
  final String productImage;

  Product({
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.productImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['Productname'],
      productDescription: json['Product description'],
      price: json['Price'].toDouble(),
      productImage: json['Product image'],
    );
  }
}

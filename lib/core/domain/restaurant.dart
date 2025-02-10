class Restaurant {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menus? menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  const Restaurant({
    this.id = '',
    this.name = '',
    this.description = '',
    this.city = '',
    this.address = '',
    this.pictureId = '',
    this.categories = const [],
    this.menus,
    this.rating = 0.0,
    this.customerReviews = const [],
  });

  @override
  String toString() {
    return 'Restaurant{id: $id,  name: $name, username:$name, description:$description, city:$city, categories:$categories,}';
  }
}

class Category {
  final String name;

  Category({
    this.name = '',
  });

  @override
  String toString() {
    return 'Category{ name$name }';
  }
}

class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({
    this.name = '',
    this.review = '',
    this.date = '',
  });

  @override
  String toString() {
    return 'CustomerReview{ name$name, review:$review, date:$date }';
  }
}

class Menus {
  final List<Category> foods;
  final List<Category> drinks;

  const Menus({
    this.foods = const [],
    this.drinks = const [],
  });

  @override
  String toString() {
    return 'Menus{foods: $foods,  drinks: $drinks, }';
  }
}

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
}

class Category {
  final String name;

  Category({
    this.name = '',
  });
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
}

class Menus {
  final List<Category> foods;
  final List<Category> drinks;

  const Menus({
    this.foods = const [],
    this.drinks = const [],
  });
}

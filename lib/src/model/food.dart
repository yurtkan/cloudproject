enum FoodType { all, main, desert }

class Food {
  String image;
  String name;
  double price;
  int quantity;
  bool isFavorite;
  String description;

  Food(
    this.image,
    this.name,
    this.price,
    this.quantity,
    this.isFavorite,
    this.description,
  );
}

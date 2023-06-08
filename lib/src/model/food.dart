enum FoodType { all, main, desert }

class Food {
  int dbid;
  String image;
  String name;
  double price;
  int quantity;
  bool isFavorite;
  String description;

  Food(
    this.dbid,
    this.image,
    this.name,
    this.price,
    this.quantity,
    this.isFavorite,
    this.description,
  );

  // factory Food.fromJson(dynamic json) {
  //   return Food(
  //     json['image'],
  //     json['name'],
  //     json['price'],
  //     json['quantity'],
  //     false,
  //     json['description'],
  //   );
  // }
}

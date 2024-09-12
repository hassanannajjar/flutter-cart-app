class CartDataModel {
  CartDataModel({
    this.title,
    this.price,
    this.image,
    this.details,
    this.quantity,
    this.expanded,
  });

  String? title;
  int? price;
  String? image;
  String? details;
  int? quantity;
  bool? expanded;
}

class RecommendedItemModel {
  RecommendedItemModel({
    this.title,
    this.image,
  });

  String? title;
  String? image;
}

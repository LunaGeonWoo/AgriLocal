class ProductTinyModel {
  final int id;
  final String owner;
  final String address;
  final String name;
  final String imageUrl;
  final int price;
  final String createdAt;

  ProductTinyModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        owner = json["owner"],
        address = json["address"],
        name = json["name"],
        imageUrl = json["image_url"],
        price = json["price"],
        createdAt = json["created_at"];
}

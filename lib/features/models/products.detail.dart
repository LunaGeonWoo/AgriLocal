class ProductDetailModel {
  final int id;
  final int ownerId;
  final String ownerName;
  final String ownerAddress;
  final String name;
  final String imageUrl;
  final String description;
  final int price;
  final String createdAt;

  ProductDetailModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        ownerId = json["owner"]["id"],
        ownerName = json["owner"]["name"],
        ownerAddress = json["owner"]["address"],
        name = json["name"],
        imageUrl = json["image_url"],
        description = json["description"],
        price = json["price"],
        createdAt = json["created_at"];
}

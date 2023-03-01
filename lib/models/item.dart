import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  ItemModel({
    required this.id,
    required this.title,
    required this.category,
    required this.images,
  });

  int id;
  String title;
  String category;
  List<ImageModel> images;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class ImageModel {
  ImageModel({
    required this.title,
    required this.image,
  });

  String title;
  String image;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
      };
}

import 'package:kids_bids/models/item.dart';

class LocalServer {
  static List<ItemModel> itemLists() {
    return [
      ItemModel(id: 1, title: "Orange", category: "Fruits", images: [
        ImageModel(title: "Apple", image: 'assets/fruits/apple.png'),
        ImageModel(title: "Orange", image: 'assets/fruits/orange.png')
      ]),
      ItemModel(id: 2, title: "Apple", category: "Fruits", images: [
        ImageModel(title: "Apple", image: 'assets/fruits/apple.png'),
        ImageModel(title: "Orange", image: 'assets/fruits/orange.png')
      ]),
      ItemModel(id: 3, title: "Banana", category: "Fruits", images: [
        ImageModel(title: "Apple", image: 'assets/fruits/apple.png'),
        ImageModel(title: "Orange", image: 'assets/fruits/orange.png')
      ]),
      ItemModel(id: 4, title: "Jack Fruits", category: "Fruits", images: [
        ImageModel(title: "Apple", image: 'assets/fruits/apple.png'),
        ImageModel(title: "Orange", image: 'assets/fruits/orange.png')
      ]),
      ItemModel(id: 5, title: "Pum", category: "Fruits", images: [
        ImageModel(title: "Apple", image: 'assets/fruits/apple.png'),
        ImageModel(title: "Orange", image: 'assets/fruits/orange.png')
      ]),
    ];
  }
}

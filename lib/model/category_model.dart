class CategoryModel {
  String? name;
  String? image;

  CategoryModel({
    required this.name,
    required this.image,
  });

  CategoryModel.fromJSON(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
  }
  toJSON() {
    return {
      'image': image,
      'name': name,
    };
  }
}

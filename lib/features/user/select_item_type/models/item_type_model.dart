class ItemTypeModel {
  final String name;
  final String image;

  ItemTypeModel({required this.name, required this.image});
  factory ItemTypeModel.fromJson(Map<String, dynamic> json) {
    return ItemTypeModel(name: json['name'], image: json['image']);
  }
  toJson() => {'name': name, 'image': image};
}

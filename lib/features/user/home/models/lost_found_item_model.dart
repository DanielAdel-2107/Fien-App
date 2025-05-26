class User {
  final int id;
  final String username;
  final String email;
  final String? location;
  final double? averageRating;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.location,
    this.averageRating,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      username: json['username']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      location: json['location']?.toString(),
      averageRating: json['average_rating'] != null
          ? double.tryParse(json['average_rating'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'location': location,
      'average_rating': averageRating,
    };
  }

  @override
  String toString() {
    return "$username $email";
  }
}
class ItemType {
  final int id;
  final String name;

  ItemType({required this.id, required this.name});

  factory ItemType.fromJson(Map<String, dynamic> json) {
    return ItemType(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      name: json['name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() => name;
}
class LostFoundItemModel {
  final int id;
  final User user;
  final String title;
  final ItemType itemType;
  final String status;
  final String locationDescription;
  final String? exactAddress;
  final String? transportationType;
  final DateTime dateTime;
  final String comments;
  final String image;
  final bool isResolved;
  final DateTime createdAt;

  LostFoundItemModel({
    required this.id,
    required this.user,
    required this.title,
    required this.itemType,
    required this.status,
    required this.locationDescription,
    this.exactAddress,
    this.transportationType,
    required this.dateTime,
    required this.comments,
    required this.image,
    required this.isResolved,
    required this.createdAt,
  });

  factory LostFoundItemModel.fromJson(Map<String, dynamic> json) {
    return LostFoundItemModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      user: json['user'] is Map<String, dynamic>
          ? User.fromJson(json['user'])
          : User(id: 0, username: 'Unknown', email: 'unknown@example.com'),
      title: json['title']?.toString() ?? '',
      itemType: json['item_type'] is Map<String, dynamic>
          ? ItemType.fromJson(json['item_type'])
          : ItemType(id: 0, name: 'Unknown'),
      status: json['status']?.toString() ?? '',
      locationDescription: json['location_description']?.toString() ?? '',
      exactAddress: json['exact_address']?.toString(),
      transportationType: json['transportation_type']?.toString(),
      dateTime: DateTime.tryParse(json['date_time']?.toString() ?? '') ?? DateTime.now(),
      comments: json['comments']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      isResolved: json['is_resolved'] == true || json['is_resolved'] == 1,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'title': title,
      'item_type': itemType.toJson(),
      'status': status,
      'location_description': locationDescription,
      'exact_address': exactAddress,
      'transportation_type': transportationType,
      'date_time': dateTime.toIso8601String(),
      'comments': comments,
      'image': image,
      'is_resolved': isResolved,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return "$title $status $locationDescription $comments $image $isResolved $createdAt $user $itemType $dateTime";
  }
}

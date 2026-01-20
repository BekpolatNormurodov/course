class CartItemModel {
  final int id;
  final int userId;
  final int courseId;
  final String? courseName;
  final String? courseImage;
  final double? price;
  final DateTime? addedAt;

  CartItemModel({
    required this.id,
    required this.userId,
    required this.courseId,
    this.courseName,
    this.courseImage,
    this.price,
    this.addedAt,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? json['user_id'] ?? 0,
      courseId: json['courseId'] ?? json['course_id'] ?? 0,
      courseName: json['courseName'] ?? json['course_name'],
      courseImage: json['courseImage'] ?? json['course_image'],
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      addedAt:
          json['addedAt'] != null
              ? DateTime.tryParse(json['addedAt'])
              : (json['added_at'] != null
                  ? DateTime.tryParse(json['added_at'])
                  : null),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'courseId': courseId,
      'courseName': courseName,
      'courseImage': courseImage,
      'price': price,
      'addedAt': addedAt?.toIso8601String(),
    };
  }
}

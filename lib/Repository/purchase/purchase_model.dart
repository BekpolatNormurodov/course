class PurchaseModel {
  final int id;
  final int userId;
  final int courseId;
  final String? courseName;
  final String? courseImage;
  final double? price;
  final DateTime? purchaseDate;
  final Map<String, dynamic>? courseData;

  PurchaseModel({
    required this.id,
    required this.userId,
    required this.courseId,
    this.courseName,
    this.courseImage,
    this.price,
    this.purchaseDate,
    this.courseData,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? json['user_id'] ?? 0,
      courseId: json['courseId'] ?? json['course_id'] ?? 0,
      courseName: json['courseName'] ?? json['course_name'],
      courseImage: json['courseImage'] ?? json['course_image'],
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      purchaseDate:
          json['purchaseDate'] != null
              ? DateTime.tryParse(json['purchaseDate'])
              : (json['purchase_date'] != null
                  ? DateTime.tryParse(json['purchase_date'])
                  : null),
      courseData: json['course'] as Map<String, dynamic>?,
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
      'purchaseDate': purchaseDate?.toIso8601String(),
      'course': courseData,
    };
  }
}

class TeacherModel {
  final int id;
  final String? name;
  final String? email;
  final String? phone;
  final String? bio;
  final String? avatar;
  final String? expertise;
  final int? totalCourses;
  final int? totalStudents;
  final double? rating;
  final DateTime? createdAt;

  TeacherModel({
    required this.id,
    this.name,
    this.email,
    this.phone,
    this.bio,
    this.avatar,
    this.expertise,
    this.totalCourses,
    this.totalStudents,
    this.rating,
    this.createdAt,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id: json['id'] ?? 0,
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      bio: json['bio'],
      avatar: json['avatar'],
      expertise: json['expertise'],
      totalCourses: json['totalCourses'] ?? json['total_courses'],
      totalStudents: json['totalStudents'] ?? json['total_students'],
      rating:
          json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'bio': bio,
      'avatar': avatar,
      'expertise': expertise,
      'totalCourses': totalCourses,
      'totalStudents': totalStudents,
      'rating': rating,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}

class StudentPurchaserModel {
  final int id;
  final String? name;
  final String? email;
  final String? phone;
  final DateTime? purchaseDate;

  StudentPurchaserModel({
    required this.id,
    this.name,
    this.email,
    this.phone,
    this.purchaseDate,
  });

  factory StudentPurchaserModel.fromJson(Map<String, dynamic> json) {
    return StudentPurchaserModel(
      id: json['id'] ?? 0,
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      purchaseDate:
          json['purchaseDate'] != null
              ? DateTime.tryParse(json['purchaseDate'])
              : (json['purchase_date'] != null
                  ? DateTime.tryParse(json['purchase_date'])
                  : null),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'purchaseDate': purchaseDate?.toIso8601String(),
    };
  }
}

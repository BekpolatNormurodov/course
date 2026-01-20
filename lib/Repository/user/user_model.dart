class UserModel {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String role;
  final String? image;
  final String? birthDate;
  final String? gender;
  final bool isDeleted;

  UserModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    required this.role,
    this.image,
    this.birthDate,
    this.gender,
    this.isDeleted = false,
  });

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}'.trim();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      role: json['role'] ?? 'student',
      image: json['image'],
      birthDate: json['birth_date'],
      gender: json['gender'],
      isDeleted: json['is_deleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'role': role,
      'image': image,
      'birth_date': birthDate,
      'gender': gender,
      'is_deleted': isDeleted,
    };
  }
}

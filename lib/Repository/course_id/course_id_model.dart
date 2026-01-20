// lib/models/course_detail_model.dart
import 'dart:convert';

CourseIdModel courseIdModelFromJson(String str) =>
    CourseIdModel.fromJson(json.decode(str) as Map<String, dynamic>);

class CourseIdModel {
  final Course data;
  final List<String> directionUz;
  final List<String> directionEn;
  final List<String> directionRu;
  final String languagesUz;
  final String languagesEn;
  final String languagesRu;
  final String educationLevelUz;
  final String educationLevelEn;
  final String educationLevelRu;
  final bool isDeleted;
  final int soldCount;
  final String status;
  final int teacherId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Teacher teacher;
  final List<ModuleModel> modul;
  final List<CourseComment> comment;
  final int totalModules;
  final String totalDurationFormatted;
  final DateTime? purchaseDate;
  final bool isPurchased;
  final double averageRating;
  final int commentCount;

  CourseIdModel({
    required this.data,
    required this.directionUz,
    required this.directionEn,
    required this.directionRu,
    required this.languagesUz,
    required this.languagesEn,
    required this.languagesRu,
    required this.educationLevelUz,
    required this.educationLevelEn,
    required this.educationLevelRu,
    required this.isDeleted,
    required this.soldCount,
    required this.status,
    required this.teacherId,
    required this.createdAt,
    required this.updatedAt,
    required this.teacher,
    required this.modul,
    required this.comment,
    required this.totalModules,
    required this.totalDurationFormatted,
    required this.purchaseDate,
    required this.isPurchased,
    required this.averageRating,
    required this.commentCount,
  });

  factory CourseIdModel.fromJson(Map<String, dynamic> json) {
    return CourseIdModel(
      data: Course.fromJson(json['data'] ?? {}),
      directionUz: List<String>.from(json['direction_uz'] ?? []),
      directionEn: List<String>.from(json['direction_en'] ?? []),
      directionRu: List<String>.from(json['direction_ru'] ?? []),
      languagesUz: json['languages_uz'] ?? '',
      languagesEn: json['languages_en'] ?? '',
      languagesRu: json['languages_ru'] ?? '',
      educationLevelUz: json['education_level_uz'] ?? '',
      educationLevelEn: json['education_level_en'] ?? '',
      educationLevelRu: json['education_level_ru'] ?? '',
      isDeleted: json['is_deleted'] ?? false,
      soldCount: json['sold_count'] ?? 0,
      status: json['status'] ?? '',
      teacherId: json['teacher_id'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      teacher: Teacher.fromJson(json['teacher'] ?? {}),
      modul: (json['modul'] as List<dynamic>? ?? [])
          .map((e) => ModuleModel.fromJson(e))
          .toList(),
      comment: (json['comment'] as List<dynamic>? ?? [])
          .map((e) => CourseComment.fromJson(e))
          .toList(),
      totalModules: json['total_modules'] ?? 0,
      totalDurationFormatted: json['total_duration_formatted'] ?? '',
      purchaseDate: json['purchase_date'] != null
          ? DateTime.tryParse(json['purchase_date'])
          : null,
      isPurchased: json['is_purchased'] ?? false,
      averageRating: _toDouble(json['average_rating']),
      commentCount: json['comment_count'] ?? 0,
    );
  }
}

/// double ni xavfsiz parse qiladigan helper
double _toDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0.0;
}

class Course {
  final int id;
  final String coursesNameUz;
  final String coursesNameEn;
  final String coursesNameRu;
  final String descriptionUz;
  final String descriptionEn;
  final String descriptionRu;
  final String shortDescUz;
  final String shortDescEn;
  final String shortDescRu;
  final String image;
  final List<String> categoryUz;
  final List<String> categoryEn;
  final List<String> categoryRu;
  final String authorName;
  final int addedUser;
  final int lessonsNumbers;
  final int duration;
  final bool coursesFree;
  final int salePrice;
  final String learnMoreDescUz;
  final String learnMoreDescEn;
  final String learnMoreDescRu;
  final LearnMore learnMore;

  Course({
    required this.id,
    required this.coursesNameUz,
    required this.coursesNameEn,
    required this.coursesNameRu,
    required this.descriptionUz,
    required this.descriptionEn,
    required this.descriptionRu,
    required this.shortDescUz,
    required this.shortDescEn,
    required this.shortDescRu,
    required this.image,
    required this.categoryUz,
    required this.categoryEn,
    required this.categoryRu,
    required this.authorName,
    required this.addedUser,
    required this.lessonsNumbers,
    required this.duration,
    required this.coursesFree,
    required this.salePrice,
    required this.learnMoreDescUz,
    required this.learnMoreDescEn,
    required this.learnMoreDescRu,
    required this.learnMore,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] ?? 0,
      coursesNameUz: json['courses_name_uz'] ?? '',
      coursesNameEn: json['courses_name_en'] ?? '',
      coursesNameRu: json['courses_name_ru'] ?? '',
      descriptionUz: json['description_uz'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      descriptionRu: json['description_ru'] ?? '',
      shortDescUz: json['short_desc_uz'] ?? '',
      shortDescEn: json['short_desc_en'] ?? '',
      shortDescRu: json['short_desc_ru'] ?? '',
      image: json['image'] ?? '',
      categoryUz: List<String>.from(json['category_uz'] ?? []),
      categoryEn: List<String>.from(json['category_en'] ?? []),
      categoryRu: List<String>.from(json['category_ru'] ?? []),
      authorName: json['author_name'] ?? '',
      addedUser: json['added_user'] ?? 0,
      lessonsNumbers: json['lessons_numbers'] ?? 0,
      duration: json['duration'] ?? 0,
      coursesFree: json['courses_free'] ?? false,
      salePrice: json['sale_price'] ?? 0,
      learnMoreDescUz: json['learn_more_desc_uz'] ?? '',
      learnMoreDescEn: json['learn_more_desc_en'] ?? '',
      learnMoreDescRu: json['learn_more_desc_ru'] ?? '',
      learnMore: LearnMore.fromJson(json['learn_more'] ?? {}),
    );
  }
}

class LearnMore {
  final List<String> en;
  final List<String> ru;
  final List<String> uz;

  LearnMore({
    required this.en,
    required this.ru,
    required this.uz,
  });

  factory LearnMore.fromJson(Map<String, dynamic> json) {
    return LearnMore(
      en: List<String>.from(json['en'] ?? []),
      ru: List<String>.from(json['ru'] ?? []),
      uz: List<String>.from(json['uz'] ?? []),
    );
  }
}

class Teacher {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String gender;
  final String birthDate;
  final String role;
  final String status;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Teacher({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.birthDate,
    required this.role,
    required this.status,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phone_number']?.toString() ?? '',
      gender: json['gender'] ?? '',
      birthDate: json['birth_date'] ?? '',
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      image: json['image'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }
}

class ModuleModel {
  final int id;
  final String titleUz;
  final String titleEn;
  final String titleRu;
  final int courseId;
  final String status;
  final int teacherId;
  final List<VideoModel> videos;

  ModuleModel({
    required this.id,
    required this.titleUz,
    required this.titleEn,
    required this.titleRu,
    required this.courseId,
    required this.status,
    required this.teacherId,
    required this.videos,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      id: json['id'] ?? 0,
      titleUz: json['title_uz'] ?? '',
      titleEn: json['title_en'] ?? '',
      titleRu: json['title_ru'] ?? '',
      courseId: json['course_id'] ?? 0,
      status: json['status'] ?? '',
      teacherId: json['teacher_id'] ?? 0,
      videos: (json['videos'] as List<dynamic>? ?? [])
          .map((e) => VideoModel.fromJson(e))
          .toList(),
    );
  }
}

class VideoModel {
  final int id;
  final String titleUz;
  final String titleEn;
  final String titleRu;
  final String duration; // "00:01:35"
  final double size;
  final bool isOpen;
  final String status;
  final DateTime? createdAt;

  VideoModel({
    required this.id,
    required this.titleUz,
    required this.titleEn,
    required this.titleRu,
    required this.duration,
    required this.size,
    required this.isOpen,
    required this.status,
    required this.createdAt,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] ?? 0,
      titleUz: json['title_uz'] ?? '',
      titleEn: json['title_en'] ?? '',
      titleRu: json['title_ru'] ?? '',
      duration: json['duration'] ?? '',
      size: _toDouble(json['size']),
      isOpen: json['is_open'] ?? false,
      status: json['status'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
    );
  }
}

class CourseComment {
  final int id;
  final String description;
  final int rating;
  final int courseId;
  final int userId;
  final String commentCoursesName;
  final String commentAuthorName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic> commentReply;

  CourseComment({
    required this.id,
    required this.description,
    required this.rating,
    required this.courseId,
    required this.userId,
    required this.commentCoursesName,
    required this.commentAuthorName,
    required this.createdAt,
    required this.updatedAt,
    required this.commentReply,
  });

  factory CourseComment.fromJson(Map<String, dynamic> json) {
    return CourseComment(
      id: json['id'] ?? 0,
      description: json['description'] ?? '',
      rating: json['rating'] ?? 0,
      courseId: json['course_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      commentCoursesName: json['comment_courses_name'] ?? '',
      commentAuthorName: json['comment_author_name'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      commentReply: List<dynamic>.from(json['comment_reply'] ?? []),
    );
  }
}

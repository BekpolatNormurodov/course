class MentorBannerModel {
  final int id;
  final String titleUz;
  final String titleRu;
  final String titleEn;
  final String descriptionUz;
  final String descriptionRu;
  final String descriptionEn;
  final String buttonUz;
  final String buttonRu;
  final String buttonEn;
  final String image;        // masalan: "/Mentor_banners/1762794445806-879014962.svg"
  final String color;        // masalan: "#3572ED"
  final DateTime createdAt;
  final DateTime updatedAt;

  MentorBannerModel({
    required this.id,
    required this.titleUz,
    required this.titleRu,
    required this.titleEn,
    required this.descriptionUz,
    required this.descriptionRu,
    required this.descriptionEn,
    required this.buttonUz,
    required this.buttonRu,
    required this.buttonEn,
    required this.image,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  // JSON dan obyektga aylantirish
  factory MentorBannerModel.fromJson(Map<String, dynamic> json) {
    return MentorBannerModel(
      id: json['id'] as int,
      titleUz: json['title_uz'] as String,
      titleRu: json['title_ru'] as String,
      titleEn: json['title_en'] as String,
      descriptionUz: json['description_uz'] as String,
      descriptionRu: json['description_ru'] as String,
      descriptionEn: json['description_en'] as String,
      buttonUz: json['button_uz'] as String,
      buttonRu: json['button_ru'] as String,
      buttonEn: json['button_en'] as String,
      image: json['image'] as String,
      color: json['color'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  // Agar kerak bo'lsa: obyektni JSON ga qaytarish
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title_uz': titleUz,
      'title_ru': titleRu,
      'title_en': titleEn,
      'description_uz': descriptionUz,
      'description_ru': descriptionRu,
      'description_en': descriptionEn,
      'button_uz': buttonUz,
      'button_ru': buttonRu,
      'button_en': buttonEn,
      'image': image,
      'color': color,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

// API javobi { "data": [ ... ] } shaklida kelgani uchun
class MentorBannerResponse {
  final List<MentorBannerModel> banners;

  MentorBannerResponse({required this.banners});

  factory MentorBannerResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<MentorBannerModel> bannerList =
        list.map((i) => MentorBannerModel.fromJson(i)).toList();

    return MentorBannerResponse(banners: bannerList);
  }
}
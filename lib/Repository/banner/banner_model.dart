class BannerModel {
  final int id;
  final String titleUz;
  final String titleRu;
  final String titleEn;
  final String image;
  final int percent;
  final String percentColor;
  final String color;
  final DateTime createdAt;
  final DateTime updatedAt;

  BannerModel({
    required this.id,
    required this.titleUz,
    required this.titleRu,
    required this.titleEn,
    required this.image,
    required this.percent,
    required this.percentColor,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  // JSON dan obyektga o'tkazish
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as int,
      titleUz: json['title_uz'] as String,
      titleRu: json['title_ru'] as String,
      titleEn: json['title_en'] as String,
      image: json['image'] as String,
      percent: json['percent'] as int,
      percentColor: json['percent_color'] as String,
      color: json['color'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  // Agar kerak bo'lsa: obyektni JSON ga o'tkazish
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title_uz': titleUz,
      'title_ru': titleRu,
      'title_en': titleEn,
      'image': image,
      'percent': percent,
      'percent_color': percentColor,
      'color': color,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

// Agar API dan keladigan response shakli shunday bo'lsa:
// { "data": [ ... ] }
class BannerResponse {
  final List<BannerModel> banners;

  BannerResponse({required this.banners});

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<BannerModel> bannerList = list.map((i) => BannerModel.fromJson(i)).toList();

    return BannerResponse(banners: bannerList);
  }
}
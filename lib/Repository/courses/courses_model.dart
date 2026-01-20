// courses_model.dart
class CoursesModel {
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
  final String lessonsNumbers;
  final String duration;

  final bool coursesFree;
  /// JSON’da string ko‘rinishda keladi: "800000"
  final String salePrice;

  final String learnMoreDescUz;
  final String learnMoreDescEn;
  final String learnMoreDescRu;

  final LearnMore learnMore;

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

  final DateTime createdAt;
  final DateTime updatedAt;

  final num? averageRating;

  const CoursesModel({
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
    this.averageRating,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> j) {
    List<String> _ls(dynamic v) =>
        (v as List?)?.map((e) => e.toString()).toList() ?? const [];

    return CoursesModel(
      id: j['id'] as int,
      coursesNameUz: j['courses_name_uz'] as String? ?? '',
      coursesNameEn: j['courses_name_en'] as String? ?? '',
      coursesNameRu: j['courses_name_ru'] as String? ?? '',

      descriptionUz: j['description_uz'] as String? ?? '',
      descriptionEn: j['description_en'] as String? ?? '',
      descriptionRu: j['description_ru'] as String? ?? '',

      shortDescUz: j['short_desc_uz'] as String? ?? '',
      shortDescEn: j['short_desc_en'] as String? ?? '',
      shortDescRu: j['short_desc_ru'] as String? ?? '',

      image: j['image'] as String? ?? '',

      categoryUz: _ls(j['category_uz']),
      categoryEn: _ls(j['category_en']),
      categoryRu: _ls(j['category_ru']),

      authorName: j['author_name'] as String? ?? '',
      addedUser: (j['added_user'] as num?)?.toInt() ?? 0,
      lessonsNumbers: j['lessons_numbers']?.toString() ?? '',
      duration: j['duration']?.toString() ?? '',

      coursesFree: j['courses_free'] as bool? ?? false,
      salePrice: j['sale_price']?.toString() ?? '0',

      learnMoreDescUz: j['learn_more_desc_uz'] as String? ?? '',
      learnMoreDescEn: j['learn_more_desc_en'] as String? ?? '',
      learnMoreDescRu: j['learn_more_desc_ru'] as String? ?? '',

      learnMore: LearnMore.fromJson(j['learn_more'] as Map<String, dynamic>? ?? const {}),

      directionUz: _ls(j['direction_uz']),
      directionEn: _ls(j['direction_en']),
      directionRu: _ls(j['direction_ru']),

      languagesUz: j['languages_uz'] as String? ?? '',
      languagesEn: j['languages_en'] as String? ?? '',
      languagesRu: j['languages_ru'] as String? ?? '',

      educationLevelUz: j['education_level_uz'] as String? ?? '',
      educationLevelEn: j['education_level_en'] as String? ?? '',
      educationLevelRu: j['education_level_ru'] as String? ?? '',

      isDeleted: j['is_deleted'] as bool? ?? false,
      soldCount: (j['sold_count'] as num?)?.toInt() ?? 0,
      status: j['status'] as String? ?? '',
      teacherId: (j['teacher_id'] as num?)?.toInt() ?? 0,

      createdAt: DateTime.tryParse(j['created_at']?.toString() ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: DateTime.tryParse(j['updated_at']?.toString() ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0),

      averageRating: j['average_rating'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'courses_name_uz': coursesNameUz,
        'courses_name_en': coursesNameEn,
        'courses_name_ru': coursesNameRu,
        'description_uz': descriptionUz,
        'description_en': descriptionEn,
        'description_ru': descriptionRu,
        'short_desc_uz': shortDescUz,
        'short_desc_en': shortDescEn,
        'short_desc_ru': shortDescRu,
        'image': image,
        'category_uz': categoryUz,
        'category_en': categoryEn,
        'category_ru': categoryRu,
        'author_name': authorName,
        'added_user': addedUser,
        'lessons_numbers': lessonsNumbers,
        'duration': duration,
        'courses_free': coursesFree,
        'sale_price': salePrice,
        'learn_more_desc_uz': learnMoreDescUz,
        'learn_more_desc_en': learnMoreDescEn,
        'learn_more_desc_ru': learnMoreDescRu,
        'learn_more': learnMore.toJson(),
        'direction_uz': directionUz,
        'direction_en': directionEn,
        'direction_ru': directionRu,
        'languages_uz': languagesUz,
        'languages_en': languagesEn,
        'languages_ru': languagesRu,
        'education_level_uz': educationLevelUz,
        'education_level_en': educationLevelEn,
        'education_level_ru': educationLevelRu,
        'is_deleted': isDeleted,
        'sold_count': soldCount,
        'status': status,
        'teacher_id': teacherId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'average_rating': averageRating,
      };

  CoursesModel copyWith({
    int? id,
    String? coursesNameUz,
    String? coursesNameEn,
    String? coursesNameRu,
    String? descriptionUz,
    String? descriptionEn,
    String? descriptionRu,
    String? shortDescUz,
    String? shortDescEn,
    String? shortDescRu,
    String? image,
    List<String>? categoryUz,
    List<String>? categoryEn,
    List<String>? categoryRu,
    String? authorName,
    int? addedUser,
    String? lessonsNumbers,
    String? duration,
    bool? coursesFree,
    String? salePrice,
    String? learnMoreDescUz,
    String? learnMoreDescEn,
    String? learnMoreDescRu,
    LearnMore? learnMore,
    List<String>? directionUz,
    List<String>? directionEn,
    List<String>? directionRu,
    String? languagesUz,
    String? languagesEn,
    String? languagesRu,
    String? educationLevelUz,
    String? educationLevelEn,
    String? educationLevelRu,
    bool? isDeleted,
    int? soldCount,
    String? status,
    int? teacherId,
    DateTime? createdAt,
    DateTime? updatedAt,
    num? averageRating,
  }) {
    return CoursesModel(
      id: id ?? this.id,
      coursesNameUz: coursesNameUz ?? this.coursesNameUz,
      coursesNameEn: coursesNameEn ?? this.coursesNameEn,
      coursesNameRu: coursesNameRu ?? this.coursesNameRu,
      descriptionUz: descriptionUz ?? this.descriptionUz,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionRu: descriptionRu ?? this.descriptionRu,
      shortDescUz: shortDescUz ?? this.shortDescUz,
      shortDescEn: shortDescEn ?? this.shortDescEn,
      shortDescRu: shortDescRu ?? this.shortDescRu,
      image: image ?? this.image,
      categoryUz: categoryUz ?? this.categoryUz,
      categoryEn: categoryEn ?? this.categoryEn,
      categoryRu: categoryRu ?? this.categoryRu,
      authorName: authorName ?? this.authorName,
      addedUser: addedUser ?? this.addedUser,
      lessonsNumbers: lessonsNumbers ?? this.lessonsNumbers,
      duration: duration ?? this.duration,
      coursesFree: coursesFree ?? this.coursesFree,
      salePrice: salePrice ?? this.salePrice,
      learnMoreDescUz: learnMoreDescUz ?? this.learnMoreDescUz,
      learnMoreDescEn: learnMoreDescEn ?? this.learnMoreDescEn,
      learnMoreDescRu: learnMoreDescRu ?? this.learnMoreDescRu,
      learnMore: learnMore ?? this.learnMore,
      directionUz: directionUz ?? this.directionUz,
      directionEn: directionEn ?? this.directionEn,
      directionRu: directionRu ?? this.directionRu,
      languagesUz: languagesUz ?? this.languagesUz,
      languagesEn: languagesEn ?? this.languagesEn,
      languagesRu: languagesRu ?? this.languagesRu,
      educationLevelUz: educationLevelUz ?? this.educationLevelUz,
      educationLevelEn: educationLevelEn ?? this.educationLevelEn,
      educationLevelRu: educationLevelRu ?? this.educationLevelRu,
      isDeleted: isDeleted ?? this.isDeleted,
      soldCount: soldCount ?? this.soldCount,
      status: status ?? this.status,
      teacherId: teacherId ?? this.teacherId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      averageRating: averageRating ?? this.averageRating,
    );
  }
}

class LearnMore {
  final List<String> en;
  final List<String> ru;
  final List<String> uz;

  const LearnMore({
    required this.en,
    required this.ru,
    required this.uz,
  });

  factory LearnMore.fromJson(Map<String, dynamic> j) {
    List<String> _ls(dynamic v) =>
        (v as List?)?.map((e) => e.toString()).toList() ?? const [];
    return LearnMore(
      en: _ls(j['en']),
      ru: _ls(j['ru']),
      uz: _ls(j['uz']),
    );
  }

  Map<String, dynamic> toJson() => {
        'en': en,
        'ru': ru,
        'uz': uz,
      };
}

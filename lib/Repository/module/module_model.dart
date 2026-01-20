class ModuleModel {
  final int id;
  final int courseId;
  final String? title;
  final String? description;
  final int? order;
  final int? duration;
  final bool? isLocked;
  final List<dynamic>? videos;
  final DateTime? createdAt;

  ModuleModel({
    required this.id,
    required this.courseId,
    this.title,
    this.description,
    this.order,
    this.duration,
    this.isLocked,
    this.videos,
    this.createdAt,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      id: json['id'] ?? 0,
      courseId: json['courseId'] ?? json['course_id'] ?? 0,
      title: json['title'],
      description: json['description'],
      order: json['order'],
      duration: json['duration'],
      isLocked: json['isLocked'] ?? json['is_locked'] ?? false,
      videos: json['videos'] as List<dynamic>?,
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'title': title,
      'description': description,
      'order': order,
      'duration': duration,
      'isLocked': isLocked,
      'videos': videos,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}

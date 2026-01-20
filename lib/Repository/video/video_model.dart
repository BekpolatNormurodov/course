class VideoModel {
  final int id;
  final int moduleId;
  final String? title;
  final String? description;
  final String? url;
  final String? thumbnail;
  final int? duration;
  final int? order;
  final bool? isWatched;
  final DateTime? createdAt;

  VideoModel({
    required this.id,
    required this.moduleId,
    this.title,
    this.description,
    this.url,
    this.thumbnail,
    this.duration,
    this.order,
    this.isWatched,
    this.createdAt,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] ?? 0,
      moduleId: json['moduleId'] ?? json['module_id'] ?? 0,
      title: json['title'],
      description: json['description'],
      url: json['url'],
      thumbnail: json['thumbnail'],
      duration: json['duration'],
      order: json['order'],
      isWatched: json['isWatched'] ?? json['is_watched'] ?? false,
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'moduleId': moduleId,
      'title': title,
      'description': description,
      'url': url,
      'thumbnail': thumbnail,
      'duration': duration,
      'order': order,
      'isWatched': isWatched,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}

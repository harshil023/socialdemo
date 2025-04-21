class PostModel {
  final String id;
  final String? thumbnailUrl;
  final String? videoUrl;
  final String? description;
  final List<String> images;

  PostModel({
    required this.id,
    this.thumbnailUrl,
    this.videoUrl,
    this.description,
    required this.images,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? '',
      thumbnailUrl: json['thumbnailUrl'],
      videoUrl: json['videoUrl'],
      description: json['description'],
      images: List<String>.from(
        (json['images'] ?? json['image'] ?? []).map((e) => e.toString()),
      ),
    );
  }
}


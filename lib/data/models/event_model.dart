class EventModel {
  final String id;
  final String title;
  final String description;
  final String city;
  final String image;
  final DateTime date;
  final int attendeeCount;
  final bool isFavorite;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.city,
    required this.image,
    required this.date,
    required this.attendeeCount,
    this.isFavorite = false,
  });

  /// FROM JSON
  factory EventModel.fromJson(Map<String, dynamic> json) {
    DateTime parseDate(dynamic date) {
      if (date is int) {
        return DateTime.fromMillisecondsSinceEpoch(date * 1000);
      } else if (date is String) {
        return DateTime.tryParse(date) ?? DateTime.now();
      }
      return DateTime.now();
    }

    return EventModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      city: json['city'] ?? '',
      image: json['image'] ?? '',
      date: parseDate(json['date']),
      attendeeCount: json['attendeeCount'] ?? 0,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  /// COPY WITH
  EventModel copyWith({
    String? id,
    String? title,
    String? description,
    String? city,
    String? image,
    DateTime? date,
    int? attendeeCount,
    bool? isFavorite,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      city: city ?? this.city,
      image: image ?? this.image,
      date: date ?? this.date,
      attendeeCount: attendeeCount ?? this.attendeeCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class EventModel {
  final String id;
  final String title;
  final String description;
  final String city;
  final String image;
  final DateTime date;
  final int attendeeCount;
  bool isFavorite;

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

  // factory EventModel.fromJson(Map<String, dynamic> json) {
  //   return EventModel(
  //     id: json['id'],
  //     title: json['title'],
  //     description: json['description'],
  //     city: json['city'],
  //     image: json['image'],
  //     date: DateTime.parse(json['date']),
  //     attendeeCount: json['attendeeCount'] ?? 0,
  //     isFavorite: json['isFavorite'] ?? false,
  //   );
  // }
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      city: json['city'],
      image: json['image'],
      date: DateTime.fromMillisecondsSinceEpoch((json['date'] as int) * 1000),
      attendeeCount: json['attendeeCount'] ?? 0,
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}

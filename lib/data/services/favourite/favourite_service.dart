import 'package:get_storage/get_storage.dart';
import 'package:my_events/env/keys.dart';

class FavoriteService {
  // Local storage box
  static final _box = GetStorage();
  static const _key = FkKeys.favouritesStorage;

  // Get list of favorite event IDs
  static List<String> get favorites => List<String>.from(_box.read(_key) ?? []);

  // Check if an event is favorite
  static bool isFavorite(String id) {
    return favorites.contains(id);
  }

  // Toggle favorite status for an event
  static void toggleFavorite(String id) {
    final favs = favorites;
    favs.contains(id) ? favs.remove(id) : favs.add(id);
    _box.write(_key, favs);
  }
}

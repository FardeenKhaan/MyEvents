import 'package:get_it/get_it.dart';
import 'package:my_events/data/repositories/auth_repository.dart';
import 'package:my_events/data/repositories/event_repository.dart';
import 'package:my_events/data/services/api/api_service.dart';
import 'package:my_events/data/services/api/event_api_service.dart';

final getIt = GetIt.instance;

class GetItServices {
  static void setupSingletons() {
    // Core services FIRST
    getIt.registerLazySingleton<ApiServices>(() => ApiServices());
    getIt.registerLazySingleton<EventApiServices>(() => EventApiServices());

    // Repositories AFTER services
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
    getIt.registerLazySingleton<EventRepository>(() => EventRepository());
  }
}

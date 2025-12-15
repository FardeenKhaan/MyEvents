class ApiUrls {
  static const baseURL = 'https://blah-blah-juice-backend.vercel.app/api/v1';

  /// ---------------- AUTH ----------------
  static const register = "$baseURL/auth/register";
  static const login = "$baseURL/auth/login";
  static const profile = "$baseURL/auth/profile";

  /// ---------------- CATEGORIES ----------------
  static const categories = "$baseURL/categories";

  /// ---------------- PRODUCTS ----------------
  static const products = "$baseURL/products";
  static String productById(String id) => "$baseURL/products/$id";
  static const String featuredProducts = "$baseURL/products/featured";
  static const String favouriteProducts = "$baseURL/users/favorites/products";

  /// ---------------- ADDRESSES ----------------
  static const addresses = "$baseURL/addresses"; // GET + POST
  static setAddressDefault(String id) => "$baseURL/addresses/$id/default";
  static String updateAddress(String id) => "$baseURL/addresses/$id"; // PUT
  static String deleteAddress(String id) => "$baseURL/addresses/$id"; // DELETE

  /// ---------------- ORDERS ----------------
  static const orders = "$baseURL/orders"; // POST + GET

  static String orderById(String id) => "baseURL/orders/$id"; // GET
  static String trackOrder(String id) => "baseURL/orders/$id/track"; // GET
  static String cancelOrder(String id) => "baseURL/orders/$id/cancel"; // PUT
}

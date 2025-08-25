abstract class EndpointsStrings {
  static const String baseUrl =
      "https://firebrick-chough-287960.hostingersite.com";
  // user endpoints
  static const String login = '/api/user/login';
  static const String home = '/api/user/Home';
  static const String filterInfo = '/api/user/filter-Info';
  static const String register = '/api/user/register';
  static const String resetPassword = '/api/user/reset-password';
  static const String forgetPassword = '/api/user/forgot-password';
  static const String verifyCode = '/api/user/verify-code';
  static const String profile = '/api/user/user/profile/';
  static const String updateProfile = '/api/user/update-profile';
  static const String getProfile = '/api/user/user-profile';
  static const String change_password = '/api/user/user/change-password/';
  static const String carDetail = '/api/user/Model';
  static const String filter = '/api/user/filter-Info';
  static const String favorites = '/api/user/favorites';
  static const String favoritesToggle = '/api/user/favorites/toggle';
  static const String activeLocation = '/api/user/active-locations';
  static const String bookingList = '/api/user/booking-list';

  // Delivery endpoints
  static const String loginDelivery = '/api/driver/login';
  static const String newOrders = '/api/driver/Assigned-Booking';
  static const String acceptedOrders = '/api/driver/Accepted-Booking';
  static const String completedOrders = '/api/driver/Completed-Booking';
  static const String cancelOrder = '/api/driver/cancel-order';

  static const String getBestRoute = '/api/driver/getBestRoute';
  static const String driverProfile = '/api/driver/driver/:id';
}

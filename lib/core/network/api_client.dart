class ApiClient {
  ApiClient._();
  static const String baseUrl =
      "https://round8-cure-php-team-two.huma-volve.com/api/v1/";
  static const String bookAppointment = "appointments/book";
  static const String mybookings = "appointments/my-bookings";
  static const String cancelAppointment = "appointments/4/cancel";
  static const String rescheduleAppointment = "appointments/4/reschedule";
  static const String getFavourite = "favorites";
  static const String postFavourite = "favorites-toggle";
  static const String headersFavourite = "application/json";
  static const String token =
      "186|vQIyHhtNVuB5D0QbFVWMqABzZMCtvoEyMe4leaL9096582e3";
}

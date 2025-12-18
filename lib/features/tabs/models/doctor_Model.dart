class BookingModel {
  final String doctorName;
  final String specialty;
  final String address;
  final DateTime dateTime;
  final BookingStatus status;
  final String image;

  BookingModel({
    required this.doctorName,
    required this.specialty,
    required this.address,
    required this.dateTime,
    required this.status,
    required this.image,
  });
}
List<BookingModel> bookings = [
  BookingModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Psychiatrist',
    address: '129, El-Nasr Street, Cairo, Egypt',
    dateTime: DateTime(2025, 7, 21, 11, 0),
    status: BookingStatus.upcoming,
    image: 'assets/images/doctor.png',
  ),
  BookingModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Psychiatrist',
    address: '129, El-Nasr Street, Cairo, Egypt',
    dateTime: DateTime(2025, 7, 21, 11, 0),
    status: BookingStatus.completed,
    image: 'assets/images/doctor.png',
  ),
  BookingModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Psychiatrist',
    address: '129, El-Nasr Street, Cairo, Egypt',
    dateTime: DateTime(2025, 7, 21, 11, 0),
    status: BookingStatus.canceled,
    image: 'assets/images/doctor.png',
  ),
];
enum BookingStatus {
  upcoming,
  completed,
  canceled,
}

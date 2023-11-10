class User {
  // Model olarak kullanacağım entity...
  final int id;
  final String name;
  final String username;
  final String email;
  final String phoneNumber;
  final String address;
  final String city;
  final String location;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.location,
  });
}

class User {
  final String username;
  final String password;

  // Optionele extra velden
  String? email;
  String? phoneNumber;

  User({
    required this.username,
    required this.password,
    this.email,
    this.phoneNumber,
  });

  // Methode om een User object van een Map te maken (bijvoorbeeld vanuit een database)
  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      username: data['username'],
      password: data['password'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
    );
  }

  // Methode om een User object om te zetten naar een Map
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}

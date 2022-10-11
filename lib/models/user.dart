class User {
  final int id;
  final String username;
  final String image;
  User({required this.username, required this.image, required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      image: json['image'],
    );
  }
}

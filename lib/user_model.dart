class User {
  final String username;
  final String realusername;
  final String email;
  final String mobile;
  final String image;
  final String id;

  User(
      {this.email,
      this.image,
      this.mobile,
      this.realusername,
      this.username,
      this.id});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['name'],
        realusername: json['username'],
        email: json['email'],
        mobile: json['mobile'],
        image: json['image'],
        id: json['id']);
  }
}
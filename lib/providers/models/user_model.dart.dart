class User {
  int id;
  String name;
  String email;
  String token;
  String username; //* ph.no

  User({
    this.id,
    this.name,
    this.email,
    this.token,
    this.username,
  });

  setUserData(data) {
    this.name = data["first_name"];
    this.email = data['email'];
    this.token = data['token'];
    this.username = data['username'];
    this.id = data['user_id'];
  }
}

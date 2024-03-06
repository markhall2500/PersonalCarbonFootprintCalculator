class User {
  int id = 0;
  String username = '';
  String password = '';

  User(this.id, this.username, this.password);

  //Contructor for creating an object with the users
  User.fromMap(Map<String, dynamic> recordMap) {
    id = recordMap['id'] ?? 0;
    username = recordMap['username'] ?? '';
    password = recordMap['password'] ?? '';
  }

  //A method to retrieve the users in a json
  Map<String, dynamic> toJson() {
    return {'id': id, 'username' : username, 'password' : password};
  }
}

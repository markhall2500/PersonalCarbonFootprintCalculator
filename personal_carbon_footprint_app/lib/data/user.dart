//This class stores the model for a user object when a user registers
//on the registration page. This class is used for user authentication

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

class UserModel {
  final String lastLogin;
  final String username;
  final String email;
  final String dateJoined;
  final String address;
  final String name;

  UserModel.fromJson(Map<String, dynamic> json)
      : lastLogin = json['last_login'],
        username = json['username'],
        email = json['email'],
        dateJoined = json['date_joined'],
        address = json['address'],
        name = json['name'];
}

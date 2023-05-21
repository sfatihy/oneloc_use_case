class UserLoginModel {
  String email;
  String password;

  UserLoginModel({
    required this.email,
    required this.password,
  });

  UserLoginModel copyWith({
    String? email,
    String? password,
  }) =>
      UserLoginModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
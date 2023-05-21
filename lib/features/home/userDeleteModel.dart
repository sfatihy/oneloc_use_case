class UserDeleteModel {
  String email;

  UserDeleteModel({
    required this.email,
  });

  UserDeleteModel copyWith({
    String? email,
  }) =>
      UserDeleteModel(
        email: email ?? this.email,
      );

  factory UserDeleteModel.fromJson(Map<String, dynamic> json) => UserDeleteModel(
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
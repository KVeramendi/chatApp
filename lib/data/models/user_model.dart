import 'package:flutter_chat_app/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required String id,
      required String email,
      required String firstName,
      required String lastName,
      required bool online,
      String? password,
      String? imageId,
      String? imageUrl})
      : super(
            id: id,
            email: email,
            firstName: firstName,
            lastName: lastName,
            online: online,
            password: password,
            imageId: imageId,
            imageUrl: imageUrl);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        online: json["online"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "imageUrl": imageUrl
    };
  }

  Map<String, dynamic> toSignUpJson() {
    return {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName
    };
  }
}

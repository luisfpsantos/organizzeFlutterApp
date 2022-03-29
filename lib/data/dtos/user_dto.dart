import 'package:organizze_app/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  UserDto({
    required String name,
    required String user,
    required String password,
    required bool loginWithBiometry,
  }) : super(
          name: name,
          user: user,
          password: password,
          loginWithBiometry: loginWithBiometry,
        );

  static UserDto fromMap(Map<String, dynamic> map) {
    return UserDto(
      name: map['name'],
      user: map['user'],
      password: map['password'],
      loginWithBiometry: map['accessWithBiometry'],
    );
  }
}

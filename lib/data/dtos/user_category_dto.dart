import 'package:organizze_app/domain/entities/user_category_entity.dart';

class UserCategoryDto extends UserCategoryEntity {
  UserCategoryDto({
    required String name,
    required String iconPath,
  }) : super(name: name, iconPath: iconPath);

  static UserCategoryDto fromMap(Map<String, dynamic> map) {
    return UserCategoryDto(
      name: map['name'],
      iconPath: map['iconPath'],
    );
  }
}

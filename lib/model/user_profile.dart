import 'dart:ui';

class UserProfileListModel {
  int? id;
  String? image;
  String? name;
  Color? color;

  UserProfileListModel({this.id, this.image, this.name, this.color});

  UserProfileListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}

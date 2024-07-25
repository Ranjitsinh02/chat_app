import 'dart:convert';
import 'dart:developer';

import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/model/user_data_model.dart';
import 'package:http/http.dart' as http;

import '../utils/api_end_point.dart';

class ApiService {
  Future<UserDataModel?> getUsers() async {
    try {
      var url = Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.userListEndPoint);
      var response = await http.get(url, headers: {
        'Authorization': ApiEndPoint.token,
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        UserDataModel model = UserDataModel.fromJson(data);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ChatModel?> getChatAPI(String userId) async {
    try {
      var url = Uri.parse(
          ApiEndPoint.baseUrl + ApiEndPoint.userChatEndPoint + userId);
      var response = await http.get(url, headers: {
        'Authorization': ApiEndPoint.token,
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        ChatModel model = ChatModel.fromJson(data);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

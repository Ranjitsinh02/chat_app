import 'package:chat_app/api_service/api_service.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxList<ConversationsData> conversionData = <ConversationsData>[].obs;
  RxString errorMessage = ''.obs;

  Future<void> getChat(String userId) async {
    try {
      final data = await ApiService().getChatAPI(userId);
      if (data?.success == 1) {
        conversionData.value = data?.conversationsData ?? [];
      }
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }
}

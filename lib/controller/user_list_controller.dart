import 'package:chat_app/api_service/api_service.dart';
import 'package:chat_app/model/user_data_model.dart';
import 'package:chat_app/model/user_profile.dart';
import 'package:chat_app/utils/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  RxList<UserProfileListModel> userProfileData = <UserProfileListModel>[].obs;
  RxList<SidebarData> sidebarData = <SidebarData>[].obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  void getUserData() {
    userProfileData.add(UserProfileListModel(
        name: 'adin',
        image: ImageAsset.userImage,
        id: 1,
        color: Colors.deepOrange));
    userProfileData.add(UserProfileListModel(
        name: 'Mohin',
        image: ImageAsset.userImage,
        id: 2,
        color: Colors.white));
    userProfileData.add(UserProfileListModel(
        name: 'Sahil', image: ImageAsset.userImage, id: 3, color: Colors.blue));
    userProfileData.add(UserProfileListModel(
        name: 'Ranjit',
        image: ImageAsset.userImage,
        id: 4,
        color: Colors.blueGrey));
    userProfileData.add(UserProfileListModel(
        name: 'Dilip',
        image: ImageAsset.userImage,
        id: 5,
        color: Colors.deepPurple));
    userProfileData.add(UserProfileListModel(
        name: 'Anand',
        image: ImageAsset.userImage,
        id: 6,
        color: Colors.black));
    userProfileData.add(UserProfileListModel(
        name: 'Pravin',
        image: ImageAsset.userImage,
        id: 7,
        color: Colors.brown));
    userProfileData.add(UserProfileListModel(
        name: 'Rakesh',
        image: ImageAsset.userImage,
        id: 8,
        color: Colors.yellow));
  }

  Future<void> getUserListData() async {
    try {
      final data = await ApiService().getUsers();
      if (data?.success == 1) {
        sidebarData.value = data?.sidebarData ?? [];
        update();
        sidebarData.forEach((element) {print(element.name);});
        print(":::${sidebarData}");
      }
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }
}

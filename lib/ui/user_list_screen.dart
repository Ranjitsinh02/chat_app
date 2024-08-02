import 'package:chat_app/controller/user_list_controller.dart';
import 'package:chat_app/ui/chat_screen.dart';
import 'package:chat_app/utils/custom_widget/circular_widget.dart';
import 'package:chat_app/utils/custom_widget/image_asset_widget.dart';
import 'package:chat_app/utils/image_asset.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final controller = Get.put(UserListController());

  @override
  void initState() {
    super.initState();
    controller.getUserListData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          decoration: buildBoxDecoration(),
          child: Column(
              children: [buildUserProfileWidget(), buildListOfUserWidget()]),
        ),
      ),
    );
  }

  LayoutBuilder buildListOfUserWidget() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Column(children: [
                const SizedBox(
                    width: 25,
                    child: Divider(
                      thickness: 2,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return controller.sidebarData.length == 0
                      ? const CircularProgressIndicator()
                      : buildListViewWidget();
                })
              ]),
            ));
      },
    );
  }

  Expanded buildListViewWidget() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.sidebarData.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Get.to(() => ChatScreen(
                      userName: controller.sidebarData[index].name,
                      userId: controller.sidebarData[index].sId,
                    ));
              },
              child: buildUserListTileWidget(context, index));
        },
      ),
    );
  }

  Obx buildUserProfileWidget() {
    return Obx(() {
      return Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.userProfileData.length,
          itemBuilder: (context, index) {
            return buildListTileUserProfileWidget(index);
          },
        ),
      );
    });
  }

  Container buildListTileUserProfileWidget(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 8),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: controller.userProfileData[index].color,
            maxRadius: 31,
            minRadius: 31,
            child: CircleAvatar(
              maxRadius: 30,
              minRadius: 30,
              child: Image.asset(controller.userProfileData[index].image ?? ''),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            controller.userProfileData[index].name ?? '',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Color(0xFF020F34),
            Color(0xFF011854),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.5, 0.0),
          tileMode: TileMode.decal),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      surfaceTintColor: const Color(0xFF021033),
      bottomOpacity: 0.0,
      elevation: 0.0,
      shadowColor: const Color(0xFF021033),
      backgroundColor: const Color(0xFF021033),
      leading: appBarLeadingWidget(),
      title: appBarTitleWidget(),
      centerTitle: true,
      actions: appBarActionWidget(),
    );
  }

  Container appBarLeadingWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: const CircleAvatar(
          backgroundColor: Colors.black54,
          child: ImageAssetWidget(
            image: ImageAsset.search,
            height: 50,
            width: 50,
          )),
    );
  }

  List<Widget> appBarActionWidget() =>
      const [CircularWidget(image: ImageAsset.userImage)];

  Text appBarTitleWidget() {
    return const Text(
      'Home',
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  }

  Widget buildUserListTileWidget(BuildContext context, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    const CircularWidget(image: ImageAsset.userImage),
                    Positioned(
                        bottom: 7,
                        right: 7,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.sidebarData[index].isOnline == 0
                                  ? Colors.grey
                                  : Colors.green),
                        ))
                  ]),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          controller.sidebarData[index].name ?? '',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          controller.sidebarData[index].lastMessage ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black38,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Utils.timeAgoSinceDate(
                        controller.sidebarData[index].lastMessageTime ?? ''),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Visibility(
                    visible:
                        (controller.sidebarData[index].unreadMsgCount ?? 0) > 0,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Center(
                          child: Text(
                        controller.sidebarData[index].unreadMsgCount
                                .toString() ??
                            '',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

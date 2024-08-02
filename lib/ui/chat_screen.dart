import 'package:chat_app/controller/chat_controller.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/utils/api_end_point.dart';
import 'package:chat_app/utils/app_strings.dart';
import 'package:chat_app/utils/custom_widget/custome_text_form_field_widget.dart';
import 'package:chat_app/utils/custom_widget/image_asset_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../utils/image_asset.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, this.userName, this.userImage, this.userId});

  final String? userName;
  final String? userImage;
  final String? userId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = Get.put(ChatController());

  @override
  void initState() {
    super.initState();
    controller.getChat(widget.userId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: appBarLeadingWidget(),
        title: appBarTitleSection(),
        actions: actionsWidget(),
      ),
      body: Obx(() {
        return Stack(
          children: [
            controller.conversionData.length == 0
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Center(
                              child: Chip(
                                  side: BorderSide(color: Colors.transparent),
                                  label: Text("Today"))),
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.conversionData.length,
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 90),
                              itemBuilder: (context, index) {
                                var data = controller.conversionData[index];
                                return listTileWidget(index, data);
                              },
                            ),
                          ),
                        ]),
                  ),
            bottomChatWidget(context),
          ],
        );
      }),
    );
  }

  Align bottomChatWidget(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ImageAssetWidget(
                image: ImageAsset.clip,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: CustomTextFormFieldWidget(
                      labelText: AppStrings.writeAMessage)),
              InkWell(
                onTap: () {},
                child: const ImageAssetWidget(
                  image: ImageAsset.camera,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ImageAssetWidget(
                  image: ImageAsset.microphone,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column listTileWidget(int index, ConversationsData data) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: boolUserIdEqualSenderId(index)
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            Visibility(
              visible: boolUserIdEqualSenderId(index),
              child: Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: CircleAvatar(
                  minRadius: 25,
                  maxRadius: 25,
                  child: Image.asset(widget.userImage ?? ImageAsset.userImage),
                ),
              ),
            ),
            Visibility(
              visible: boolUserIdEqualSenderId(index),
              child: const SizedBox(
                width: 10,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: boolUserIdEqualSenderId(index),
                  child: Text(
                    widget.userName ?? '',
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      buildMessageSection(index, data),
                      buildTextTime(index)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> actionsWidget() {
    return const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: ImageAssetWidget(
          image: ImageAsset.call,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: ImageAssetWidget(
          image: ImageAsset.video,
        ),
      ),
    ];
  }

  Container appBarLeadingWidget() {
    return Container(
        margin: const EdgeInsets.only(left: 15, top: 5),
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            InkWell(
                onTap: () => Get.back(), child: const Icon(Icons.arrow_back)),
          ],
        ));
  }

  Column appBarTitleSection() {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: CircleAvatar(
                    minRadius: 25,
                    maxRadius: 25,
                    child:
                        Image.asset(widget.userImage ?? ImageAsset.userImage),
                  ),
                ),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                    ))
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userName ?? '',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                const Text(
                  'Active now',
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Align buildMessageSection(int index, ConversationsData data) {
    return Align(
      alignment: (boolUserIdEqualSenderId(index)
          ? Alignment.topLeft
          : Alignment.topRight),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: boolUserIdEqualSenderId(index)
                ? const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))
                : const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
            color: (boolUserIdEqualSenderId(index)
                ? Colors.grey.shade200
                : const Color(0xff031548)),
          ),
          padding: const EdgeInsets.all(16),
          child: getMediaTypeOfData(data.mediaType, data.message ?? '', index)),
    );
  }

  Text buildTextTime(int index) {
    return Text(
      getTime(controller.conversionData[index].createdAt),
      style: TextStyle(
          color: const Color(0xFF797C7B).withOpacity(0.5),
          fontWeight: FontWeight.bold),
    );
  }

  bool boolUserIdEqualSenderId(int index) {
    return widget.userId == controller.conversionData[index].senderId;
  }

  String getTime(String? createdAt) {
    DateTime dateTime = DateTime.parse(createdAt ?? "");
    DateFormat timeFormat = DateFormat('h:mm a');
    return timeFormat.format(dateTime);
  }

  Widget getMediaTypeOfData(int? mediaType, String message, int index) {
    switch (mediaType) {
      case 0:
        return Text(
          message,
          style: TextStyle(
              color: (boolUserIdEqualSenderId(index)
                  ? Colors.black
                  : Colors.white)),
        );
      case 1:
        return Image.network(
          ApiEndPoint.baseUrl + message,
          errorBuilder: (context, error, stackTrace) => ImageAssetWidget(
            image: ImageAsset.message,
            color:
                (boolUserIdEqualSenderId(index) ? Colors.black : Colors.white),
          ),
        );
      case 2:
        return const Icon(Icons.videocam);
      case 3:
        return const Icon(Icons.audiotrack);
      case 4:
        return const Icon(Icons.document_scanner);
      case 5:
        return const Icon(Icons.contact_phone);
      case 6:
        return const Icon(Icons.location_on);
      case 7:
        return const Icon(Icons.info);
      default:
        return const Text('Unknown type');
    }
  }
}

import 'package:chat_app/controller/chat_controller.dart';
import 'package:chat_app/utils/api_end_point.dart';
import 'package:chat_app/utils/custom_widget/custome_text_form_field_widget.dart';
import 'package:chat_app/utils/custom_widget/image_asset_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        leading: Container(
            margin: const EdgeInsets.only(left: 15, top: 5),
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back)),
              ],
            )),
        title: Column(
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
                        child: Image.asset(
                            widget.userImage ?? ImageAsset.userImage),
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
                      style:
                          TextStyle(fontSize: 12, color: Colors.black38),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: const [
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
        ],
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Center(
                      child: Chip(
                          side: BorderSide(color: Colors.transparent),
                          label: Text("Today"))),
                  Obx(() {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.conversionData.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                              alignment:
                                  (widget.userId ==
                                          controller.conversionData[index].senderId
                                      ? Alignment.topLeft
                                      : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: widget.userId ==
                                      controller.conversionData[index].senderId
                                      ? const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))
                                      : const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                  color: (widget.userId ==
                                      controller.conversionData[index].senderId
                                      ? Colors.grey.shade200
                                      : const Color(0xff031548)),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: /*controller.conversionData[index].mediaType == 0 ? */Text(
                                  controller.conversionData[index].message ?? '',
                                  style: TextStyle(fontSize: 15, color: widget.userId ==
                                      controller.conversionData[index].senderId
                                      ? Colors.black
                                      : Colors.white),
                                ) /*: Image.network(ApiEndPoint.baseUrl+(controller.conversionData[index].message ??'') )*/,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ]),
          ),
          Align(
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
                    Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CustomTextFormFieldWidget(
                            labelText: 'Write your message')),
                    ImageAssetWidget(
                      image: ImageAsset.camera,
                    ),
                    ImageAssetWidget(
                      image: ImageAsset.microphone,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

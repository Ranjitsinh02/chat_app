import 'package:chat_app/ui/user_list_screen.dart';
import 'package:chat_app/utils/app_strings.dart';
import 'package:chat_app/utils/custom_widget/image_asset_widget.dart';
import 'package:chat_app/utils/image_asset.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int pageIndex = 0;

  final pages = [
    const UserListScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff031548),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const ImageAssetWidget(
                        image: ImageAsset.message,
                        height: 35,
                        width: 35,
                      )
                    : const ImageAssetWidget(
                        image: ImageAsset.message,
                        height: 35,
                        width: 35,
                        color: Colors.black38,
                      ),
              ),
              Text(
                AppStrings.message,
                style: TextStyle(
                    color: pageIndex == 0
                        ? const Color(0xff031548)
                        : Colors.black38,
                    fontWeight:
                        pageIndex == 0 ? FontWeight.w800 : FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const ImageAssetWidget(
                        image: ImageAsset.navigationCall,
                        height: 35,
                        width: 35,
                        color: Color(0xff031548),
                      )
                    : const ImageAssetWidget(
                        image: ImageAsset.navigationCall,
                        height: 35,
                        width: 35,
                      ),
              ),
              Text(
                AppStrings.calls,
                style: TextStyle(
                    color: pageIndex == 1 ? Color(0xff031548) : Colors.black38,
                    fontWeight:
                        pageIndex == 0 ? FontWeight.w800 : FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const ImageAssetWidget(
                        image: ImageAsset.userN,
                        height: 35,
                        width: 35,
                        color: Color(0xff031548),
                      )
                    : const ImageAssetWidget(
                        image: ImageAsset.userN,
                        height: 35,
                        width: 35,
                      ),
              ),
              Text(
                AppStrings.contacts,
                style: TextStyle(
                    color: pageIndex == 2
                        ? const Color(0xff031548)
                        : Colors.black38,
                    fontWeight:
                        pageIndex == 0 ? FontWeight.w800 : FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const ImageAssetWidget(
                        image: ImageAsset.settings,
                        height: 35,
                        width: 35,
                        color: Color(0xff031548),
                      )
                    : const ImageAssetWidget(
                        image: ImageAsset.settings,
                        height: 35,
                        width: 35,
                      ),
              ),
              Text(
                AppStrings.settings,
                style: TextStyle(
                    color: pageIndex == 3
                        ? const Color(0xff031548)
                        : Colors.black38,
                    fontWeight:
                        pageIndex == 0 ? FontWeight.w800 : FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    );
  }
}

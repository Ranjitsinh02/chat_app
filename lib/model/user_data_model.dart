class UserDataModel {
  int? success;
  String? message;
  List<SidebarData>? sidebarData;

  UserDataModel({this.success, this.message, this.sidebarData});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['sidebarData'] != null) {
      sidebarData = <SidebarData>[];
      json['sidebarData'].forEach((v) {
        sidebarData!.add(SidebarData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.sidebarData != null) {
      data['sidebarData'] = this.sidebarData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SidebarData {
  String? sId;
  String? name;
  String? cid;
  String? userExtension;
  String? image;
  int? isOnline;
  String? lastSeen;
  int? blockBy;
  String? description;
  int? isGroup;
  int? isReported;
  int? istyping;
  int? unreadMsgCount;
  String? lastMessage;
  int? lastMediaType;
  int? isblockedByReciver;
  int? isBlocked;
  String? lastMessageTime;
  Null? pintime;
  int? ispinned;

  SidebarData(
      {this.sId,
        this.name,
        this.cid,
        this.userExtension,
        this.image,
        this.isOnline,
        this.lastSeen,
        this.blockBy,
        this.description,
        this.isGroup,
        this.isReported,
        this.istyping,
        this.unreadMsgCount,
        this.lastMessage,
        this.lastMediaType,
        this.isblockedByReciver,
        this.isBlocked,
        this.lastMessageTime,
        this.pintime,
        this.ispinned});

  SidebarData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    cid = json['cid'];
    userExtension = json['user_extension'];
    image = json['image'];
    isOnline = json['is_online'];
    lastSeen = json['last_seen'];
    blockBy = json['block_by'];
    description = json['description'];
    isGroup = json['isGroup'];
    isReported = json['isReported'];
    istyping = json['istyping'];
    unreadMsgCount = json['unread_msg_count'];
    lastMessage = json['last_message'];
    lastMediaType = json['last_media_type'];
    isblockedByReciver = json['isblocked_by_reciver'];
    isBlocked = json['isBlocked'];
    lastMessageTime = json['last_message_time'];
    pintime = json['pintime'];
    ispinned = json['ispinned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['cid'] = this.cid;
    data['user_extension'] = this.userExtension;
    data['image'] = this.image;
    data['is_online'] = this.isOnline;
    data['last_seen'] = this.lastSeen;
    data['block_by'] = this.blockBy;
    data['description'] = this.description;
    data['isGroup'] = this.isGroup;
    data['isReported'] = this.isReported;
    data['istyping'] = this.istyping;
    data['unread_msg_count'] = this.unreadMsgCount;
    data['last_message'] = this.lastMessage;
    data['last_media_type'] = this.lastMediaType;
    data['isblocked_by_reciver'] = this.isblockedByReciver;
    data['isBlocked'] = this.isBlocked;
    data['last_message_time'] = this.lastMessageTime;
    data['pintime'] = this.pintime;
    data['ispinned'] = this.ispinned;
    return data;
  }
}

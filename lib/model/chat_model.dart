class ChatModel {
  int? success;
  String? message;
  List<ConversationsData>? conversationsData;
  int? totalMessgesCount;
  String? userCustomeMessage;
  List<String>? pinnedMessage;

  ChatModel(
      {this.success,
        this.message,
        this.conversationsData,
        this.totalMessgesCount,
        this.userCustomeMessage,
        this.pinnedMessage});

  ChatModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['conversationsData'] != null) {
      conversationsData = <ConversationsData>[];
      json['conversationsData'].forEach((v) {
        conversationsData!.add(ConversationsData.fromJson(v));
      });
    }
    totalMessgesCount = json['totalMessgesCount'];
    userCustomeMessage = json['user_custome_message'];
    pinnedMessage = json['pinned_message'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (conversationsData != null) {
      data['conversationsData'] =
          conversationsData!.map((v) => v.toJson()).toList();
    }
    data['totalMessgesCount'] = totalMessgesCount;
    data['user_custome_message'] = userCustomeMessage;
    data['pinned_message'] = pinnedMessage;
    return data;
  }
}

class ConversationsData {
  String? sId;
  String? cid;
  String? senderId;
  String? receiverId;
  String? broadcastId;
  String? broadcastMsgId;
  String? originalName;
  String? message;
  String? messageCaption;
  int? messageType;
  int? mediaType;
  int? deliveryType;
  String? replyMessageId;
  String? scheduleTime;
  List<String>? blockMessageUsers;
  List<String>? deleteMessageUsers;
  int? isDeleted;
  String? messageDissapearTime;
  List<String>? messageReactionUsers;
  int? isEdited;
  int? iV;
  String? createdAt;
  String? updatedAt;
  int? ispinned;
  String? pinBy;

  ConversationsData(
      {this.sId,
        this.cid,
        this.senderId,
        this.receiverId,
        this.broadcastId,
        this.broadcastMsgId,
        this.originalName,
        this.message,
        this.messageCaption,
        this.messageType,
        this.mediaType,
        this.deliveryType,
        this.replyMessageId,
        this.scheduleTime,
        this.blockMessageUsers,
        this.deleteMessageUsers,
        this.isDeleted,
        this.messageDissapearTime,
        this.messageReactionUsers,
        this.isEdited,
        this.iV,
        this.createdAt,
        this.updatedAt,
        this.ispinned,
        this.pinBy});

  ConversationsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cid = json['cid'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    broadcastId = json['broadcast_id'];
    broadcastMsgId = json['broadcast_msg_id'];
    originalName = json['originalName'];
    message = json['message'];
    messageCaption = json['message_caption'];
    messageType = json['message_type'];
    mediaType = json['media_type'];
    deliveryType = json['delivery_type'];
    replyMessageId = json['reply_message_id'];
    scheduleTime = json['schedule_time'];
    blockMessageUsers = json['block_message_users'].cast<String>();
    deleteMessageUsers = json['delete_message_users'].cast<String>();
    isDeleted = json['is_deleted'];
    messageDissapearTime = json['message_dissapear_time'];
    messageReactionUsers = json['message_reaction_users'].cast<String>();
    isEdited = json['is_edited'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    ispinned = json['ispinned'];
    pinBy = json['pin_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['cid'] = cid;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['broadcast_id'] = broadcastId;
    data['broadcast_msg_id'] = broadcastMsgId;
    data['originalName'] = originalName;
    data['message'] = message;
    data['message_caption'] = messageCaption;
    data['message_type'] = messageType;
    data['media_type'] = mediaType;
    data['delivery_type'] = deliveryType;
    data['reply_message_id'] = replyMessageId;
    data['schedule_time'] = scheduleTime;
    data['block_message_users'] = blockMessageUsers;
    data['delete_message_users'] = deleteMessageUsers;
    data['is_deleted'] = isDeleted;
    data['message_dissapear_time'] = messageDissapearTime;
    data['message_reaction_users'] = messageReactionUsers;
    data['is_edited'] = isEdited;
    data['__v'] = iV;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['ispinned'] = ispinned;
    data['pin_by'] = pinBy;
    return data;
  }
}

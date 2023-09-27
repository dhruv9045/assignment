class UsersModel {
  final int? status;
  final String? message;
  final List<dynamic>? data;
  final List<ExtraData>? extraData;

  UsersModel({
    this.status,
    this.message,
    this.data,
    this.extraData,
  });

  UsersModel copyWith({
    int? status,
    String? message,
    List<dynamic>? data,
    List<ExtraData>? extraData,
  }) {
    return UsersModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      extraData: extraData ?? this.extraData,
    );
  }

  UsersModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = json['data'] as List?,
        extraData = (json['extraData'] as List?)?.map((dynamic e) => ExtraData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data,
    'extraData' : extraData?.map((e) => e.toJson()).toList()
  };
}

class ExtraData {
  final int? id;
  final int? clubId;
  final int? userId;
  final int? roleId;
  final int? joinDate;
  final dynamic parentMemberId;
  final dynamic emergencyContactName;
  final dynamic emergencyDialingCode;
  final dynamic emergencyContactMobile;
  final dynamic emergencyRelationship;
  final dynamic allergies;
  final dynamic injuries;
  final dynamic medInfo;
  final bool? isOutcoachUser;
  final String? inviteAccepted;
  final bool? adminAccess;
  final int? lastLoggedInTime;
  final bool? isActive;
  final bool? visibleStatus;
  final String? phoneVisiblityStatus;
  final String? emailVisiblityStatus;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final User? user;

  ExtraData({
    this.id,
    this.clubId,
    this.userId,
    this.roleId,
    this.joinDate,
    this.parentMemberId,
    this.emergencyContactName,
    this.emergencyDialingCode,
    this.emergencyContactMobile,
    this.emergencyRelationship,
    this.allergies,
    this.injuries,
    this.medInfo,
    this.isOutcoachUser,
    this.inviteAccepted,
    this.adminAccess,
    this.lastLoggedInTime,
    this.isActive,
    this.visibleStatus,
    this.phoneVisiblityStatus,
    this.emailVisiblityStatus,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
  });

  ExtraData copyWith({
    int? id,
    int? clubId,
    int? userId,
    int? roleId,
    int? joinDate,
    dynamic parentMemberId,
    dynamic emergencyContactName,
    dynamic emergencyDialingCode,
    dynamic emergencyContactMobile,
    dynamic emergencyRelationship,
    dynamic allergies,
    dynamic injuries,
    dynamic medInfo,
    bool? isOutcoachUser,
    String? inviteAccepted,
    bool? adminAccess,
    int? lastLoggedInTime,
    bool? isActive,
    bool? visibleStatus,
    String? phoneVisiblityStatus,
    String? emailVisiblityStatus,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    User? user,
  }) {
    return ExtraData(
      id: id ?? this.id,
      clubId: clubId ?? this.clubId,
      userId: userId ?? this.userId,
      roleId: roleId ?? this.roleId,
      joinDate: joinDate ?? this.joinDate,
      parentMemberId: parentMemberId ?? this.parentMemberId,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyDialingCode: emergencyDialingCode ?? this.emergencyDialingCode,
      emergencyContactMobile: emergencyContactMobile ?? this.emergencyContactMobile,
      emergencyRelationship: emergencyRelationship ?? this.emergencyRelationship,
      allergies: allergies ?? this.allergies,
      injuries: injuries ?? this.injuries,
      medInfo: medInfo ?? this.medInfo,
      isOutcoachUser: isOutcoachUser ?? this.isOutcoachUser,
      inviteAccepted: inviteAccepted ?? this.inviteAccepted,
      adminAccess: adminAccess ?? this.adminAccess,
      lastLoggedInTime: lastLoggedInTime ?? this.lastLoggedInTime,
      isActive: isActive ?? this.isActive,
      visibleStatus: visibleStatus ?? this.visibleStatus,
      phoneVisiblityStatus: phoneVisiblityStatus ?? this.phoneVisiblityStatus,
      emailVisiblityStatus: emailVisiblityStatus ?? this.emailVisiblityStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      user: user ?? this.user,
    );
  }

  ExtraData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        clubId = json['clubId'] as int?,
        userId = json['userId'] as int?,
        roleId = json['roleId'] as int?,
        joinDate = json['joinDate'] as int?,
        parentMemberId = json['parentMemberId'],
        emergencyContactName = json['emergencyContactName'],
        emergencyDialingCode = json['emergencyDialingCode'],
        emergencyContactMobile = json['emergencyContactMobile'],
        emergencyRelationship = json['emergencyRelationship'],
        allergies = json['allergies'],
        injuries = json['injuries'],
        medInfo = json['medInfo'],
        isOutcoachUser = json['isOutcoachUser'] as bool?,
        inviteAccepted = json['inviteAccepted'] as String?,
        adminAccess = json['adminAccess'] as bool?,
        lastLoggedInTime = json['lastLoggedInTime'] as int?,
        isActive = json['isActive'] as bool?,
        visibleStatus = json['visibleStatus'] as bool?,
        phoneVisiblityStatus = json['phoneVisiblityStatus'] as String?,
        emailVisiblityStatus = json['emailVisiblityStatus'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        deletedAt = json['deletedAt'],
        user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'clubId' : clubId,
    'userId' : userId,
    'roleId' : roleId,
    'joinDate' : joinDate,
    'parentMemberId' : parentMemberId,
    'emergencyContactName' : emergencyContactName,
    'emergencyDialingCode' : emergencyDialingCode,
    'emergencyContactMobile' : emergencyContactMobile,
    'emergencyRelationship' : emergencyRelationship,
    'allergies' : allergies,
    'injuries' : injuries,
    'medInfo' : medInfo,
    'isOutcoachUser' : isOutcoachUser,
    'inviteAccepted' : inviteAccepted,
    'adminAccess' : adminAccess,
    'lastLoggedInTime' : lastLoggedInTime,
    'isActive' : isActive,
    'visibleStatus' : visibleStatus,
    'phoneVisiblityStatus' : phoneVisiblityStatus,
    'emailVisiblityStatus' : emailVisiblityStatus,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    'deletedAt' : deletedAt,
    'user' : user?.toJson()
  };
}

class User {
  final int? id;
  final dynamic profilePicture;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final dynamic emailOtp;
  final bool? isEmailVerified;
  final String? dialingCode;
  final String? userMobile;
  final dynamic dob;
  final dynamic googleId;
  final dynamic appleId;
  final String? loginType;
  final bool? unsubscribeStatus;
  final bool? accountStatus;
  final bool? createdByOutcoach;
  final dynamic deviceToken;
  final dynamic deviceType;
  final dynamic stripeAccountId;
  final bool? stripeAccountSetupStatus;
  final dynamic stripeCustomerId;
  final String? subscriptionType;
  final int? subscriptionMemberLimit;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.id,
    this.profilePicture,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.emailOtp,
    this.isEmailVerified,
    this.dialingCode,
    this.userMobile,
    this.dob,
    this.googleId,
    this.appleId,
    this.loginType,
    this.unsubscribeStatus,
    this.accountStatus,
    this.createdByOutcoach,
    this.deviceToken,
    this.deviceType,
    this.stripeAccountId,
    this.stripeAccountSetupStatus,
    this.stripeCustomerId,
    this.subscriptionType,
    this.subscriptionMemberLimit,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    int? id,
    dynamic profilePicture,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    dynamic emailOtp,
    bool? isEmailVerified,
    String? dialingCode,
    String? userMobile,
    dynamic dob,
    dynamic googleId,
    dynamic appleId,
    String? loginType,
    bool? unsubscribeStatus,
    bool? accountStatus,
    bool? createdByOutcoach,
    dynamic deviceToken,
    dynamic deviceType,
    dynamic stripeAccountId,
    bool? stripeAccountSetupStatus,
    dynamic stripeCustomerId,
    String? subscriptionType,
    int? subscriptionMemberLimit,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      profilePicture: profilePicture ?? this.profilePicture,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      emailOtp: emailOtp ?? this.emailOtp,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      dialingCode: dialingCode ?? this.dialingCode,
      userMobile: userMobile ?? this.userMobile,
      dob: dob ?? this.dob,
      googleId: googleId ?? this.googleId,
      appleId: appleId ?? this.appleId,
      loginType: loginType ?? this.loginType,
      unsubscribeStatus: unsubscribeStatus ?? this.unsubscribeStatus,
      accountStatus: accountStatus ?? this.accountStatus,
      createdByOutcoach: createdByOutcoach ?? this.createdByOutcoach,
      deviceToken: deviceToken ?? this.deviceToken,
      deviceType: deviceType ?? this.deviceType,
      stripeAccountId: stripeAccountId ?? this.stripeAccountId,
      stripeAccountSetupStatus: stripeAccountSetupStatus ?? this.stripeAccountSetupStatus,
      stripeCustomerId: stripeCustomerId ?? this.stripeCustomerId,
      subscriptionType: subscriptionType ?? this.subscriptionType,
      subscriptionMemberLimit: subscriptionMemberLimit ?? this.subscriptionMemberLimit,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        profilePicture = json['profilePicture'],
        firstName = json['firstName'] as String?,
        lastName = json['lastName'] as String?,
        email = json['email'] as String?,
        password = json['password'] as String?,
        emailOtp = json['emailOtp'],
        isEmailVerified = json['isEmailVerified'] as bool?,
        dialingCode = json['dialingCode'] as String?,
        userMobile = json['userMobile'] as String?,
        dob = json['dob'],
        googleId = json['googleId'],
        appleId = json['appleId'],
        loginType = json['loginType'] as String?,
        unsubscribeStatus = json['unsubscribeStatus'] as bool?,
        accountStatus = json['accountStatus'] as bool?,
        createdByOutcoach = json['createdByOutcoach'] as bool?,
        deviceToken = json['deviceToken'],
        deviceType = json['deviceType'],
        stripeAccountId = json['stripeAccountId'],
        stripeAccountSetupStatus = json['stripeAccountSetupStatus'] as bool?,
        stripeCustomerId = json['stripeCustomerId'],
        subscriptionType = json['subscriptionType'] as String?,
        subscriptionMemberLimit = json['subscriptionMemberLimit'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'profilePicture' : profilePicture,
    'firstName' : firstName,
    'lastName' : lastName,
    'email' : email,
    'password' : password,
    'emailOtp' : emailOtp,
    'isEmailVerified' : isEmailVerified,
    'dialingCode' : dialingCode,
    'userMobile' : userMobile,
    'dob' : dob,
    'googleId' : googleId,
    'appleId' : appleId,
    'loginType' : loginType,
    'unsubscribeStatus' : unsubscribeStatus,
    'accountStatus' : accountStatus,
    'createdByOutcoach' : createdByOutcoach,
    'deviceToken' : deviceToken,
    'deviceType' : deviceType,
    'stripeAccountId' : stripeAccountId,
    'stripeAccountSetupStatus' : stripeAccountSetupStatus,
    'stripeCustomerId' : stripeCustomerId,
    'subscriptionType' : subscriptionType,
    'subscriptionMemberLimit' : subscriptionMemberLimit,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt
  };
}
// To parse this JSON data, do
//
//     final topicsModel = topicsModelFromMap(jsonString);

import 'dart:convert';

List<TopicsModel> topicsModelFromMap(String str) => List<TopicsModel>.from(json.decode(str).map((x) => TopicsModel.fromMap(x)));

String topicsModelToMap(List<TopicsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TopicsModel {
  String? id;
  String? slug;
  String? title;
  String? description;
  DateTime? publishedAt;
  DateTime? updatedAt;
  DateTime? startsAt;
  DateTime? endsAt;
  dynamic onlySubmissionsAfter;
  Visibility? visibility;
  bool? featured;
  int? totalPhotos;
  List<dynamic>? currentUserContributions;
  dynamic totalCurrentUserSubmissions;
  TopicsModelLinks? links;
  TopicsModelStatus? status;
  List<Owner>? owners;
  List<PreviewPhoto>? previewPhotos;

  TopicsModel({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.publishedAt,
    this.updatedAt,
    this.startsAt,
    this.endsAt,
    this.onlySubmissionsAfter,
    this.visibility,
    this.featured,
    this.totalPhotos,
    this.currentUserContributions,
    this.totalCurrentUserSubmissions,
    this.links,
    this.status,
    this.owners,
    this.previewPhotos,
  });

  TopicsModel copyWith({
    String? id,
    String? slug,
    String? title,
    String? description,
    DateTime? publishedAt,
    DateTime? updatedAt,
    DateTime? startsAt,
    DateTime? endsAt,
    dynamic onlySubmissionsAfter,
    Visibility? visibility,
    bool? featured,
    int? totalPhotos,
    List<dynamic>? currentUserContributions,
    dynamic totalCurrentUserSubmissions,
    TopicsModelLinks? links,
    TopicsModelStatus? status,
    List<Owner>? owners,
    List<PreviewPhoto>? previewPhotos,
  }) =>
      TopicsModel(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        title: title ?? this.title,
        description: description ?? this.description,
        publishedAt: publishedAt ?? this.publishedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        startsAt: startsAt ?? this.startsAt,
        endsAt: endsAt ?? this.endsAt,
        onlySubmissionsAfter: onlySubmissionsAfter ?? this.onlySubmissionsAfter,
        visibility: visibility ?? this.visibility,
        featured: featured ?? this.featured,
        totalPhotos: totalPhotos ?? this.totalPhotos,
        currentUserContributions: currentUserContributions ?? this.currentUserContributions,
        totalCurrentUserSubmissions: totalCurrentUserSubmissions ?? this.totalCurrentUserSubmissions,
        links: links ?? this.links,
        status: status ?? this.status,
        owners: owners ?? this.owners,
        previewPhotos: previewPhotos ?? this.previewPhotos,
      );

  factory TopicsModel.fromMap(Map<String, dynamic> json) => TopicsModel(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    startsAt: json["starts_at"] == null ? null : DateTime.parse(json["starts_at"]),
    endsAt: json["ends_at"] == null ? null : DateTime.parse(json["ends_at"]),
    onlySubmissionsAfter: json["only_submissions_after"],
    visibility: visibilityValues.map[json["visibility"]]!,
    featured: json["featured"],
    totalPhotos: json["total_photos"],
    currentUserContributions: json["current_user_contributions"] == null ? [] : List<dynamic>.from(json["current_user_contributions"]!.map((x) => x)),
    totalCurrentUserSubmissions: json["total_current_user_submissions"],
    links: json["links"] == null ? null : TopicsModelLinks.fromMap(json["links"]),
    status: topicsModelStatusValues.map[json["status"]??''],
    owners: json["owners"] == null ? [] : List<Owner>.from(json["owners"]!.map((x) => Owner.fromMap(x))),
    previewPhotos: json["preview_photos"] == null ? [] : List<PreviewPhoto>.from(json["preview_photos"]!.map((x) => PreviewPhoto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "slug": slug,
    "title": title,
    "description": description,
    "published_at": publishedAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "starts_at": startsAt?.toIso8601String(),
    "ends_at": endsAt?.toIso8601String(),
    "only_submissions_after": onlySubmissionsAfter,
    "visibility": visibilityValues.reverse[visibility],
    "featured": featured,
    "total_photos": totalPhotos,
    "current_user_contributions": currentUserContributions == null ? [] : List<dynamic>.from(currentUserContributions!.map((x) => x)),
    "total_current_user_submissions": totalCurrentUserSubmissions,
    "links": links?.toMap(),
    "status": topicsModelStatusValues.reverse[status],
    "owners": owners == null ? [] : List<dynamic>.from(owners!.map((x) => x.toMap())),
    "preview_photos": previewPhotos == null ? [] : List<dynamic>.from(previewPhotos!.map((x) => x.toMap())),
  };
}

class CoverPhoto {
  String? id;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  List<Breadcrumb>? breadcrumbs;
  Urls? urls;
  CoverPhotoLinks? links;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  dynamic sponsorship;
  Map<String, TopicSubmission>? topicSubmissions;
  Owner? user;

  CoverPhoto({
    this.id,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.breadcrumbs,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
  });

  CoverPhoto copyWith({
    String? id,
    String? slug,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? promotedAt,
    int? width,
    int? height,
    String? color,
    String? blurHash,
    String? description,
    String? altDescription,
    List<Breadcrumb>? breadcrumbs,
    Urls? urls,
    CoverPhotoLinks? links,
    int? likes,
    bool? likedByUser,
    List<dynamic>? currentUserCollections,
    dynamic sponsorship,
    Map<String, TopicSubmission>? topicSubmissions,
    Owner? user,
  }) =>
      CoverPhoto(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        promotedAt: promotedAt ?? this.promotedAt,
        width: width ?? this.width,
        height: height ?? this.height,
        color: color ?? this.color,
        blurHash: blurHash ?? this.blurHash,
        description: description ?? this.description,
        altDescription: altDescription ?? this.altDescription,
        breadcrumbs: breadcrumbs ?? this.breadcrumbs,
        urls: urls ?? this.urls,
        links: links ?? this.links,
        likes: likes ?? this.likes,
        likedByUser: likedByUser ?? this.likedByUser,
        currentUserCollections: currentUserCollections ?? this.currentUserCollections,
        sponsorship: sponsorship ?? this.sponsorship,
        topicSubmissions: topicSubmissions ?? this.topicSubmissions,
        user: user ?? this.user,
      );

  factory CoverPhoto.fromMap(Map<String, dynamic> json) => CoverPhoto(
    id: json["id"],
    slug: json["slug"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    breadcrumbs: json["breadcrumbs"] == null ? [] : List<Breadcrumb>.from(json["breadcrumbs"]!.map((x) => Breadcrumb.fromMap(x))),
    urls: json["urls"] == null ? null : Urls.fromMap(json["urls"]),
    links: json["links"] == null ? null : CoverPhotoLinks.fromMap(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: Map.from(json["topic_submissions"]!).map((k, v) => MapEntry<String, TopicSubmission>(k, TopicSubmission.fromMap(v))),
    user: json["user"] == null ? null : Owner.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "slug": slug,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "breadcrumbs": breadcrumbs == null ? [] : List<dynamic>.from(breadcrumbs!.map((x) => x.toMap())),
    "urls": urls?.toMap(),
    "links": links?.toMap(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": Map.from(topicSubmissions!).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
    "user": user?.toMap(),
  };
}

class Breadcrumb {
  String? slug;
  String? title;
  int? index;
  String? type;

  Breadcrumb({
    this.slug,
    this.title,
    this.index,
    this.type,
  });

  Breadcrumb copyWith({
    String? slug,
    String? title,
    int? index,
    String? type,
  }) =>
      Breadcrumb(
        slug: slug ?? this.slug,
        title: title ?? this.title,
        index: index ?? this.index,
        type: type ?? this.type,
      );

  factory Breadcrumb.fromMap(Map<String, dynamic> json) => Breadcrumb(
    slug: json["slug"],
    title: json["title"],
    index: json["index"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "slug": slug,
    "title": title,
    "index": index,
    "type": type,
  };
}

class CoverPhotoLinks {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  CoverPhotoLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  CoverPhotoLinks copyWith({
    String? self,
    String? html,
    String? download,
    String? downloadLocation,
  }) =>
      CoverPhotoLinks(
        self: self ?? this.self,
        html: html ?? this.html,
        download: download ?? this.download,
        downloadLocation: downloadLocation ?? this.downloadLocation,
      );

  factory CoverPhotoLinks.fromMap(Map<String, dynamic> json) => CoverPhotoLinks(
    self: json["self"],
    html: json["html"],
    download: json["download"],
    downloadLocation: json["download_location"],
  );

  Map<String, dynamic> toMap() => {
    "self": self,
    "html": html,
    "download": download,
    "download_location": downloadLocation,
  };
}

class TopicSubmission {
  TopicSubmissionStatus? status;
  DateTime? approvedOn;

  TopicSubmission({
    this.status,
    this.approvedOn,
  });

  TopicSubmission copyWith({
    TopicSubmissionStatus? status,
    DateTime? approvedOn,
  }) =>
      TopicSubmission(
        status: status ?? this.status,
        approvedOn: approvedOn ?? this.approvedOn,
      );

  factory TopicSubmission.fromMap(Map<String, dynamic> json) => TopicSubmission(
    status: topicSubmissionStatusValues.map[json["status"]]!,
    approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
  );

  Map<String, dynamic> toMap() => {
    "status": topicSubmissionStatusValues.reverse[status],
    "approved_on": approvedOn?.toIso8601String(),
  };
}

enum TopicSubmissionStatus {
  APPROVED
}

final topicSubmissionStatusValues = EnumValues({
  "approved": TopicSubmissionStatus.APPROVED
});

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  Urls copyWith({
    String? raw,
    String? full,
    String? regular,
    String? small,
    String? thumb,
    String? smallS3,
  }) =>
      Urls(
        raw: raw ?? this.raw,
        full: full ?? this.full,
        regular: regular ?? this.regular,
        small: small ?? this.small,
        thumb: thumb ?? this.thumb,
        smallS3: smallS3 ?? this.smallS3,
      );

  factory Urls.fromMap(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
  );

  Map<String, dynamic> toMap() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
    "small_s3": smallS3,
  };
}

class Owner {
  String? id;
  DateTime? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  OwnerLinks? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  int? totalPromotedPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  Owner({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.totalPromotedPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  Owner copyWith({
    String? id,
    DateTime? updatedAt,
    String? username,
    String? name,
    String? firstName,
    String? lastName,
    String? twitterUsername,
    String? portfolioUrl,
    String? bio,
    String? location,
    OwnerLinks? links,
    ProfileImage? profileImage,
    String? instagramUsername,
    int? totalCollections,
    int? totalLikes,
    int? totalPhotos,
    int? totalPromotedPhotos,
    bool? acceptedTos,
    bool? forHire,
    Social? social,
  }) =>
      Owner(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        username: username ?? this.username,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        twitterUsername: twitterUsername ?? this.twitterUsername,
        portfolioUrl: portfolioUrl ?? this.portfolioUrl,
        bio: bio ?? this.bio,
        location: location ?? this.location,
        links: links ?? this.links,
        profileImage: profileImage ?? this.profileImage,
        instagramUsername: instagramUsername ?? this.instagramUsername,
        totalCollections: totalCollections ?? this.totalCollections,
        totalLikes: totalLikes ?? this.totalLikes,
        totalPhotos: totalPhotos ?? this.totalPhotos,
        totalPromotedPhotos: totalPromotedPhotos ?? this.totalPromotedPhotos,
        acceptedTos: acceptedTos ?? this.acceptedTos,
        forHire: forHire ?? this.forHire,
        social: social ?? this.social,
      );

  factory Owner.fromMap(Map<String, dynamic> json) => Owner(
    id: json["id"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    twitterUsername: json["twitter_username"],
    portfolioUrl: json["portfolio_url"],
    bio: json["bio"],
    location: json["location"],
    links: json["links"] == null ? null : OwnerLinks.fromMap(json["links"]),
    profileImage: json["profile_image"] == null ? null : ProfileImage.fromMap(json["profile_image"]),
    instagramUsername: json["instagram_username"],
    totalCollections: json["total_collections"],
    totalLikes: json["total_likes"],
    totalPhotos: json["total_photos"],
    totalPromotedPhotos: json["total_promoted_photos"],
    acceptedTos: json["accepted_tos"],
    forHire: json["for_hire"],
    social: json["social"] == null ? null : Social.fromMap(json["social"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "updated_at": updatedAt?.toIso8601String(),
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "twitter_username": twitterUsername,
    "portfolio_url": portfolioUrl,
    "bio": bio,
    "location": location,
    "links": links?.toMap(),
    "profile_image": profileImage?.toMap(),
    "instagram_username": instagramUsername,
    "total_collections": totalCollections,
    "total_likes": totalLikes,
    "total_photos": totalPhotos,
    "total_promoted_photos": totalPromotedPhotos,
    "accepted_tos": acceptedTos,
    "for_hire": forHire,
    "social": social?.toMap(),
  };
}

class OwnerLinks {
  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  OwnerLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  OwnerLinks copyWith({
    String? self,
    String? html,
    String? photos,
    String? likes,
    String? portfolio,
    String? following,
    String? followers,
  }) =>
      OwnerLinks(
        self: self ?? this.self,
        html: html ?? this.html,
        photos: photos ?? this.photos,
        likes: likes ?? this.likes,
        portfolio: portfolio ?? this.portfolio,
        following: following ?? this.following,
        followers: followers ?? this.followers,
      );

  factory OwnerLinks.fromMap(Map<String, dynamic> json) => OwnerLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
    likes: json["likes"],
    portfolio: json["portfolio"],
    following: json["following"],
    followers: json["followers"],
  );

  Map<String, dynamic> toMap() => {
    "self": self,
    "html": html,
    "photos": photos,
    "likes": likes,
    "portfolio": portfolio,
    "following": following,
    "followers": followers,
  };
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  ProfileImage copyWith({
    String? small,
    String? medium,
    String? large,
  }) =>
      ProfileImage(
        small: small ?? this.small,
        medium: medium ?? this.medium,
        large: large ?? this.large,
      );

  factory ProfileImage.fromMap(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toMap() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  Social copyWith({
    String? instagramUsername,
    String? portfolioUrl,
    String? twitterUsername,
    dynamic paypalEmail,
  }) =>
      Social(
        instagramUsername: instagramUsername ?? this.instagramUsername,
        portfolioUrl: portfolioUrl ?? this.portfolioUrl,
        twitterUsername: twitterUsername ?? this.twitterUsername,
        paypalEmail: paypalEmail ?? this.paypalEmail,
      );

  factory Social.fromMap(Map<String, dynamic> json) => Social(
    instagramUsername: json["instagram_username"],
    portfolioUrl: json["portfolio_url"],
    twitterUsername: json["twitter_username"],
    paypalEmail: json["paypal_email"],
  );

  Map<String, dynamic> toMap() => {
    "instagram_username": instagramUsername,
    "portfolio_url": portfolioUrl,
    "twitter_username": twitterUsername,
    "paypal_email": paypalEmail,
  };
}

class TopicsModelLinks {
  String? self;
  String? html;
  String? photos;

  TopicsModelLinks({
    this.self,
    this.html,
    this.photos,
  });

  TopicsModelLinks copyWith({
    String? self,
    String? html,
    String? photos,
  }) =>
      TopicsModelLinks(
        self: self ?? this.self,
        html: html ?? this.html,
        photos: photos ?? this.photos,
      );

  factory TopicsModelLinks.fromMap(Map<String, dynamic> json) => TopicsModelLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
  );

  Map<String, dynamic> toMap() => {
    "self": self,
    "html": html,
    "photos": photos,
  };
}

class PreviewPhoto {
  String? id;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? blurHash;
  Urls? urls;

  PreviewPhoto({
    this.id,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.blurHash,
    this.urls,
  });

  PreviewPhoto copyWith({
    String? id,
    String? slug,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? blurHash,
    Urls? urls,
  }) =>
      PreviewPhoto(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        blurHash: blurHash ?? this.blurHash,
        urls: urls ?? this.urls,
      );

  factory PreviewPhoto.fromMap(Map<String, dynamic> json) => PreviewPhoto(
    id: json["id"],
    slug: json["slug"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    blurHash: json["blur_hash"],
    urls: json["urls"] == null ? null : Urls.fromMap(json["urls"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "slug": slug,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "blur_hash": blurHash,
    "urls": urls?.toMap(),
  };
}

enum TopicsModelStatus {
  OPEN
}

final topicsModelStatusValues = EnumValues({
  "open": TopicsModelStatus.OPEN
});

enum Visibility {
  FEATURED
}

final visibilityValues = EnumValues({
  "featured": Visibility.FEATURED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

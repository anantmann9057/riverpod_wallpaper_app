// To parse this JSON data, do
//
//     final collectionsModel = collectionsModelFromMap(jsonString);

import 'dart:convert';

List<CollectionsModel> collectionsModelFromMap(String str) =>
    List<CollectionsModel>.from(
        json.decode(str).map((x) => CollectionsModel.fromMap(x)));

String collectionsModelToMap(List<CollectionsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CollectionsModel {
  String? id;
  String? title;
  String? description;
  DateTime? publishedAt;
  DateTime? lastCollectedAt;
  DateTime? updatedAt;
  bool? featured;
  int? totalPhotos;
  bool? private;
  String? shareKey;
  List<Tag>? tags;
  CollectionsModelLinks? links;
  User? user;
  CollectionsModelCoverPhoto? coverPhoto;
  List<PreviewPhoto>? previewPhotos;

  CollectionsModel({
    this.id,
    this.title,
    this.description,
    this.publishedAt,
    this.lastCollectedAt,
    this.updatedAt,
    this.featured,
    this.totalPhotos,
    this.private,
    this.shareKey,
    this.tags,
    this.links,
    this.user,
    this.coverPhoto,
    this.previewPhotos,
  });

  factory CollectionsModel.fromMap(Map<String, dynamic> json) =>
      CollectionsModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        lastCollectedAt: json["last_collected_at"] == null
            ? null
            : DateTime.parse(json["last_collected_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        featured: json["featured"],
        totalPhotos: json["total_photos"],
        private: json["private"],
        shareKey: json["share_key"],
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromMap(x))),
        links: json["links"] == null
            ? null
            : CollectionsModelLinks.fromMap(json["links"]),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        coverPhoto: json["cover_photo"] == null
            ? null
            : CollectionsModelCoverPhoto.fromMap(json["cover_photo"]),
        previewPhotos: json["preview_photos"] == null
            ? []
            : List<PreviewPhoto>.from(
                json["preview_photos"]!.map((x) => PreviewPhoto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "published_at": publishedAt?.toIso8601String(),
        "last_collected_at": lastCollectedAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "featured": featured,
        "total_photos": totalPhotos,
        "private": private,
        "share_key": shareKey,
        "tags":
            tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toMap())),
        "links": links?.toMap(),
        "user": user?.toMap(),
        "cover_photo": coverPhoto?.toMap(),
        "preview_photos": previewPhotos == null
            ? []
            : List<dynamic>.from(previewPhotos!.map((x) => x.toMap())),
      };
}

class CollectionsModelCoverPhoto {
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
  List<dynamic>? breadcrumbs;
  Urls? urls;
  CoverPhotoLinks? links;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  dynamic sponsorship;
  PurpleTopicSubmissions? topicSubmissions;
  User? user;

  CollectionsModelCoverPhoto({
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

  factory CollectionsModelCoverPhoto.fromMap(Map<String, dynamic> json) =>
      CollectionsModelCoverPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: json["breadcrumbs"] == null
            ? []
            : List<dynamic>.from(json["breadcrumbs"]!.map((x) => x)),
        urls: json["urls"] == null ? null : Urls.fromMap(json["urls"]),
        links: json["links"] == null
            ? null
            : CoverPhotoLinks.fromMap(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null
            ? []
            : List<dynamic>.from(
                json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: json["topic_submissions"] == null
            ? null
            : PurpleTopicSubmissions.fromMap(json["topic_submissions"]),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
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
        "breadcrumbs": breadcrumbs == null
            ? []
            : List<dynamic>.from(breadcrumbs!.map((x) => x)),
        "urls": urls?.toMap(),
        "links": links?.toMap(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null
            ? []
            : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions?.toMap(),
        "user": user?.toMap(),
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

class PurpleTopicSubmissions {
  ArchitectureInterior? fashionBeauty;
  ArchitectureInterior? people;
  ArchitectureInterior? architectureInterior;
  ArchitectureInterior? wallpapers;
  ArchitectureInterior? currentEvents;
  ArchitectureInterior? cozyMoments;
  ArchitectureInterior? holidays;
  ArchitectureInterior? experimental;

  PurpleTopicSubmissions({
    this.fashionBeauty,
    this.people,
    this.architectureInterior,
    this.wallpapers,
    this.currentEvents,
    this.cozyMoments,
    this.holidays,
    this.experimental,
  });

  factory PurpleTopicSubmissions.fromMap(Map<String, dynamic> json) =>
      PurpleTopicSubmissions(
        fashionBeauty: json["fashion-beauty"] == null
            ? null
            : ArchitectureInterior.fromMap(json["fashion-beauty"]),
        people: json["people"] == null
            ? null
            : ArchitectureInterior.fromMap(json["people"]),
        architectureInterior: json["architecture-interior"] == null
            ? null
            : ArchitectureInterior.fromMap(json["architecture-interior"]),
        wallpapers: json["wallpapers"] == null
            ? null
            : ArchitectureInterior.fromMap(json["wallpapers"]),
        currentEvents: json["current-events"] == null
            ? null
            : ArchitectureInterior.fromMap(json["current-events"]),
        cozyMoments: json["cozy-moments"] == null
            ? null
            : ArchitectureInterior.fromMap(json["cozy-moments"]),
        holidays: json["holidays"] == null
            ? null
            : ArchitectureInterior.fromMap(json["holidays"]),
        experimental: json["experimental"] == null
            ? null
            : ArchitectureInterior.fromMap(json["experimental"]),
      );

  Map<String, dynamic> toMap() => {
        "fashion-beauty": fashionBeauty?.toMap(),
        "people": people?.toMap(),
        "architecture-interior": architectureInterior?.toMap(),
        "wallpapers": wallpapers?.toMap(),
        "current-events": currentEvents?.toMap(),
        "cozy-moments": cozyMoments?.toMap(),
        "holidays": holidays?.toMap(),
        "experimental": experimental?.toMap(),
      };
}

class ArchitectureInterior {
  Status? status;
  DateTime? approvedOn;

  ArchitectureInterior({
    this.status,
    this.approvedOn,
  });

  factory ArchitectureInterior.fromMap(Map<String, dynamic> json) =>
      ArchitectureInterior(
        status: statusValues.map[json["status"]]!,
        approvedOn: json["approved_on"] == null
            ? null
            : DateTime.parse(json["approved_on"]),
      );

  Map<String, dynamic> toMap() => {
        "status": statusValues.reverse[status],
        "approved_on": approvedOn?.toIso8601String(),
      };
}

enum Status { APPROVED, REJECTED }

final statusValues =
    EnumValues({"approved": Status.APPROVED, "rejected": Status.REJECTED});

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

class User {
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
  UserLinks? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  User({
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
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: json["links"] == null ? null : UserLinks.fromMap(json["links"]),
        profileImage: json["profile_image"] == null
            ? null
            : ProfileImage.fromMap(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
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
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toMap(),
      };
}

class UserLinks {
  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  factory UserLinks.fromMap(Map<String, dynamic> json) => UserLinks(
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

class CollectionsModelLinks {
  String? self;
  String? html;
  String? photos;
  String? related;

  CollectionsModelLinks({
    this.self,
    this.html,
    this.photos,
    this.related,
  });

  factory CollectionsModelLinks.fromMap(Map<String, dynamic> json) =>
      CollectionsModelLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        related: json["related"],
      );

  Map<String, dynamic> toMap() => {
        "self": self,
        "html": html,
        "photos": photos,
        "related": related,
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

  factory PreviewPhoto.fromMap(Map<String, dynamic> json) => PreviewPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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

class Tag {
  Type? type;
  String? title;
  Source? source;

  Tag({
    this.type,
    this.title,
    this.source,
  });

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        type: typeValues.map[json["type"]]!,
        title: json["title"],
        source: json["source"] == null ? null : Source.fromMap(json["source"]),
      );

  Map<String, dynamic> toMap() => {
        "type": typeValues.reverse[type],
        "title": title,
        "source": source?.toMap(),
      };
}

class Source {
  Ancestry? ancestry;
  String? title;
  String? subtitle;
  String? description;
  String? metaTitle;
  String? metaDescription;
  SourceCoverPhoto? coverPhoto;

  Source({
    this.ancestry,
    this.title,
    this.subtitle,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.coverPhoto,
  });

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        ancestry: json["ancestry"] == null
            ? null
            : Ancestry.fromMap(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: json["cover_photo"] == null
            ? null
            : SourceCoverPhoto.fromMap(json["cover_photo"]),
      );

  Map<String, dynamic> toMap() => {
        "ancestry": ancestry?.toMap(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto?.toMap(),
      };
}

class Ancestry {
  Category? type;
  Category? category;
  Category? subcategory;

  Ancestry({
    this.type,
    this.category,
    this.subcategory,
  });

  factory Ancestry.fromMap(Map<String, dynamic> json) => Ancestry(
        type: json["type"] == null ? null : Category.fromMap(json["type"]),
        category: json["category"] == null
            ? null
            : Category.fromMap(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : Category.fromMap(json["subcategory"]),
      );

  Map<String, dynamic> toMap() => {
        "type": type?.toMap(),
        "category": category?.toMap(),
        "subcategory": subcategory?.toMap(),
      };
}

class Category {
  String? slug;
  String? prettySlug;

  Category({
    this.slug,
    this.prettySlug,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        slug: json["slug"],
        prettySlug: json["pretty_slug"],
      );

  Map<String, dynamic> toMap() => {
        "slug": slug,
        "pretty_slug": prettySlug,
      };
}

class SourceCoverPhoto {
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
  FluffyTopicSubmissions? topicSubmissions;
  bool? premium;
  bool? plus;
  User? user;

  SourceCoverPhoto({
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
    this.premium,
    this.plus,
    this.user,
  });

  factory SourceCoverPhoto.fromMap(Map<String, dynamic> json) =>
      SourceCoverPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: json["breadcrumbs"] == null
            ? []
            : List<Breadcrumb>.from(
                json["breadcrumbs"]!.map((x) => Breadcrumb.fromMap(x))),
        urls: json["urls"] == null ? null : Urls.fromMap(json["urls"]),
        links: json["links"] == null
            ? null
            : CoverPhotoLinks.fromMap(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null
            ? []
            : List<dynamic>.from(
                json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: json["topic_submissions"] == null
            ? null
            : FluffyTopicSubmissions.fromMap(json["topic_submissions"]),
        premium: json["premium"],
        plus: json["plus"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
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
        "breadcrumbs": breadcrumbs == null
            ? []
            : List<dynamic>.from(breadcrumbs!.map((x) => x.toMap())),
        "urls": urls?.toMap(),
        "links": links?.toMap(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null
            ? []
            : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions?.toMap(),
        "premium": premium,
        "plus": plus,
        "user": user?.toMap(),
      };
}

class Breadcrumb {
  String? slug;
  String? title;
  int? index;
  Type? type;

  Breadcrumb({
    this.slug,
    this.title,
    this.index,
    this.type,
  });

  factory Breadcrumb.fromMap(Map<String, dynamic> json) => Breadcrumb(
        slug: json["slug"],
        title: json["title"],
        index: json["index"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toMap() => {
        "slug": slug,
        "title": title,
        "index": index,
        "type": typeValues.reverse[type],
      };
}

enum Type { LANDING_PAGE, SEARCH }

final typeValues =
    EnumValues({"landing_page": Type.LANDING_PAGE, "search": Type.SEARCH});

class FluffyTopicSubmissions {
  ArchitectureInterior? wallpapers;
  ArchitectureInterior? colorOfWater;
  ArchitectureInterior? architectureInterior;
  ArchitectureInterior? artsCulture;
  ArchitectureInterior? nature;
  ArchitectureInterior? health;
  ArchitectureInterior? spirituality;
  ArchitectureInterior? texturesPatterns;
  ArchitectureInterior? experimental;
  ArchitectureInterior? people;
  Monochrome? monochrome;

  FluffyTopicSubmissions({
    this.wallpapers,
    this.colorOfWater,
    this.architectureInterior,
    this.artsCulture,
    this.nature,
    this.health,
    this.spirituality,
    this.texturesPatterns,
    this.experimental,
    this.people,
    this.monochrome,
  });

  factory FluffyTopicSubmissions.fromMap(Map<String, dynamic> json) =>
      FluffyTopicSubmissions(
        wallpapers: json["wallpapers"] == null
            ? null
            : ArchitectureInterior.fromMap(json["wallpapers"]),
        colorOfWater: json["color-of-water"] == null
            ? null
            : ArchitectureInterior.fromMap(json["color-of-water"]),
        architectureInterior: json["architecture-interior"] == null
            ? null
            : ArchitectureInterior.fromMap(json["architecture-interior"]),
        artsCulture: json["arts-culture"] == null
            ? null
            : ArchitectureInterior.fromMap(json["arts-culture"]),
        nature: json["nature"] == null
            ? null
            : ArchitectureInterior.fromMap(json["nature"]),
        health: json["health"] == null
            ? null
            : ArchitectureInterior.fromMap(json["health"]),
        spirituality: json["spirituality"] == null
            ? null
            : ArchitectureInterior.fromMap(json["spirituality"]),
        texturesPatterns: json["textures-patterns"] == null
            ? null
            : ArchitectureInterior.fromMap(json["textures-patterns"]),
        experimental: json["experimental"] == null
            ? null
            : ArchitectureInterior.fromMap(json["experimental"]),
        people: json["people"] == null
            ? null
            : ArchitectureInterior.fromMap(json["people"]),
        monochrome: json["monochrome"] == null
            ? null
            : Monochrome.fromMap(json["monochrome"]),
      );

  Map<String, dynamic> toMap() => {
        "wallpapers": wallpapers?.toMap(),
        "color-of-water": colorOfWater?.toMap(),
        "architecture-interior": architectureInterior?.toMap(),
        "arts-culture": artsCulture?.toMap(),
        "nature": nature?.toMap(),
        "health": health?.toMap(),
        "spirituality": spirituality?.toMap(),
        "textures-patterns": texturesPatterns?.toMap(),
        "experimental": experimental?.toMap(),
        "people": people?.toMap(),
        "monochrome": monochrome?.toMap(),
      };
}

class Monochrome {
  Status? status;

  Monochrome({
    this.status,
  });

  factory Monochrome.fromMap(Map<String, dynamic> json) => Monochrome(
        status: statusValues.map[json["status"]]!,
      );

  Map<String, dynamic> toMap() => {
        "status": statusValues.reverse[status],
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

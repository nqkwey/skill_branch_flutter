class PhotoList {
  List<Photo> photos;

  PhotoList({this.photos});

  PhotoList.fromJson(List<dynamic> json) {
    photos = List<Photo>();
    json.forEach((value) {
      photos.add(Photo.fromJson(value as Map<String, dynamic>));
    });
  }

  List<dynamic> toJson() {
    List<dynamic> result = List<dynamic>();

    photos.forEach((element) {
      result.add(element.toJson());
    });

    return result;
  }
}

class Photo {
  String id;
  String createdAt;
  String updatedAt;
  String promotedAt;
  int width;
  int height;
  String color;
  String description;
  String altDescription;
  Urls urls;
  Links links;
  //List<Null> categories;
  int likes;
  bool likedByUser;
  //List<Null> currentUserCollections;
  Sponsorship sponsorship;
  Sponsor user;

  Photo(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.promotedAt,
      this.width,
      this.height,
      this.color,
      this.description,
      this.altDescription,
      this.urls,
      this.links,
      //this.categories,
      this.likes,
      this.likedByUser,
      //this.currentUserCollections,
      this.sponsorship,
      this.user});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = json['promoted_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    description = json['description'];
    altDescription = json['alt_description'] == null ? "" : json['alt_description'];
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    //был пустой объект, его генератор не смог обработать
    //в этом примере он на мне нужен
    //комментируем
    // if (json['categories'] != null) {
    //   categories = new List<Null>();
    //   json['categories'].forEach((v) {
    //     categories.add(new Null.fromJson(v));
    //   });
    // }
    likes = json['likes'];
    likedByUser = json['liked_by_user'] ?? false;
    //был пустой объект, его генератор не смог обработать
    //в этом примере он на мне нужен
    //комментируем
    // if (json['current_user_collections'] != null) {
    //   currentUserCollections = new List<Null>();
    //   json['current_user_collections'].forEach((v) {
    //     currentUserCollections.add(new Null.fromJson(v));
    //   });
    // }
    sponsorship = json['sponsorship'] != null
        ? new Sponsorship.fromJson(json['sponsorship'])
        : null;
    user = json['user'] != null ? new Sponsor.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['promoted_at'] = this.promotedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['description'] = this.description;
    data['alt_description'] = this.altDescription;
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    //был пустой объект, его генератор не смог обработать
    //в этом примере он на мне нужен
    //комментируем
    // if (this.categories != null) {
    //   data['categories'] = this.categories.map((v) => v.toJson()).toList();
    // }
    data['likes'] = this.likes;
    data['liked_by_user'] = this.likedByUser;
    //был пустой объект, его генератор не смог обработать
    //в этом примере он на мне нужен
    //комментируем
    // if (this.currentUserCollections != null) {
    //   data['current_user_collections'] =
    //       this.currentUserCollections.map((v) => v.toJson()).toList();
    // }
    if (this.sponsorship != null) {
      data['sponsorship'] = this.sponsorship.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Links {
  String self;
  String html;
  String download;
  String downloadLocation;

  Links({this.self, this.html, this.download, this.downloadLocation});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
    downloadLocation = json['download_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['download'] = this.download;
    data['download_location'] = this.downloadLocation;
    return data;
  }
}

class Sponsorship {
  List<String> impressionUrls;
  String tagline;
  String taglineUrl;
  Sponsor sponsor;

  Sponsorship(
      {this.impressionUrls, this.tagline, this.taglineUrl, this.sponsor});

  Sponsorship.fromJson(Map<String, dynamic> json) {
    impressionUrls = json['impression_urls'].cast<String>();
    tagline = json['tagline'];
    taglineUrl = json['tagline_url'];
    sponsor =
        json['sponsor'] != null ? new Sponsor.fromJson(json['sponsor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['impression_urls'] = this.impressionUrls;
    data['tagline'] = this.tagline;
    data['tagline_url'] = this.taglineUrl;
    if (this.sponsor != null) {
      data['sponsor'] = this.sponsor.toJson();
    }
    return data;
  }
}

class Sponsor {
  String id;
  String updatedAt;
  String username;
  String name;
  String firstName;
  String lastName;
  String twitterUsername;
  String portfolioUrl;
  String bio;
  String location;
  Links links;
  ProfileImage profileImage;
  String instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  bool acceptedTos;

  Sponsor(
      {this.id,
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
      this.acceptedTos});

  Sponsor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    profileImage = json['profile_image'] != null
        ? new ProfileImage.fromJson(json['profile_image'])
        : null;
    instagramUsername = json['instagram_username'];
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    acceptedTos = json['accepted_tos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['twitter_username'] = this.twitterUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['location'] = this.location;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage.toJson();
    }
    data['instagram_username'] = this.instagramUsername;
    data['total_collections'] = this.totalCollections;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    data['accepted_tos'] = this.acceptedTos;
    return data;
  }
}

class SponsorLinks {
  //changed the name
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  SponsorLinks(
      {this.self,
      this.html,
      this.photos,
      this.likes,
      this.portfolio,
      this.following,
      this.followers});

  SponsorLinks.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
    portfolio = json['portfolio'];
    following = json['following'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['photos'] = this.photos;
    data['likes'] = this.likes;
    data['portfolio'] = this.portfolio;
    data['following'] = this.following;
    data['followers'] = this.followers;
    return data;
  }
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}

class Photos {
  String id;
  String createdAt;
  String updatedAt;
  int width;
  int height;
  String color;
  String blurHash;
  int downloads;
  int likes;
  bool likedByUser;
  String description;
  Exif exif;
  Location location;
  List<Tags> tags;
  List<CurrentUserCollections> currentUserCollections;
  Urls urls;
  Links links;
  User user;

  Photos(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.width,
        this.height,
        this.color,
        this.blurHash,
        this.downloads,
        this.likes,
        this.likedByUser,
        this.description,
        this.exif,
        this.location,
        this.tags,
        this.currentUserCollections,
        this.urls,
        this.links,
        this.user});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    downloads = json['downloads'];
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    description = json['description'];
    exif = json['exif'] != null ? new Exif.fromJson(json['exif']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    if (json['current_user_collections'] != null) {
      currentUserCollections = new List<CurrentUserCollections>();
      json['current_user_collections'].forEach((v) {
        currentUserCollections.add(new CurrentUserCollections.fromJson(v));
      });
    }
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['blur_hash'] = this.blurHash;
    data['downloads'] = this.downloads;
    data['likes'] = this.likes;
    data['liked_by_user'] = this.likedByUser;
    data['description'] = this.description;
    if (this.exif != null) {
      data['exif'] = this.exif.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.currentUserCollections != null) {
      data['current_user_collections'] =
          this.currentUserCollections.map((v) => v.toJson()).toList();
    }
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Exif {
  String make;
  String model;
  String exposureTime;
  String aperture;
  String focalLength;
  int iso;

  Exif(
      {this.make,
        this.model,
        this.exposureTime,
        this.aperture,
        this.focalLength,
        this.iso});

  Exif.fromJson(Map<String, dynamic> json) {
    make = json['make'];
    model = json['model'];
    exposureTime = json['exposure_time'];
    aperture = json['aperture'];
    focalLength = json['focal_length'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['make'] = this.make;
    data['model'] = this.model;
    data['exposure_time'] = this.exposureTime;
    data['aperture'] = this.aperture;
    data['focal_length'] = this.focalLength;
    data['iso'] = this.iso;
    return data;
  }
}

class Location {
  String city;
  String country;
  Position position;

  Location({this.city, this.country, this.position});

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    if (this.position != null) {
      data['position'] = this.position.toJson();
    }
    return data;
  }
}

class Position {
  double latitude;
  double longitude;

  Position({this.latitude, this.longitude});

  Position.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Tags {
  String title;

  Tags({this.title});

  Tags.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}

class CurrentUserCollections {
  int id;
  String title;
  String publishedAt;
  String lastCollectedAt;
  String updatedAt;
  Null coverPhoto;
  Null user;

  CurrentUserCollections(
      {this.id,
        this.title,
        this.publishedAt,
        this.lastCollectedAt,
        this.updatedAt,
        this.coverPhoto,
        this.user});

  CurrentUserCollections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    publishedAt = json['published_at'];
    lastCollectedAt = json['last_collected_at'];
    updatedAt = json['updated_at'];
    coverPhoto = json['cover_photo'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['published_at'] = this.publishedAt;
    data['last_collected_at'] = this.lastCollectedAt;
    data['updated_at'] = this.updatedAt;
    data['cover_photo'] = this.coverPhoto;
    data['user'] = this.user;
    return data;
  }
}

class User {
  String id;
  String updatedAt;
  String username;
  String name;
  String portfolioUrl;
  String bio;
  String location;
  int totalLikes;
  int totalPhotos;
  int totalCollections;
  Links links;

  User(
      {this.id,
        this.updatedAt,
        this.username,
        this.name,
        this.portfolioUrl,
        this.bio,
        this.location,
        this.totalLikes,
        this.totalPhotos,
        this.totalCollections,
        this.links});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalCollections = json['total_collections'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    data['total_collections'] = this.totalCollections;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}

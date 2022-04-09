// To parse this JSON data, do
//
//     final speakerListResponse = speakerListResponseFromJson(jsonString);

import 'dart:convert';

SpeakerListResponse speakerListResponseFromJson(String str) =>
    SpeakerListResponse.fromJson(json.decode(str));

String speakerListResponseToJson(SpeakerListResponse data) =>
    json.encode(data.toJson());

class SpeakerListResponse {
  SpeakerListResponseData? speakersData;
  String? message;
  int? status;

  SpeakerListResponse({
    this.speakersData,
    this.message,
    this.status,
  });

  factory SpeakerListResponse.fromJson(Map<String, dynamic> json) =>
      SpeakerListResponse(
        speakersData: SpeakerListResponseData.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": speakersData!.toJson(),
        "message": message,
        "status": status,
      };
}

class SpeakerListResponseData {
  List<Speakers>? speakers;

  SpeakerListResponseData({
    this.speakers,
  });

  factory SpeakerListResponseData.fromJson(Map<String, dynamic> json) =>
      SpeakerListResponseData(
        speakers: List<Speakers>.from(
            json["speakers"].map((x) => Speakers.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "speakers": List<dynamic>.from(speakers!.map((x) => x.toJson())),
      };
}

class Speakers {
  SpeakerData? data;

  Speakers({
    this.data,
  });

  factory Speakers.fromJson(Map<String, dynamic> json) => Speakers(
        data: SpeakerData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class SpeakerData {
  String? id;
  Type? type;
  Attributes? attributes;

  SpeakerData({
    this.id,
    this.type,
    this.attributes,
  });

  factory SpeakerData.fromJson(Map<String, dynamic> json) => SpeakerData(
        id: json["id"],
        type: typeValues.map![json["type"]],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse![type],
        "attributes": attributes!.toJson(),
      };
}

class Attributes {
  String? name;
  String? designation;
  String? personalWebsite;
  String? linkedin;
  String? github;
  String? twitter;
  String? aboutMe;
  String? avatar;

  Attributes({
    this.name,
    this.designation,
    this.personalWebsite,
    this.linkedin,
    this.github,
    this.twitter,
    this.aboutMe,
    this.avatar,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        designation: json["designation"],
        personalWebsite: json["personal_website"],
        linkedin: json["linkedin"],
        github: json["github"],
        twitter: json["twitter"],
        aboutMe: json["about_me"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "designation": designation,
        "personal_website": personalWebsite,
        "linkedin": linkedin,
        "github": github,
        "twitter": twitter,
        "about_me": aboutMe,
        "avatar": avatar,
      };
}

enum Type { user }

final typeValues = EnumValues({"user": Type.user});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

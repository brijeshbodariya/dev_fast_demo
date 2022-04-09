class EventSessionListResponse {
  EventSessionListData? data;
  String? message;
  int? status;

  EventSessionListResponse({this.data, this.message, this.status});

  EventSessionListResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? EventSessionListData.fromJson(json['data'])
        : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class EventSessionListData {
  List<TrackSlots>? trackSlots;

  EventSessionListData({this.trackSlots});

  EventSessionListData.fromJson(Map<String, dynamic> json) {
    if (json['track_slots'] != null) {
      trackSlots = <TrackSlots>[];
      json['track_slots'].forEach((v) {
        trackSlots!.add(TrackSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (trackSlots != null) {
      data['track_slots'] = trackSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackSlots {
  TrackSlotsData? data;
  List<Included>? included;

  TrackSlots({this.data, this.included});

  TrackSlots.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? TrackSlotsData.fromJson(json['data']) : null;
    if (json['included'] != null) {
      included = <Included>[];
      json['included'].forEach((v) {
        included!.add(Included.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (included != null) {
      data['included'] = included!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackSlotsData {
  String? id;
  String? type;
  SessionAttributes? sessionAttributes;
  Relationships? relationships;

  TrackSlotsData(
      {this.id, this.type, this.sessionAttributes, this.relationships});

  TrackSlotsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    sessionAttributes = json['attributes'] != null
        ? SessionAttributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (sessionAttributes != null) {
      data['attributes'] = sessionAttributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class SessionAttributes {
  String? sessionTitle;
  int? eventLocationTrackId;
  String? tagsList;
  String? startTime;
  String? endTime;

  SessionAttributes.fromJson(Map<String, dynamic> json) {
    sessionTitle = json['session_title'];
    eventLocationTrackId = json['event_location_track_id'];
    tagsList = json['tags_list'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session_title'] = sessionTitle;
    data['event_location_track_id'] = eventLocationTrackId;
    data['tags_list'] = tagsList;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}

class Relationships {
  SpeakerRegistration? speakerRegistration;

  Relationships({this.speakerRegistration});

  Relationships.fromJson(Map<String, dynamic> json) {
    speakerRegistration = json['speaker_registration'] != null
        ? SpeakerRegistration.fromJson(json['speaker_registration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (speakerRegistration != null) {
      data['speaker_registration'] = speakerRegistration!.toJson();
    }
    return data;
  }
}

class SpeakerRegistration {
  SpeakerRegistrationData? data;

  SpeakerRegistration({this.data});

  SpeakerRegistration.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? SpeakerRegistrationData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SpeakerRegistrationData {
  String? id;
  String? type;

  SpeakerRegistrationData({this.id, this.type});

  SpeakerRegistrationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class Included {
  String? id;
  String? type;
  IncludedAttributes? attributes;

  Included({this.id, this.type, this.attributes});

  Included.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    attributes = json['attributes'] != null
        ? IncludedAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class IncludedAttributes {
  int? id;
  String? name;
  String? designation;
  String? aboutMe;
  String? personalWebsite;
  String? linkedin;
  String? github;
  String? twitter;
  String? avatar;

  IncludedAttributes(
      {this.id,
      this.name,
      this.designation,
      this.aboutMe,
      this.personalWebsite,
      this.linkedin,
      this.github,
      this.twitter,
      this.avatar});

  IncludedAttributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    designation = json['designation'];
    aboutMe = json['about_me'];
    personalWebsite = json['personal_website'];
    linkedin = json['linkedin'];
    github = json['github'];
    twitter = json['twitter'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['designation'] = designation;
    data['about_me'] = aboutMe;
    data['personal_website'] = personalWebsite;
    data['linkedin'] = linkedin;
    data['github'] = github;
    data['twitter'] = twitter;
    data['avatar'] = avatar;
    return data;
  }
}

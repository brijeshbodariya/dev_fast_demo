import 'dart:async';

import 'package:dev_fast_demo/model/response%20model/event_session_list.dart';
import 'package:dev_fast_demo/network/api_response.dart';
import 'package:dev_fast_demo/network/devfest_repository.dart';
import 'package:flutter/foundation.dart';

class EventSessionListBloc {
  bool connectionState = false;
  DevfestRepository? _devFestRepository;

  StreamController? _eventSessionTrackListController;

  StreamSink get trackListSink => _eventSessionTrackListController!.sink;

  Stream get trackListStream => _eventSessionTrackListController!.stream;

  EventSessionListBloc(String url) {
    _eventSessionTrackListController =
        StreamController<ApiResponse<EventSessionListResponse>>();
    _devFestRepository = DevfestRepository();
    fetchTrackList(url);
  }

  fetchTrackList(String url) async {
    trackListSink.add(ApiResponse.loading('Fetching track list'));
    try {
      EventSessionListResponse trackListResponse =
          await _devFestRepository!.fetchEventSessionList(url);

      if (kDebugMode) {
        print(trackListResponse.data);
      }
      trackListSink.add(ApiResponse.completed(trackListResponse));
    } catch (e) {
      trackListSink.add(ApiResponse.error(e.toString()));
      if (kDebugMode) {
        print(e);
      }
    }
  }

  dispose() {
    _eventSessionTrackListController?.close();
  }
}

import 'dart:async';

import 'package:dev_fast_demo/model/response%20model/track_list_response.dart';
import 'package:dev_fast_demo/network/api_response.dart';
import 'package:dev_fast_demo/network/devfest_repository.dart';
import 'package:flutter/foundation.dart';

class TrackListBloc {
  bool connectionState = false;
  DevfestRepository? _devFestRepository;

  StreamController? _trackListController;

  StreamSink get trackListSink => _trackListController!.sink;

  Stream get trackListStream => _trackListController!.stream;

  TrackListBloc() {
    _trackListController = StreamController<ApiResponse<TrackListResponse>>();
    _devFestRepository = DevfestRepository();
    fetchTrackList();
  }

  fetchTrackList() async {
    trackListSink.add(ApiResponse.loading('Fetching track list'));
    try {
      TrackListResponse trackListResponse =
          await _devFestRepository!.fetchTrackList();
      trackListSink.add(ApiResponse.completed(trackListResponse));
    } catch (e) {
      trackListSink.add(ApiResponse.error(e.toString()));
      if (kDebugMode) {
        print(e);
      }
    }
  }

  dispose() {
    _trackListController?.close();
  }
}

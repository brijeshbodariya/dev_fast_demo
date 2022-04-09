import 'dart:async';

import 'package:dev_fast_demo/model/response%20model/speaker_list_response.dart';
import 'package:dev_fast_demo/network/api_response.dart';
import 'package:dev_fast_demo/network/devfest_repository.dart';

class SpeakerBloc {
  bool connectionState = false;
  List<Speakers> speakerList = <Speakers>[];
  DevfestRepository devFestRepository = DevfestRepository();

  StreamController<ApiResponse<SpeakerListResponse>>
      eventQuotationDetailsBlocController =
      StreamController<ApiResponse<SpeakerListResponse>>();
  StreamController connectionBlocController = StreamController<bool>();

  Stream get quotationStream => eventQuotationDetailsBlocController.stream;

  void updateList() async {
    try {
      SpeakerListResponse speakerListResponse =
          await devFestRepository.fetchDevFestSpeakers();
      speakerList.addAll(speakerListResponse.speakersData!.speakers!);
      eventQuotationDetailsBlocController.sink
          .add(ApiResponse.completed(speakerListResponse));
    } catch (e) {
      eventQuotationDetailsBlocController.sink
          .add(ApiResponse.error(e.toString()));
    }
  }

  void dispose() {
    eventQuotationDetailsBlocController.close();
    connectionBlocController.close();
  }
}

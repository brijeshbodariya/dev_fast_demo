import 'package:dev_fast_demo/bloc/event_sesson_list_bloc.dart';
import 'package:dev_fast_demo/model/response%20model/event_session_list.dart';
import 'package:dev_fast_demo/network/api_response.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgendaItem extends StatefulWidget {
  final String url;

  const AgendaItem(this.url, {Key? key}) : super(key: key);

  @override
  _AgendaItemState createState() => _AgendaItemState();
}

class _AgendaItemState extends State<AgendaItem> {
  EventSessionListBloc? eventSessionListBloc;

  @override
  void initState() {
    super.initState();
    eventSessionListBloc = EventSessionListBloc(widget.url);
  }

  Widget buildItem(BuildContext context, int index,
      EventSessionListData eventSessionListData) {
    IncludedAttributes? includedAttributes;
    var size = MediaQuery.of(context).size;
    if (eventSessionListData.trackSlots![index].included!.isNotEmpty) {
      includedAttributes =
          eventSessionListData.trackSlots![index].included![0].attributes!;
    }

    SessionAttributes sessionAttributes =
        eventSessionListData.trackSlots![index].data!.sessionAttributes!;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            height: size.height / 6,
            width: size.width,
            child: Row(
              children: <Widget>[
                Container(
                  width: size.width / 4,
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width / 5,
                      height: size.width / 4.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: includedAttributes != null
                                ? FadeInImage.assetNetwork(
                                    placeholder: "assets/nouserprofile.png",
                                    image: includedAttributes.avatar!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset("assets/nouserprofile.png"),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        sessionAttributes.sessionTitle ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        includedAttributes != null
                            ? includedAttributes.name!
                            : "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          includedAttributes != null
                              ? includedAttributes.designation ?? ""
                              : "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            timeStampToDuration(
                              sessionAttributes.startTime!,
                              sessionAttributes.endTime!,
                            ),
                            style: const TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            width: size.width / 40,
                          ),
                          Text(
                            timeStampToTime(sessionAttributes.startTime!),
                            style: const TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            width: size.width / 40,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: StreamBuilder<dynamic>(
        stream: eventSessionListBloc!.trackListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data!.status) {
              case Status.loading:
                return const FlareActor("assets/loader2.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: "Untitled");

              case Status.completed:
                return _eventSessionList(snapshot.data.apiResponseData);

              case Status.error:
                return const Center(child: Text("Data not found"));
            }
          }
          return Container();
        },
      ),
    );
  }

  Widget _eventSessionList(EventSessionListResponse eventSessionListResponse) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: eventSessionListResponse.data!.trackSlots!.length,
          itemBuilder: (context, index) {
            return buildItem(context, index, eventSessionListResponse.data!);
          }),
    );
  }

  timeStampToTime(String timeStamp) {
    if (kDebugMode) {
      print(timeStamp);
    }
    DateTime dateTime = DateTime.parse(timeStamp);
    Duration duration = const Duration(hours: 5, minutes: 30);

    var format = DateFormat('hh:mm a');
    return " ${format.format(dateTime.add(duration))}";
  }

  timeStampToDuration(String startTimeStamp, String endTimeStamp) {
    Duration dur =
        DateTime.parse(endTimeStamp).difference(DateTime.parse(startTimeStamp));
    return "${dur.inMinutes} minutes".toString();
  }
}

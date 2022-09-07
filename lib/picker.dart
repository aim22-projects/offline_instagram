/// instagram media picker
import 'dart:async';

import 'package:http/http.dart' as http;

class Picker {
  Uri fetchUrl(String id) {
    //return 'https://www.instagram.com/p/$id/?__a=1&__d=dis';
    return Uri.https('www.instagram.com', '/p/$id', {'__a': '1', '__d': 'dis'});
  }

  void reelParser() {}
  Future<http.StreamedResponse> downloader() async {
    List<int> bytes = [];

    http.StreamedResponse response =
        await http.Client().send(http.Request('', Uri.parse('')));
    int total = response.contentLength ?? 0;

    StreamController stream = StreamController<int>();

    response.stream.listen((value) {
      bytes.addAll(value);
      stream.sink.add(value.length / total);
    }).onData((data) {});

    return response;
  }
}

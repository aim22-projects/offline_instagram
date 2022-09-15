import 'package:flutter/material.dart';

class DownloadManagerProvider extends ChangeNotifier {
  // implement database first
  // first implement in memory download
  // then implement in background download
  // then implement save download in database

  void FetchPost() {}
  void AddDownload() {}
}

class DownloadManager {}

class DownloadItem {
  final String path;
  final String url;
  final int height;
  final int width;
  List<String> resources = [];

  DownloadItem(this.path, this.url, this.height, this.width);
}
/*
https://instagram.fpnq10-1.fna.fbcdn.net/v/t51.2885-15/306037478_1103657693689997_2453303973961457539_n.jpg?stp=dst-jpg_e35_p1080x1080&_nc_ht=instagram.fpnq10-1.fna.fbcdn.net&_nc_cat=105&_nc_ohc=_PMVMKT0yD8AX-v1idQ&edm=AABBvjUBAAAA&ccb=7-5&oh=00_AT-mcUjTsQSn-4D2ba-ST7dt07gCAKtZEFaF_PJ6yiPPRQ&oe=632A18CE&_nc_sid=83d603

parse file name from uri
I know this is old, but the solutions here seem rather verbose. Just an easily readable one-liner if you have a URL or URI:

String filename = new File(url.getPath()).getName();

Or if you have a String:

String filename = new File(new URL(url).getPath()).getName();


*/
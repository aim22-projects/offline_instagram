enum DownloadStatus { downloading, completed, canceled }

class DownloadTask {
  DownloadStatus status;
  final String name;
  final String link;
  final String path;
  int totalSize = 50;
  int downloadedSize = 10;

  DownloadTask({
    required this.name,
    required this.link,
    required this.path,
    this.totalSize = 0,
    this.downloadedSize = 0,
    this.status = DownloadStatus.downloading,
  });
}

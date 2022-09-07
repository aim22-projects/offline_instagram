enum DownloadStatus { pending, completed }

class DownloadTask {
  DownloadStatus status;
  final String name;
  final String link;
  final String path;

  DownloadTask({required this.name, required this.link, required this.path})
      : status = DownloadStatus.pending;
}

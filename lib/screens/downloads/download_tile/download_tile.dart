import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';

import '../download_task.dart';

class DownloadTile extends StatelessWidget {
  final DownloadTask task;
  const DownloadTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(task.name),
          subtitle: task.status == DownloadStatus.completed
              ? null
              : LinearProgressIndicator(
                  value: task.downloadedSize / task.totalSize,
                ),
          leading: CircleAvatar(
            child: Icon(
              task.status == DownloadStatus.completed
                  ? Icons.download_done_rounded
                  : task.status == DownloadStatus.downloading
                      ? Icons.download_rounded
                      : Icons.close,
            ),
          ),
          trailing: task.status == DownloadStatus.completed
              ? Text(filesize(task.totalSize, 0))
              : Text(
                  '${filesize(task.downloadedSize, 0)}/${filesize(task.totalSize, 0)}'),
        ),
      ],
    );
  }
}

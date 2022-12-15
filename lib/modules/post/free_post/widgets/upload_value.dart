import 'dart:io';

class UploadValue {
  String? uri;
  double? progress;
  File? oriFile;

  UploadValue({this.uri, this.oriFile, this.progress});

  UploadValue copyWith({File? oriFile, String? uri, double? progress}) {
    return UploadValue(
      oriFile: oriFile ?? this.oriFile,
      uri: uri ?? this.uri,
      progress: progress ?? this.progress,
    );
  }
}

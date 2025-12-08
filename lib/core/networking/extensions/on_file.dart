import 'dart:io';

import 'package:dio/dio.dart';

extension MultiPartFileConverter on File {
  Future<MultipartFile> toMultiPart() async {
    return await MultipartFile.fromFile(path);
  }
}

extension MultiPartFileListConverter on List<File> {
  Future<List<MultipartFile>> toMultiPart() async {
    final List<MultipartFile> multipartFiles = [];
    for (final file in this) {
      multipartFiles.add(await file.toMultiPart());
    }
    return multipartFiles;
  }
}

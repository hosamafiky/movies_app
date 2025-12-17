import 'dart:io';

import '../api_request.dart';
import 'on_file.dart';

extension OnApiRequest on ApiRequest {
  bool get hasBodyAndProgress => method != RequestMethod.get;
  bool get _canBeConvertedToFormData => body != null && body!.entries.isNotEmpty && hasBodyAndProgress;

  Future<void> prepareRequestData() async {
    if (_canBeConvertedToFormData) {
      body!.forEach((key, value) async {
        if (value is List<File> || value is File) {
          isFormData = true;
          switch (value) {
            case final File file:
              body![key] = await file.toMultiPart();
            default:
              body![key] = await (value as List<File>).toMultiPart();
          }
        }
      });
    }
  }
}

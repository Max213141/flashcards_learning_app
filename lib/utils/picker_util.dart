import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

class PickerUtil {
  Future<dynamic> pickJson() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['json'],
      withData: true,
    );
    if (result == null || result.files.isEmpty) return;

    final picked = result.files.single;
    String contents;
    if (picked.bytes != null) {
      contents = utf8.decode(picked.bytes!);
    } else if (picked.path != null) {
      contents = await File(picked.path!).readAsString();
    } else {
      throw const FormatException('No file data available');
    }

    final decoded = jsonDecode(contents);
    if (decoded is! List) {
      throw const FormatException('JSON must be a list of words');
    }

    return decoded;
  }
}

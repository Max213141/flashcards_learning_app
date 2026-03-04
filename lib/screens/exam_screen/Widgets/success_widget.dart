import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessWidget extends StatelessWidget {
  final double width;
  final double height;
  final BoxFit fit;

  const SuccessWidget({
    super.key,
    this.width = 150,
    this.height = 150,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/checkhappy.lottie',
      width: width,
      height: height,
      fit: fit,
      repeat: false,
      decoder: _decodeDotLottie,
    );
  }

  static Future<LottieComposition?> _decodeDotLottie(List<int> bytes) {
    return LottieComposition.decodeZip(
      bytes,
      filePicker: (files) {
        for (final file in files) {
          if (file.name.startsWith('animations/') &&
              file.name.endsWith('.json')) {
            return file;
          }
        }

        for (final file in files) {
          if (file.name.endsWith('.json') && file.name != 'manifest.json') {
            return file;
          }
        }

        for (final file in files) {
          if (file.name.endsWith('.json')) {
            return file;
          }
        }

        return null;
      },
    );
  }
}

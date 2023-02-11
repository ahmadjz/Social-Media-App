import 'dart:async';

import 'package:flutter/material.dart';

extension GetImageAspectRatio on Image {
  Future<double> getAspectRatio() async {
    final completer = Completer<double>();
    image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (imageInfo, synchronousCall) {
          final aspectRation = imageInfo.image.width / imageInfo.image.height;
          imageInfo.image.dispose();
          completer.complete(aspectRation);
        },
      ),
    );
    return completer.future;
  }
}

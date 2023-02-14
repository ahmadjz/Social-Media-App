// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/state/image_upload/models/image_with_aspect_ratio.dart';
import 'package:social_media_app/state/image_upload/models/thumbnail_request.dart';
import 'package:social_media_app/state/image_upload/providers/thumbnail_provider.dart';
import 'package:social_media_app/views/components/animations/loading_animation_view.dart';
import 'package:social_media_app/views/components/animations/small_error_animation_view.dart';

class FileThumbnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;
  const FileThumbnailView({
    super.key,
    required this.thumbnailRequest,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(
      thumbnailProvider(
        request: thumbnailRequest,
      ),
    );
    return thumbnail.when(
      data: (ImageWithAspectRatio imageWithAspectRatio) => AspectRatio(
        aspectRatio: imageWithAspectRatio.aspectRatio,
        child: imageWithAspectRatio.image,
      ),
      loading: () => const LoadingAnimationView(),
      error: (error, stackTrace) => const SmallErrorAnimationView(),
    );
  }
}

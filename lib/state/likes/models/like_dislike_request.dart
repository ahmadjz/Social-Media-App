import 'package:flutter/foundation.dart' show immutable;
import 'package:social_media_app/state/posts/typedefs/post_id.dart';
import 'package:social_media_app/state/posts/typedefs/user_id.dart';

@immutable
class LikeDislikeRequest {
  final PostId postId;
  final UserId likedBy;
  const LikeDislikeRequest({
    required this.postId,
    required this.likedBy,
  });
}

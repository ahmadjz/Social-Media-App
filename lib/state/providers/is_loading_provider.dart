import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/state/auth/providers/auth_state_provider.dart';
import 'package:social_media_app/state/comments/providers/delete_comment_provider.dart';
import 'package:social_media_app/state/comments/providers/send_comment_provider.dart';
import 'package:social_media_app/state/image_upload/providers/image_uploader_provider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  final isUploadingImage = ref.watch(imageUploaderProvider);
  final isSendingComment = ref.watch(sendCommentProvider);
  final isDeletingComment = ref.watch(deleteCommentProvider);
  return authState.isLoading ||
      isUploadingImage ||
      isSendingComment ||
      isDeletingComment;
});

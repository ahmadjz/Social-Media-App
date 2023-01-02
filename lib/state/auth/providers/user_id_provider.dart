import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/state/auth/providers/auth_state_provider.dart';
import 'package:social_media_app/state/posts/typedefs/user_id.dart';

final userIdProvider = Provider<UserId?>(
  (ref) {
    return ref.watch(authStateProvider).userId;
  },
);

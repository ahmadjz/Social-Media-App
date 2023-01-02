import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/state/auth/providers/auth_state_provider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);

  return authState.isLoading;
});

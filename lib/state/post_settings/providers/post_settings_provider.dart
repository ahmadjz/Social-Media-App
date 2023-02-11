import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/state/post_settings/models/post_setting.dart';
import 'package:social_media_app/state/post_settings/notifiers/post_settings_notifier.dart';

final postSettingProvider =
    StateNotifierProvider<PostSettingNotifier, Map<PostSetting, bool>>(
  (ref) => PostSettingNotifier(),
);

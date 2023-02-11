import 'dart:collection' show UnmodifiableMapView;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/state/post_settings/models/post_setting.dart';

class PostSettingNotifier extends StateNotifier<Map<PostSetting, bool>> {
  PostSettingNotifier()
      : super(
          UnmodifiableMapView(
            {
              for (final setting in PostSetting.values) setting: true,
            },
          ),
        );
  void setSettings(
    PostSetting postSetting,
    bool value,
  ) {
    final existingValue = state[postSetting];
    if (existingValue == null || existingValue == value) {
      return;
    }
    state = Map.unmodifiable(
      Map.from(state)..[postSetting] = value,
    );
  }
}

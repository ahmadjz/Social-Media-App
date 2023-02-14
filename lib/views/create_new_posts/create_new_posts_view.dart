// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/state/auth/providers/user_id_provider.dart';
import 'package:social_media_app/state/image_upload/models/file_type.dart';
import 'package:social_media_app/state/image_upload/models/thumbnail_request.dart';
import 'package:social_media_app/state/image_upload/providers/image_uploader_provider.dart';
import 'package:social_media_app/state/post_settings/models/post_setting.dart';
import 'package:social_media_app/state/post_settings/providers/post_settings_provider.dart';
import 'package:social_media_app/views/components/file_thumbnail_view.dart';
import 'package:social_media_app/views/constants/strings.dart';

class CreateNewPostView extends StatefulHookConsumerWidget {
  const CreateNewPostView({
    super.key,
    required this.fileToPost,
    required this.fileType,
  });
  final File fileToPost;
  final FileType fileType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateNewPostViewState();
}

class _CreateNewPostViewState extends ConsumerState<CreateNewPostView> {
  @override
  Widget build(BuildContext context) {
    final thumbnailRequest = ThumbnailRequest(
      file: widget.fileToPost,
      fileType: widget.fileType,
    );
    final postSettings = ref.watch(postSettingProvider);

    final postTextEditingController = useTextEditingController();
    final isPostButtonEnabled = useState(false);
    print("rerender");
    useEffect(() {
      void listener() {
        isPostButtonEnabled.value = postTextEditingController.text.isNotEmpty;
      }

      postTextEditingController.addListener(() {
        isPostButtonEnabled.value = postTextEditingController.text.isNotEmpty;
      });
      return () {
        postTextEditingController.removeListener(listener);
      };
    }, [postTextEditingController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.createNewPost,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: isPostButtonEnabled.value
                ? () async {
                    // get the user id first
                    final userId = ref.read(userIdProvider);
                    if (userId == null) {
                      return;
                    }
                    final message = postTextEditingController.text;
                    final isUploaded =
                        await ref.read(imageUploaderProvider.notifier).upload(
                              file: widget.fileToPost,
                              fileType: widget.fileType,
                              message: message,
                              postSettings: postSettings,
                              userId: userId,
                            );
                    if (isUploaded && mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                : null,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // thumbnail
            FileThumbnailView(
              thumbnailRequest: thumbnailRequest,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: Strings.pleaseWriteYourMessageHere,
                ),
                autofocus: true,
                maxLines: null,
                controller: postTextEditingController,
              ),
            ),
            ...PostSetting.values.map(
              (postSetting) => ListTile(
                title: Text(postSetting.title),
                subtitle: Text(postSetting.description),
                trailing: Switch(
                  value: postSettings[postSetting] ?? false,
                  onChanged: (isOn) {
                    ref.read(postSettingProvider.notifier).setSettings(
                          postSetting,
                          isOn,
                        );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

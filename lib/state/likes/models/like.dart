import 'dart:collection' show MapView;
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';

import '../../constants/firebase_field_name.dart';
import '../../posts/typedefs/post_id.dart';
import '../../posts/typedefs/user_id.dart';

@immutable
class Like extends MapView<String, dynamic> {
  Like({
    required PostId postId,
    required UserId likedBy,
  }) : super(
          {
            FirebaseFieldName.postId: postId,
            FirebaseFieldName.userId: likedBy,
            FirebaseFieldName.date: FieldValue.serverTimestamp(),
          },
        );
}

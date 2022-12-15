import 'package:flutter/material.dart';
import 'package:loviser/modules/post/free_post/widgets/upload_group_value.dart';

import 'image_upload_item.dart';

class UploadGroupStateController extends ValueNotifier<UploadGroupValue> {
  UploadGroupStateController()
      : super(const UploadGroupValue(<ImageUploadItem>[]));

  set state(UploadGroupValue state) {
    value = state;
  }
}

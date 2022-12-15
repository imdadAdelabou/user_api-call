import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loviser/modules/post/free_post/widgets/upload_controller.dart';

class ImageUploadItem {
  File? _asset;
  String? _name;
  Widget? _placeHolder;
  CancelToken? cancelToken; // for canceling upload request

  String id = "";
  Picture? picture;
  UploadController? controller;

  File? get asset => _asset;

  String? get assetName => _asset!.path;

  String? get name => _name;

  Widget? get placeHolder => _placeHolder;

  bool isUploading = false;
  String? _error;

  String get state {
    if (id != "" || picture != null) return "Done";
    if (!isUploading) return "init";

    return "Uploading";
  }

  setError(String err) {
    _error = err;
  }

  ImageUploadItem(File asset, String name, Image placeHolder) {
    _asset = asset;
    _name = name;
    _placeHolder = placeHolder;
    controller = UploadController();
    cancelToken = CancelToken();
  }
}

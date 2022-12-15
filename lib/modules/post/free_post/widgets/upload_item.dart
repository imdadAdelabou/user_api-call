import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loviser/modules/post/free_post/widgets/upload_controller.dart';

class UploadItem extends StatefulWidget {
  final UploadController controller;
  final Widget? placeholder;
  final VoidCallback onDelete;
  final bool showDeleteButton;

  const UploadItem({
    Key? key,
    required this.controller,
    this.placeholder,
    required this.onDelete,
    this.showDeleteButton = true,
  }) : super(key: key);

  @override
  _UploadItemState createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_didChangeUploadValue);
  }

  @override
  void didUpdateWidget(UploadItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(_didChangeUploadValue);
      widget.controller.addListener(_didChangeUploadValue);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_didChangeUploadValue);
    super.dispose();
  }

  void _didChangeUploadValue() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.controller.uri);
    print(widget.controller.oriFile);

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        widget.controller.uri != null
            ? CachedNetworkImage(
                imageUrl: widget.controller.uri!,
                fit: BoxFit.cover,
                placeholder: (_, __) => widget.controller.oriFile != null
                    ? Image.file(
                        widget.controller.oriFile!,
                        fit: BoxFit.cover,
                      )
                    : widget.placeholder ??
                        Container(
                          color: const Color(0xff4A4A4A),
                        ),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              )
            : widget.controller.oriFile != null
                ? Image.file(
                    widget.controller.oriFile!,
                    fit: BoxFit.cover,
                  )
                : widget.placeholder ??
                    Container(
                      color: const Color(0xff4A4A4A),
                    ),
        (widget.controller.uri != null || widget.controller.uri != '') &&
                (widget.controller.progress == 1.0 ||
                    widget.controller.progress == null)
            ? Container()
            : Container(
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
        if (showCircular())
          Center(
            child: Theme(
              data: ThemeData(accentColor: Theme.of(context).canvasColor),
              child: CircularProgressIndicator(
                value: widget.controller.progress,
              ),
            ),
          ),
        if (widget.showDeleteButton)
          Positioned(
            right: 3,
            top: 3,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 16,
                ),
              ),
            ),
          ),
      ],
    );
  }

  bool showCircular() {
    return widget.controller.progress != null &&
        widget.controller.progress != 1.0;
  }
}

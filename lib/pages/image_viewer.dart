import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/controller/my_controller.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;
  const ImageViewer(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<MyController>();
    ctrl.isImageViewerDismissed.value = true;
    return DismissiblePage(
      key: Key(imageUrl),
      isFullScreen: true,
      direction: DismissiblePageDismissDirection.vertical,
      onDismissed: () => Navigator.pop(context),
      onDragStart: () => ctrl.isImageViewerDismissed.value = false,
      onDragEnd: () => ctrl.isImageViewerDismissed.value = true,
      child: Hero(
        tag: '${imageUrl}as image tag',
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider(imageUrl),
          minScale: PhotoViewComputedScale.contained,
          backgroundDecoration: const BoxDecoration(color: Colors.transparent),
        ),
      ),
    );
  }
}

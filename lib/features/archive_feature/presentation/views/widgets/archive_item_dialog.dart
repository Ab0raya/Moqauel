import 'package:flutter/material.dart';
import 'dart:io' show File; // Import Dart's File class

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/widgets/glass_container.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';

class ArchiveItemDialog extends StatelessWidget {
  ArchiveItemDialog(
      {super.key, required this.title, required this.value, this.image});

  final String title;
  final String value;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: image == null
          ? getScreenHeight(context) * 0.3
          : getScreenHeight(context) * 0.6,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            title,
            style: Styles.textStyle22.copyWith(color: DarkMode.kPrimaryColor),
          ),
          30.sh,
          Text(
            value,
            style: Styles.textStyle37,
          ),
          if (image != null)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FullScreenImageViewer(imagePath: image!, title: title),
                  ),
                );
              },
              child: SizedBox(
                height: getScreenHeight(context) * 0.4,
                child: Image.file(
                  File(image!),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}





class FullScreenImageViewer extends StatelessWidget {
  final String imagePath;
  final String title;

  const FullScreenImageViewer({Key? key, required this.imagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () async {
              // Share the image file
              await Share.shareXFiles([XFile(imagePath)], text: "Check out this image!");
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.file(
            File(imagePath),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}




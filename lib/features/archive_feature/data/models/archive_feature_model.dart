import 'dart:typed_data';

class ArchiveItem {
  final String title;
  final String value;
   Uint8List? image;

  ArchiveItem({required this.title, required this.value , this.image});
}

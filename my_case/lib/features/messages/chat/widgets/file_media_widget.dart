import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:open_file/open_file.dart';

class FileMediaWidget extends StatelessWidget {
  final String? uri;
  final String? name;
  final num? size;
  const FileMediaWidget({
    super.key,
    this.uri,
    this.name,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        OpenFile.open("${uri}");
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(
                Icons.insert_drive_file,
                color: Colors.white,
              ),
              backgroundColor: CColors.white.withOpacity(0.2),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    name ?? "",
                    style: context.text16.copyWith(
                      color: CColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${size ?? 0} KB",
                  style: context.text14.copyWith(
                    color: CColors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

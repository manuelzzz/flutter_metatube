import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:metatube/app/utils/snackbar_utils.dart';

class HomeController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  bool fieldsNotEmpty = false;

  File? _selectedFile;
  String _selectedDirectory = '';

  static String _getTodayDate() =>
      DateFormat('yyyy-MM-dd').format(DateTime.now());

  void saveContent(BuildContext context) async {
    final title = titleController.text;
    final description = descriptionController.text;
    final tags = tagsController.text;

    final textContent =
        "Title:\n\n$title\n\nDescription:\n\n$description\n\nTags:\n\n$tags";

    try {
      if (_selectedFile != null) {
        await _selectedFile!.writeAsString(textContent);
      } else {
        final todayDate = _getTodayDate();

        String metadataDirPath = _selectedDirectory;

        if (metadataDirPath.isEmpty) {
          final directory = await FilePicker.platform.getDirectoryPath();
          _selectedDirectory = metadataDirPath = directory!;
        }

        final filePath = '$metadataDirPath/$todayDate - $title';
        final newFile = File(filePath);
        await newFile.writeAsString(textContent);
      }

      if (context.mounted) {
        SnackbarUtils.showSnackBar(
          context,
          Icons.check_circle,
          'File saved successfully',
        );
      }
    } catch (e) {
      if (context.mounted) {
        SnackbarUtils.showSnackBar(
          context,
          Icons.error,
          'File not saved',
        );
      }
    }
  }
}

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

  void loadFile(context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path!);
        _selectedFile = file;

        final fileContent = await file.readAsString();
        final lines = fileContent.split('\n\n');
        titleController.text = lines[1];
        descriptionController.text = lines[3];
        tagsController.text = lines[5];

        if (context.mounted) {
          SnackbarUtils.showSnackBar(
            context,
            Icons.upload_file,
            'File uploaded',
          );
        }
      } else {
        SnackbarUtils.showSnackBar(
          context,
          Icons.error_rounded,
          'No file selected',
        );
      }
    } catch (e) {
      if (context.mounted) {
        SnackbarUtils.showSnackBar(
          context,
          Icons.error,
          'File not uploaded',
        );
      }
    }
  }

  void newFile(BuildContext context) {
    _selectedFile = null;
    titleController.clear();
    descriptionController.clear();
    tagsController.clear();

    SnackbarUtils.showSnackBar(
      context,
      Icons.file_upload,
      'New file created',
    );
  }

  void newDirectory(BuildContext context) async {
    try {
      String? directory = await FilePicker.platform.getDirectoryPath();
      _selectedDirectory = directory!;
      _selectedFile = null;

      if (context.mounted) {
        SnackbarUtils.showSnackBar(
          context,
          Icons.folder,
          'New folder selected',
        );
      }
    } catch (e) {
      if (context.mounted) {
        SnackbarUtils.showSnackBar(
          context,
          Icons.error,
          'No folder selected',
        );
      }
    }
  }
}

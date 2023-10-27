import 'package:flutter/material.dart';
import 'package:metatube/app/ui/controllers/home_controller.dart';
import 'package:metatube/app/ui/widgets/metatube_elevated_button.dart';
import 'package:metatube/app/ui/widgets/metatube_icon_button.dart';
import 'package:metatube/app/ui/widgets/metatube_text_field.dart';
import 'package:metatube/app/utils/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    _addListeners();
    super.initState();
  }

  @override
  void dispose() {
    _removeListeners();
    super.dispose();
  }

  void _addListeners() {
    List<TextEditingController> controllers = [
      _homeController.titleController,
      _homeController.descriptionController,
      _homeController.tagsController,
    ];

    for (TextEditingController controller in controllers) {
      controller.addListener(_onFieldChanged);
    }
  }

  void _removeListeners() {
    List<TextEditingController> controllers = [
      _homeController.titleController,
      _homeController.descriptionController,
      _homeController.tagsController,
    ];

    for (TextEditingController controller in controllers) {
      controller.removeListener(_onFieldChanged);
    }
  }

  void _onFieldChanged() {
    setState(() {
      _homeController.fieldsNotEmpty =
          _homeController.titleController.text.isNotEmpty &&
              _homeController.descriptionController.text.isNotEmpty &&
              _homeController.tagsController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MetatubeElevatedButton(
                  onPressed: () {},
                  child: const Text('New File'),
                ),
                Row(
                  children: [
                    MetatubeIconButton(
                      icon: const Icon(Icons.file_upload),
                      onPressed: () {},
                    ),
                    const VerticalDivider(width: 8),
                    MetatubeIconButton(
                      icon: const Icon(Icons.folder),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 20),
            MetatubeTextField(
              maxLength: 100,
              maxLines: 3,
              hintText: 'Enter Video Title',
              controller: _homeController.titleController,
            ),
            const Divider(height: 40),
            MetatubeTextField(
              maxLength: 5000,
              maxLines: 5,
              hintText: 'Enter Video Description',
              controller: _homeController.descriptionController,
            ),
            const Divider(height: 40),
            MetatubeTextField(
              maxLength: 500,
              maxLines: 4,
              hintText: 'Enter Video Tags',
              controller: _homeController.tagsController,
            ),
            const Divider(height: 20),
            Row(
              children: [
                MetatubeElevatedButton(
                  onPressed: () {},
                  child: const Text('Save File'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

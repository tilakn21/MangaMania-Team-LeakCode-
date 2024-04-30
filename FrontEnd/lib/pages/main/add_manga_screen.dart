import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AddMangaScreen extends StatefulWidget {
  @override
  _AddMangaScreenState createState() => _AddMangaScreenState();
}

class _AddMangaScreenState extends State<AddMangaScreen> {
  File? _selectedFile;
  TextEditingController _titleController = TextEditingController();

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _saveManga() async {
    if (_selectedFile != null && _titleController.text.isNotEmpty) {
      final destinationFolderPath =
          (await getApplicationDocumentsDirectory()).path;
      final fileName = _selectedFile!.path.split('/').last;
      final destinationFilePath = '$destinationFolderPath/$fileName';

      await _selectedFile!.copy(destinationFilePath);

      // You can now save the manga data to your database or perform any other necessary operations
      print(
          'Manga added with file: $destinationFilePath and title: ${_titleController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Manga'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Select PDF File'),
            ),
            SizedBox(height: 20),
            if (_selectedFile != null)
              Text('Selected file: ${_selectedFile!.path}'),
            SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Enter Manga Title'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveManga,
              child: Text('Add Manga'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveNewManga() async {
    if (_selectedFile != null && _titleController.text.isNotEmpty) {
      final destinationFolderPath = '/home/shubhang/Desktop/MangaMania';
      final fileName = _selectedFile!.path.split('/').last;
      final destinationFilePath = '$destinationFolderPath/$fileName';

      await _selectedFile!.copy(destinationFilePath);

      print(
          'Manga added with file: $destinationFilePath and title: ${_titleController.text}');
    }
  }
}

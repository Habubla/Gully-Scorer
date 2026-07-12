import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import '../../domain/services/import_export_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Card(
                child: ListTile(
                   leading: const Icon(Icons.download),
                   title: const Text('Export Data Backup'),
                   subtitle: const Text('Save all matches and stats to a JSON file'),
                   onTap: () async {
                      try {
                         final file = await ImportExportService.exportDatabase(ref);
                         if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved to: ${file.path}. Opening...')));
                            await OpenFile.open(file.path);
                         }
                      } catch (e) {
                         if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Export failed: $e')));
                         }
                      }
                   },
                )
             ),
             const SizedBox(height: 16),
             Card(
                child: ListTile(
                   leading: const Icon(Icons.upload),
                   title: const Text('Import Data Backup'),
                   subtitle: const Text('Merge matches and stats from a JSON file'),
                   onTap: () async {
                      try {
                         FilePickerResult? result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['json'],
                         );
                         if (result != null && result.files.single.path != null) {
                            final file = File(result.files.single.path!);
                            if (await file.exists()) {
                               await ImportExportService.importDatabase(file, ref);
                               if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data imported successfully!')));
                               }
                            }
                         } else {
                            if (context.mounted) {
                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No file selected')));
                            }
                         }
                      } catch (e) {
                         if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Import failed: $e')));
                         }
                      }
                   },
                )
             )
           ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/themes.dart';
import '../../../core/widgets/widgets.dart';

class CvPage extends StatefulWidget {
  const CvPage({super.key});

  @override
  State<CvPage> createState() => _CvPageState();
}

class _CvPageState extends State<CvPage> {
  @override
  Widget build(BuildContext context) {
    File? _selectedFile;

    Future<void> _pickFile() async {
      var status = await Permission.storage.request();

      if (status.isGranted) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );

        if (result != null) {
          setState(() {
            _selectedFile = File(result.files.single.path!);
          });
        } else {
          print('Aucun fichier sélectionné.');
        }
      } else if (status.isDenied) {
        // La permission est refusée, affichez un dialogue ou un message
        print('Permission refusée. Veuillez accorder l\'accès pour continuer.');
      } else if (status.isPermanentlyDenied) {
        // La permission est définitivement refusée, proposez à l'utilisateur d'aller dans les paramètres
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Permission nécessaire'),
            content: Text(
              'AptioTalent a besoin de l\'accès au stockage pour fonctionner '
              'correctement. Veuillez accorder la permission dans '
              'les paramètres.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Annuler'),
              ),
              TextButton(
                onPressed: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
                child: Text('Ouvrir les paramètres'),
              ),
            ],
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Curriculum vitae / CV"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              Container(
                height: 20.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: appColor.withValues(alpha: .2),
                  borderRadius: BorderRadius.circular(3.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _pickFile,
                      icon: Icon(
                        Icons.file_upload_outlined,
                        color: appColor,
                        size: 60,
                      ),
                    ),
                    Text("Parcourir le fichier"),
                  ],
                ),
              ),
              if (_selectedFile != null)
                Text(
                  'Fichier sélectionné : ${_selectedFile!.path}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(4.w),
        child: SubmitButton(
          AppConstants.btnSave,
          onPressed: () async {},
        ),
      ),
    );
  }
}

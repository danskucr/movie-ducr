import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageImagePage extends StatefulWidget {
  const StorageImagePage({super.key});

  @override
  State<StorageImagePage> createState() => _StorageImagePageState();
}

  TextStyle styleText() {
    return const TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontFamily: 'Calibri',
    );
  }

class _StorageImagePageState extends State<StorageImagePage> {

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String? link;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    setState(() {
      pickedFile == result!.files.first;
    });
  }

  Future unploadFile() async {

    final path = "files/${pickedFile!.name}";
    final file = File(pickedFile!.path!);
    
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() => {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print(urlDownload);
    setState(() {
      link = urlDownload;
    });
    print(link);
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (pickedFile != null)
            Expanded(
              child: Container(
                child: Image.file(
                  File(pickedFile!.path!),
                  width: double.infinity,
                  fit: BoxFit.cover
                )
              )
            ),
          Text('Aqui se muestran las opciones para subir una imagen a Firebase en Storage.',
              style: styleText(),
          ),
          ElevatedButton(
            onPressed: selectFile,
            child: Text('Seleccionar Imagen')
          ),
          ElevatedButton(
            onPressed: unploadFile,
            child: Text('Subir Imagen')
          )
        ]
      ),
    );
  }
}
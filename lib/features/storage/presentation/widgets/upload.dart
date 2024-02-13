import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}
  TextStyle styleText() {
    return const TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontFamily: 'Calibri',
    );
  }
class _UploadState extends State<Upload> {
  PlatformFile? pickedFile;
  FilePickerResult? result;

  UploadTask? uploadTask;
  String? link;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(withReadStream: true, withData: true);
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
      print(pickedFile);
    });
  }


  Future uploadFile() async {
    final path = "files/${pickedFile!.name}";
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      link = urlDownload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (pickedFile != null)
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Image.file(
                  File(pickedFile!.path!),
                  width: double.infinity,
                  fit: BoxFit.cover
                )
              )
            ),
          const Divider(), 
          Text('Aqui se muestran las opciones para subir una imagen a Firebase en Storage.',
              style: styleText(),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: selectFile,
            child: const Text('Seleccionar Imagen')
          ),
          ElevatedButton(
            onPressed: uploadFile,
            child: const Text('Subir Imagen')
          ),
          const Divider(),
          if(link != null)
          Text('Solo es necesario dar clic en el Texto para poder copiar el link.',
              style: styleText(),
          ),
          if(link != null)
          TextButton(
            onPressed: () async {
              Clipboard.setData(ClipboardData(text: link!));
            },
            child: Text(link!)
          )
        ]
      );
  }
}
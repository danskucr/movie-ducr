import 'package:flutter/material.dart';
import 'package:movie_ducr/features/storage/presentation/widgets/upload.dart';

class StorageImagePage extends StatefulWidget {
  const StorageImagePage({super.key});

  @override
  State<StorageImagePage> createState() => _StorageImagePageState();
}

class _StorageImagePageState extends State<StorageImagePage> {


  @override
  Widget build(BuildContext context) {
    
    return const Padding(
      padding: EdgeInsets.all(25.0),
      child: Upload()
    );
  }
}
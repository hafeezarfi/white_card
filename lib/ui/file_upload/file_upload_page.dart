import 'dart:developer';
import 'dart:io';

import 'package:encrypt/encrypt.dart' as enc;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FileUploadPage extends StatelessWidget {
  const FileUploadPage(this.pageName, {Key? key}) : super(key: key);
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$pageName Form Files'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // User? user = FirebaseAuth.instance.currentUser;
            // final storageRef = FirebaseStorage.instance.ref();
            // log(storageRef.fullPath);
            // final userRef = storageRef.child(_encryptUserId(user!.uid));
            // log(userRef.fullPath);
            // final filesRef = userRef.child(pageName);
            // log(filesRef.fullPath);
            // final listOfFiles =await filesRef.list();
            // log(listOfFiles.items.first.name);
            //
            // final appDocDirectory = await getApplicationDocumentsDirectory();
            // final filepath = "${appDocDirectory.absolute}/${_encryptUserId(user.uid)}/$pageName}";
            // final file = File(filepath);
            //
            // final downloadTask = filesRef.writeToFile(file);
          },
          child: const Text('Download all files'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openBottomSheetOptions(1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _openBottomSheetOptions(int value) async {
    if (value == 0) {
      // openCamera();
    } else {
      User? user = FirebaseAuth.instance.currentUser;
      log(user!.uid);
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path!);
        final splitted = file.path.split("/");
        final storageRef = FirebaseStorage.instance.ref();

        final encrypted = _encryptUserId(user.uid);

        final userRef = storageRef.child(encrypted);

        final filesRef = userRef.child("$pageName/${splitted.last}");
        log(splitted.last);

        try {
          await filesRef.putFile(file);
        } on FirebaseException catch (e) {
          log(e.toString());
          // ...
        }
      } else {
        // User canceled the picker
      }
    }
  }

  // AES encryption
  String _encryptUserId(String uid) {
    final key = enc.Key.fromUtf8('my 32 length key................');
    final iv = enc.IV.fromLength(16);

    final encryptor = enc.Encrypter(enc.AES(key));

    final encrypted = encryptor.encrypt(uid, iv: iv);

    return encrypted.base64;
  }

  Stream<ListResult> listAllPaginated(Reference storageRef) async* {
    String? pageToken;
    do {
      final listResult = await storageRef.list(ListOptions(
        maxResults: 100,
        pageToken: pageToken,
      ));
      yield listResult;
      pageToken = listResult.nextPageToken;
    } while (pageToken != null);
  }
}

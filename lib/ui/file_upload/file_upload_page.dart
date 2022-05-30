import 'dart:developer';
import 'dart:io';

import 'package:encrypt/encrypt.dart' as enc;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:white_card/files/models/file_model.dart';

class FileUploadPage extends StatefulWidget {
  FileUploadPage(this.pageName, {Key? key}) : super(key: key);
  final String pageName;

  @override
  State<FileUploadPage> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  @override
  initState() {
    super.initState();
    setState(() {
      _getFiles();
    });
  }

  final List<FileModel> _items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.pageName} Form Files'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              log('${_items.length}');

              String linksStr = "";
              for (var item in _items) {
                final storageRef = FirebaseStorage.instance.ref();
                final fileRef = storageRef.child(item.fullPath);
                String url = await fileRef.getDownloadURL();
                linksStr += item.name + ':\t' + url + '\n\n';
              }
              log(linksStr);
              Share.share(linksStr);
            },
            icon: const Icon(Icons.share),
            tooltip: 'Share All Documents',
          ),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await _getFiles();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.blue, Colors.white]),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all()),
                        // margin: const EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 250,
                                child: Text(
                                  _items[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(

                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      final storageRef =
                                          FirebaseStorage.instance.ref();
                                      final fileRef = storageRef
                                          .child(_items[index].fullPath);
                                      String url =
                                          await fileRef.getDownloadURL();
                                      Share.share(url);
                                    },
                                    icon: const Icon(Icons.share),
                                    splashRadius: 27,
                                    splashColor: const Color(0xffdbb448),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      final storageRef =
                                          FirebaseStorage.instance.ref();
                                      final fileRef = storageRef
                                          .child(_items[index].fullPath);

                                      showAlertDialog(
                                        context,
                                        () {
                                          Navigator.pop(context);
                                        },
                                        () async {
                                          try {
                                            await fileRef.delete();
                                            Navigator.pop(context);
                                            setState(() {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          '${_items[index].name} deleted successfully')));
                                              _items.removeAt(index);
                                            });
                                          } catch (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Error deleting the file, refreshing the page'),
                                              duration: Duration(seconds: 4),
                                            ));
                                            _getFiles();
                                            Navigator.pop(context);
                                          }
                                        },
                                        _items[index].name,
                                      );
                                    },
                                    icon: const Icon(Icons.delete),
                                    splashRadius: 27,
                                    splashColor: const Color(0xffdbb448),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _items.length,
              ),
            ),
          ),
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

        final filesRef = userRef.child("${widget.pageName}/${splitted.last}");
        log(splitted.last);

        try {
          await filesRef.putFile(file);
          setState(() {
            _items.add(FileModel(filesRef.name, filesRef.fullPath));
          });
        } on FirebaseException catch (e) {
          log(e.toString());
          const SnackBar(
            content: Text('Unable to upload file'),
          );
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

  /// Pagination
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

  Reference _getReference() {
    final User? user = FirebaseAuth.instance.currentUser;
    final storageRef = FirebaseStorage.instance.ref();
    final path = _encryptUserId(user!.uid) + '/${widget.pageName}';
    final filesRef = storageRef.child(path);
    return filesRef;
  }

  _getFiles() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final storageRef = FirebaseStorage.instance.ref();
    final path = _encryptUserId(user!.uid) + '/${widget.pageName}';
    final filesRef = storageRef.child(path);
    if (_items.isNotEmpty) {
      _items.clear();
    }
    await filesRef.listAll().then(
          (value) => value.items.forEach(
            (element) {
              _items.add(
                FileModel(element.name, element.fullPath),
              );
              log('list len: ${_items.length}');
            },
          ),
        );
    setState(() {});
  }

  showAlertDialog(BuildContext context, VoidCallback? onCancel,
      VoidCallback? onYes, String filename) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: onCancel,
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: onYes,
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Are you sure you want to delete $filename}?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

import 'package:equatable/equatable.dart';

class FileModel extends Equatable {
  const FileModel(
    this.name,
    this.fullPath,
  );
  final String name;
  final String fullPath;

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        fullPath,
      ];
}

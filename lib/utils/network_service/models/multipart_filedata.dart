class MultipartFileDataModel {
  String filePath;
  String parameterName;

  MultipartFileDataModel({
    required this.filePath,
    required this.parameterName,
  });

  MultipartFileDataModel copyWith({
    String? filePath,
    String? parameterName,
  }) =>
      MultipartFileDataModel(
        filePath: filePath ?? this.filePath,
        parameterName: parameterName ?? this.parameterName,
      );

  factory MultipartFileDataModel.fromJson(Map<String, dynamic> json) =>
      MultipartFileDataModel(
        filePath: json["file_path"],
        parameterName: json["parameter_name"],
      );

  Map<String, dynamic> toJson() => {
        "file_path": filePath,
        "parameter_name": parameterName,
      };
}

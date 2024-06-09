class AudioModel {
  int id;
  String audioName;
  String audioFile;
  DateTime uploadDate;

  AudioModel({
    required this.id,
    required this.audioName,
    required this.audioFile,
    required this.uploadDate,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      id: json['id'],
      audioName: json['audio_name'],
      audioFile: json['audio_file'],
      uploadDate: DateTime.parse(json['upload_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'audio_name': audioName,
      'audio_file': audioFile,
      'upload_date': uploadDate.toIso8601String(),
    };
  }
}

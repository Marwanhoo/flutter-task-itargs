class QuranModel {
  final int id;
  final int chapterId;
  final double fileSize;
  final String format;
  final String audioUrl;

  QuranModel({
    required this.id,
    required this.chapterId,
    required this.fileSize,
    required this.format,
    required this.audioUrl,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    final dynamic audioData = json['audio_file'];
    return QuranModel(
      id: audioData["id"],
      chapterId: audioData["chapter_id"],
      fileSize: audioData["file_size"].toDouble(),
      format: audioData["format"],
      audioUrl: audioData['audio_url'],
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../quran_model/quran_model.dart';

class QuranApiService {
  Future<QuranModel> fetchAudio() async {
    final response = await http
        .get(Uri.parse('https://api.quran.com/api/v4/chapter_recitations/1/1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return QuranModel.fromJson(dataJson);
    } else {
      throw Exception('Failed to load audio');
    }
  }
}

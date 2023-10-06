import '../api/api_services.dart';
import '../quran_model/quran_model.dart';

class AudioRepository {
  final QuranApiService apiService = QuranApiService();

  Future<QuranModel> fetchData() async {
      return await apiService.fetchAudio();
  }
}

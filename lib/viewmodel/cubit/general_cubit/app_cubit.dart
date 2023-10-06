import 'dart:async';
import 'dart:io';
import 'package:flutter_task/components/components.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/models/quran_model/quran_model.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../models/repository/audio_repo.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AudioInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  final List<bool> likedItems = [false, false, false];

  void toggleLike(int index) {
    likedItems[index] = !likedItems[index];
    emit(ItemLikedState(List.from(likedItems)));
  }

  final AudioPlayer audioPlayer = AudioPlayer();

  final AudioRepository repository = AudioRepository();
  bool isLoading = false;
  bool isPlaying = false;

  late QuranModel model;

  Future<QuranModel> getData() async {
    try {
      final fetchData = await repository.fetchData();
      model = fetchData;
      emit(AudioLoadedDataState());
    } catch (e) {
      emit(AudioErrorLoadedDataState());
    }
    return model;
  }

  Future<void> fetchAndPlayAudio() async {
    try {
      isLoading = true;
      emit(AudioLoadingState());
      QuranModel audio = await repository.fetchData();
      await audioPlayer.play(UrlSource(audio.audioUrl));
      isLoading = false;
      isPlaying = true;
      emit(AudioPlayingState());
    } catch (e) {
      emit(AudioPausedState());
    }
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
    isPlaying = false;
    emit(AudioPausedState());
  }

  void downloadAudioHttp(dynamic context) async {
    int time = DateTime.now().millisecondsSinceEpoch;
    String path = "/storage/emulated/0/Download/song-$time.mp3";
    File file = File(path);
    final audio = await repository.fetchData();
    try {
      PermissionStatus status = await Permission.storage.request();
      if (status.isGranted) {
        var response = await http.get(Uri.parse(audio.audioUrl));
        await file.writeAsBytes(response.bodyBytes);
        showSnackBar(context,
            translateText(context: context, textJson: "download_audio"));
      } else {
        showSnackBar(context, "Permission denied");
      }
    } catch (e) {
      showSnackBar(context, "An error occurred while downloading.");
    }
  }

  void showSnackBar(BuildContext context, String message) {
    showCustomSnackBar(context: context, text: message);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import '../components/components.dart';
import '../viewmodel/cubit/general_cubit/app_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<bool> likedItems = [false, false, false];
    final List<String> sampleText = List.generate(
      3,
      (index) =>
          translateText(context: context, textJson: "sample_text${index + 1}"),
    );
    final double screenHeight = MediaQuery.of(context).size.height;
    AppCubit cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (BuildContext context, AppStates state) {
        if (state is AudioLoadingState) cubit.isLoading = true;
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 8, vertical: screenHeight / 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildBoldText(
                  text: translateText(context: context, textJson: 'top_likes')),
              standardDivider,
              SizedBox(
                height: screenHeight / 3,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    if (state is ItemLikedState) likedItems = state.likedItems;
                    String message =
                        getLikeDislikeMessage(likedItems, index, context);
                    return ListTile(
                      title: Text(sampleText[index]),
                      trailing: IconButton(
                        onPressed: () {
                          cubit.toggleLike(index);
                          showToastMessage(message);
                        },
                        icon: Icon(
                          likedItems[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      indentedDivider,
                  itemCount: 3,
                ),
              ),
              buildBoldText(
                  text: translateText(
                      context: context, textJson: "listen_audios")),
              standardDivider,
              ListTile(
                leading: CircleAvatar(
                  child: IconButton(
                    onPressed: () async {
                      if (state is AudioPlayingState) {
                        cubit.pauseAudio();
                      } else if (state is AudioPausedState ||
                          state is AudioInitialState) {
                        cubit.fetchAndPlayAudio();
                      }
                    },
                    icon: state is AudioLoadingState
                        ? const CircularProgressIndicator()
                        : Icon(
                            cubit.isPlaying
                                ? Icons.pause_circle
                                : Icons.play_circle,
                          ),
                  ),
                ),
                title: Text(
                  state is AudioPlayingState
                      ? translateText(context: context, textJson: "pause_audio")
                      : translateText(context: context, textJson: "play_audio"),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        cubit.downloadAudioHttp(context);
                      },
                      icon: const Icon(Icons.download),
                    ),
                    LikeButton(
                      onTap: (isLiked) {
                        isLiked
                            ? null
                            : showToastMessage(translateText(
                                context: context, textJson: "love_audio"));
                        return Future.value(!isLiked);
                      },
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
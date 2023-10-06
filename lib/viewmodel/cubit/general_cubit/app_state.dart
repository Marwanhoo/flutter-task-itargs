part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AudioInitialState extends AppStates {}
class AudioLoadedDataState extends AppStates {}
class AudioErrorLoadedDataState extends AppStates {}

class ItemLikedState extends AppStates {
  final List<bool> likedItems;

  ItemLikedState(this.likedItems);
}

class AudioPlayingState extends AppStates {}

class AudioLoadingState extends AppStates {}

class AudioPausedState extends AppStates {}


import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

final _playlist = ConcatenatingAudioSource(children: [
  AudioSource.uri(
    Uri.parse("asset:///assets/audio/scifri20181123-episode.mp3"),
    tag: MediaItem(
      id: '1',
      album: "Science Friday",
      title: "A Salute To Head-Scratching Science",
      artUri: Uri.parse("https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
    ),
  ),
  AudioSource.uri(
    Uri.parse("asset:///assets/audio/scifri201711241.mp3"),
    tag: MediaItem(
      id: '2',
      album: "Science Friday",
      title: "From Cat Rheology To Operatic Incompetence",
      artUri: Uri.parse("https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
    ),
  ),
  AudioSource.uri(
    Uri.parse("asset:///assets/audio/nature.mp3"),
    tag: MediaItem(
      id: '3',
      album: "Public Domain",
      title: "Nature Sounds",
      artUri: Uri.parse("https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
    ),
  ),
]);

class AudioPlayerManager {
  final player = AudioPlayer();
  Stream<DurationState>? durationState;

  void init() {
    durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
      player.positionStream,
      player.playbackEventStream,
      (position, playbackEvent) => DurationState(
        progress: position,
        buffered: playbackEvent.bufferedPosition,
        total: playbackEvent.duration,
      ),
    );

    player.setAudioSource(_playlist);
  }

  void dispose() {
    player.dispose();
  }
}

class DurationState {
  const DurationState({
    required this.progress,
    required this.buffered,
    this.total,
  });

  final Duration progress;
  final Duration buffered;
  final Duration? total;
}

class Audios extends StatefulWidget {
  const Audios({super.key});

  @override
  State<Audios> createState() => _AudiosState();
}

class _AudiosState extends State<Audios> with AutomaticKeepAliveClientMixin {
  late AudioPlayerManager audioPlayerManager;

  @override
  bool wantKeepAlive = true;

  @override
  void initState() {
    super.initState();
    audioPlayerManager = AudioPlayerManager();
    audioPlayerManager.init();
  }

  @override
  void dispose() {
    audioPlayerManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    //final ThemeData theme = Theme.of(context);
    audioPlayerManager.player.play();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<DurationState>(
                stream: audioPlayerManager.durationState,
                builder: (context, snapshot) {
                  final durationState = snapshot.data;
                  final progress = durationState?.progress ?? Duration.zero;
                  final buffered = durationState?.buffered ?? Duration.zero;
                  final total = durationState?.total ?? Duration.zero;
                  return ProgressBar(
                    progress: progress,
                    buffered: buffered,
                    total: total,
                    onSeek: audioPlayerManager.player.seek,
                    //baseBarColor: Colors.black,
                    onDragUpdate: (details) {
                      //debugPrint('${details.timeStamp}, ${details.localPosition}');
                    },
                  );
                },
              ),

              StreamBuilder<PlayerState>(
                stream: audioPlayerManager.player.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final processingState = playerState?.processingState;
                  final playing = playerState?.playing;
                  if (processingState == ProcessingState.loading ||
                      processingState == ProcessingState.buffering) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 32.0,
                      height: 32.0,
                      child: const CircularProgressIndicator(),
                    );
                  } else if (playing != true) {
                    return IconButton(
                      icon: const Icon(Icons.play_arrow),
                      iconSize: 32.0,
                      onPressed: audioPlayerManager.player.play,
                    );
                  } else if (processingState != ProcessingState.completed) {
                    return IconButton(
                      icon: const Icon(Icons.pause),
                      iconSize: 32.0,
                      onPressed: audioPlayerManager.player.pause,
                    );
                  } else {
                    return IconButton(
                      icon: const Icon(Icons.replay),
                      iconSize: 32.0,
                      onPressed: () =>
                          audioPlayerManager.player.seek(Duration.zero),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}

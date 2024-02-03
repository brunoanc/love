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
  bool startedPlay = false;

  void init() {
    durationState = Rx.combineLatest4<Duration, PlaybackEvent, int?, bool, DurationState>(
      player.positionStream.asBroadcastStream(),
      player.playbackEventStream.asBroadcastStream(),
      player.currentIndexStream.asBroadcastStream(),
      player.playingStream.asBroadcastStream(),
      (position, playbackEvent, currentIndex, playing) => DurationState(
        progress: position,
        total: playbackEvent.duration,
        index: currentIndex,
        playing: playing,
      ),
    ).asBroadcastStream();

    player.setAudioSource(_playlist);
  }

  void dispose() {
    player.dispose();
  }
}

class DurationState {
  const DurationState({
    required this.progress,
    this.total,
    this.index,
    required this.playing,
  });

  final Duration progress;
  final Duration? total;
  final int? index;
  final bool playing;
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
    //audioPlayerManager.player.play();

    return Scaffold(
      body: ListView(
        children: [
          for (var i = 0; i < (audioPlayerManager.player.sequence?.length ?? 0); i++)
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StreamBuilder(
                      stream: audioPlayerManager.durationState,
                      builder: (context, snapshot) {
                        final durationState = snapshot.data;
                        final index = durationState?.index;
                        final playing = durationState?.playing;
                        final progress = durationState?.progress ?? Duration.zero;
                        final total = durationState?.total ?? Duration.zero;

                        if (index == i && playing == true && progress < total) {
                          return IconButton(
                            icon: const Icon(Icons.pause, size: 30),
                            onPressed: () async => await audioPlayerManager.player.pause(),
                          );
                        }
                        else {
                          return IconButton(
                            icon: const Icon(Icons.play_arrow, size: 30),
                            onPressed: () {
                              if (!audioPlayerManager.startedPlay) {
                                setState(() {
                                  audioPlayerManager.startedPlay = true;
                                });
                              }

                              audioPlayerManager.player.seek(Duration.zero, index: i);
                              audioPlayerManager.player.play();
                            },
                          );
                        }
                      }
                    ),

                    const SizedBox(width: 10),
                
                    Expanded(
                      child: SliderTheme(
                        data: const SliderThemeData(
                          trackShape: CustomSliderTrackShape(),
                          thumbShape: CustomSliderThumbShape(),
                          overlayShape: CustomSliderOverlayShape(),
                        ),
                        child: StreamBuilder<DurationState>(
                          stream: audioPlayerManager.durationState,
                          builder: (context, snapshot) {
                            final durationState = snapshot.data;
                            double progress = durationState?.progress.inMilliseconds.toDouble() ?? 0;
                            final total = durationState?.total?.inMilliseconds.toDouble() ?? 0;
                            final index = durationState?.index;
                            if (progress > total) {
                              progress = total;
                            }

                            return Slider(
                              value: index == i ? progress : 0,
                              min: 0,
                              max: index == i ? total : 0,
                              onChanged: (index == i) && audioPlayerManager.startedPlay ? (value) async {
                                final position = Duration(milliseconds: value.toInt());
                                await audioPlayerManager.player.seek(position);
                              } : null,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  const CustomSliderTrackShape();
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class CustomSliderThumbShape extends RoundSliderThumbShape {
  const CustomSliderThumbShape({super.enabledThumbRadius = 10.0});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(context,
        center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}

class CustomSliderOverlayShape extends RoundSliderOverlayShape {
  final double thumbRadius;
  const CustomSliderOverlayShape({this.thumbRadius = 10.0});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(
        context, center.translate(-(value - 0.5) / 0.5 * thumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}

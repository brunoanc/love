import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

final _playlist = ConcatenatingAudioSource(children: [
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/1.mp3'),
    tag: MediaItem(
      id: '1',
      album: 'Audios <3',
      title: 'Audio #1',
      artUri: Uri.parse('https://www.colorhexa.com/9575cd.png'),
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/2.mp3'),
    tag: MediaItem(
      id: '2',
      album: 'Audios <3',
      title: 'Audio #2',
      artUri: Uri.parse('https://www.colorhexa.com/9575cd.png'),
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/3.mp3'),
    tag: MediaItem(
      id: '3',
      album: 'Audios <3',
      title: 'Audio #3',
      artUri: Uri.parse('https://www.colorhexa.com/9575cd.png'),
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/4.mp3'),
    tag: MediaItem(
      id: '4',
      album: 'Audios <3',
      title: 'Audio #4',
      artUri: Uri.parse('https://www.colorhexa.com/9575cd.png'),
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/5.mp3'),
    tag: MediaItem(
      id: '5',
      album: 'Audios <3',
      title: 'Audio #5',
      artUri: Uri.parse('https://www.colorhexa.com/9575cd.png'),
    ),
  ),
]);

class Audios extends StatefulWidget {
  const Audios({super.key});

  @override
  State<Audios> createState() => _AudiosState();
}

class _AudiosState extends State<Audios> {
  late AudioPlayerManager audioPlayerManager;

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
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            for (var i = 0; i < (audioPlayerManager.player.sequence?.length ?? 0); i++)
              StreamBuilder<DurationState>(
                stream: audioPlayerManager.durationState,
                builder: (context, snapshot) {
                  final durationState = snapshot.data;
                  final selected = (i == durationState?.index && audioPlayerManager.startedPlay);
                  var progress = durationState?.progress ?? Duration.zero;
                  final total = durationState?.total ?? Duration.zero;
                  final playing = durationState?.playing ?? false;
                  if (progress > total) {
                    progress = total;
                  }

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                    child: Card(
                      color: theme.colorScheme.surfaceContainerHighest,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: selected ? Colors.deepPurple.shade400 : Colors.transparent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row( 
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PlayPauseButton(index: i, audioPlayerManager: audioPlayerManager, progress: progress, total: total, playing: playing, selected: selected),

                            const SizedBox(width: 10),

                            Expanded(
                              child: SeekBar(index: i, audioPlayerManager: audioPlayerManager, progress: progress, total: total, selected: selected),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
          ],
        ),
      ),
    );
  }
}

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({
    super.key,
    required this.index,
    required this.audioPlayerManager,
    required this.progress,
    required this.total,
    required this.playing,
    required this.selected,
  });

  final int index;
  final AudioPlayerManager audioPlayerManager;
  final Duration progress;
  final Duration total;
  final bool playing;
  final bool selected;

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return widget.selected && widget.playing && widget.progress != widget.total
    ?  IconButton(
      icon: const Icon(Icons.pause, size: 30, color: Colors.white),
      onPressed: () async => await widget.audioPlayerManager.player.pause(),
    )
    : IconButton(
      icon: const Icon(Icons.play_arrow, size: 30, color: Colors.white),
      onPressed: () {
        if (!widget.audioPlayerManager.startedPlay) {
          setState(() {
            widget.audioPlayerManager.startedPlay = true;
          });
        }

        if (!widget.selected) {
          widget.audioPlayerManager.player.seek(Duration.zero, index: widget.index);
        }
        else if (widget.progress == widget.total) {
          widget.audioPlayerManager.player.seek(Duration.zero);
        }
        widget.audioPlayerManager.player.play();
      },
    );
  }
}

class SeekBar extends StatelessWidget {
  const SeekBar({
    super.key,
    required this.index,
    required this.audioPlayerManager,
    required this.progress,
    required this.total,
    required this.selected,
  });

  final int index;
  final AudioPlayerManager audioPlayerManager;
  final Duration progress;
  final Duration total;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackShape: const CustomSliderTrackShape(),
        thumbShape: const CustomSliderThumbShape(),
        overlayShape: const CustomSliderOverlayShape(),
        activeTrackColor: Colors.deepPurple.shade400,
        inactiveTrackColor: Colors.deepPurple.shade400.withAlpha(0x3d),
        thumbColor: Colors.white,
      ),
      child: Slider(
        value: selected ? progress.inMilliseconds.toDouble() : 0,
        min: 0,
        max: selected ? total.inMilliseconds.toDouble() : 0,
        onChanged: selected ? (value) async {
          final position = Duration(milliseconds: value.toInt());
          await audioPlayerManager.player.seek(position);
        } : null,
      ),
    );
  }
}

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

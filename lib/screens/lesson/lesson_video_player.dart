import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonVideoPlayer extends StatefulWidget {
  final String url;
  const LessonVideoPlayer({super.key, required this.url});

  @override
  LessonVideoPlayerState createState() => LessonVideoPlayerState();
}

class LessonVideoPlayerState extends State<LessonVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

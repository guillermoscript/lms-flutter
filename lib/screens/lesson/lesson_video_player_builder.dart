import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonVideoPlayerBuilder extends StatefulWidget {
  final String url;
  final Function(BuildContext, Widget player) builder;

  const LessonVideoPlayerBuilder({
    super.key,
    required this.url,
    required this.builder,
  });

  @override
  LessonVideoPlayerBuilderState createState() =>
      LessonVideoPlayerBuilderState();
}

class LessonVideoPlayerBuilderState extends State<LessonVideoPlayerBuilder> {
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
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) => widget.builder(context, player),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

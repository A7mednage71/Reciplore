import 'package:flutter/material.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoScreen extends StatefulWidget {
  const YouTubeVideoScreen({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
  @override
  // ignore: library_private_types_in_public_api
  _YouTubeVideoScreenState createState() => _YouTubeVideoScreenState();
}

class _YouTubeVideoScreenState extends State<YouTubeVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.recipeModel.videoLink == null) {
      ShowToast.showFailureToast("Video is not available");
      context.pop();
    }
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.recipeModel.videoLink!)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        showLiveFullscreenButton: false,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "${widget.recipeModel.name} Video",
          style: AppStyles.mediumBoldText.copyWith(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          bottomActions: [
            CurrentPosition(
              controller: _controller,
            ),
            ProgressBar(
              isExpanded: true,
              controller: _controller,
            ),
            RemainingDuration(
              controller: _controller,
            ),
            const Badge(
              child: Text(
                " Reciplore",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        builder: (context, player) {
          return Center(child: player);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_logo.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WhatIsMyCaseScreen extends StatefulWidget {
  const WhatIsMyCaseScreen({super.key});

  @override
  State<WhatIsMyCaseScreen> createState() => _WhatIsMyCaseScreenState();
}

class _WhatIsMyCaseScreenState extends State<WhatIsMyCaseScreen> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'RlG7ZJb5OXo',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      appBar: const CAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CLogo(
              logoType: LogoType.withoutText,
              size: 120,
            ),
            const SizedBox(height: 24),
            Card(
              color: CColors.white,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: double.infinity),
                    Text(
                      "What is my case?",
                      style: context.text16Bold,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "UNHCR",
                      style: context.text16,
                    ),
                    const SizedBox(height: 16),
                    YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: CColors.primaryColor,
                        progressColors: const ProgressBarColors(
                          playedColor: CColors.primaryColor,
                          handleColor: CColors.white,
                        ),
                        bottomActions: [
                          CurrentPosition(),
                          ProgressBar(isExpanded: true),
                          RemainingDuration(),
                          FullScreenButton()
                        ],
                        onReady: () {
                          // _controller.addListener(listener);
                        },
                      ),
                      builder: (context, player) {
                        return player;
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "“My Case” is a platform that enables you to access UNHCR services through your mobile device. ",
                      style: context.text14,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CButton(
                          text: "Get Started",
                          horizontalPadding: 20,
                          verticalPadding: 10,
                          onTap: () {
                            GoRouter.of(context).push(NavigationEnums.signUpScreen.routeName);
                          },
                          color: CColors.white,
                          textColor: CColors.primaryColor,
                          borderColor: CColors.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        CButton(
                          text: "Learn More",
                          horizontalPadding: 20,
                          verticalPadding: 10,
                          onTap: () {
                            launchUrl(Uri.parse("https://www.unhcr.org/"));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

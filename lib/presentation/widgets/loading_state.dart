import 'package:flutter/material.dart';

enum LoadingIndicator { none, circular }

class LoadingState extends StatelessWidget {
  final bool inProgress;
  final LoadingIndicator loadingIndicator;
  final Widget child;

  const LoadingState({
    super.key,
    required this.inProgress,
    required this.loadingIndicator,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(ignoring: inProgress, child: child),
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: switch (inProgress) {
                true => ColorScheme.of(context).surface.withAlpha(100),
                false => ColorScheme.of(context).surface.withAlpha(0),
              },
            ),
          ),
        ),
        if (inProgress && loadingIndicator == LoadingIndicator.circular)
          const Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(key: Key('progress_indicator')),
            ),
          ),
      ],
    );
  }
}

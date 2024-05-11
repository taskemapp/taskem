import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({
    required this.url,
    required this.token,
    this.onBackgroundImageError,
    this.borderRadius,
    this.errorWidget,
    this.radius,
    super.key,
  });

  final double? radius;
  final String url;
  final String token;
  final double? borderRadius;
  final Widget? errorWidget;
  final void Function(Object e, StackTrace? st)? onBackgroundImageError;

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> with PlatformCheck {
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      onBackgroundImageError: (exception, stackTrace) {
        widget.onBackgroundImageError?.call(exception, stackTrace);
        setState(() {
          _isError = true;
        });
      },
      backgroundImage: CachedNetworkImageProvider(
        widget.url,
        headers: {
          'authorization': widget.token,
        },
      ),
      foregroundImage: CachedNetworkImageProvider(
        widget.url,
        headers: {
          'authorization': widget.token,
        },
      ),
      child: Icon(
        isCupertino ? CupertinoIcons.person : Icons.person,
      ),
    );
  }
}

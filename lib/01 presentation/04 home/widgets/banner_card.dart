import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

import 'package:verifyd_store/01%20presentation/04%20home/widgets/banner_dialog.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
    required this.imageUrl,
    required this.info,
  }) : super(key: key);
  final String imageUrl;
  final String info;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        HapticFeedback.lightImpact();
        await showModal<bool>(
          context: context,
          configuration: const FadeScaleTransitionConfiguration(
              barrierDismissible: true, barrierColor: Colors.black87),
          useRootNavigator: false,
          builder: (context) => BannerDialog(
            imageUrl: imageUrl,
            info: info,
            onClose: () => Navigator.of(context).pop(true),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: fydPwhite, blurStyle: BlurStyle.inner)
            ],
            color: fydPblack,
          ),
          height: 140.h,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const SpinKitWave(
              size: 20,
              color: fydBblue,
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.image_not_supported_outlined,
              color: fydPgrey,
              size: 40.h,
            ),
          ),
        ),
      ),
    );
  }
}

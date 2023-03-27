import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

class BannerDialog extends StatelessWidget {
  const BannerDialog({
    super.key,
    required this.imageUrl,
    required this.info,
    required this.onClose,
  });
  final String imageUrl;
  final String info;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 280.h, maxWidth: 350.w),
        child: SizedBox(
            width: 350.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //! close Btn
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        onClose();
                      },
                      padding: const EdgeInsets.only(bottom: 10),
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: fydPwhite,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                //! Banner-Image
                SizedBox(
                  height: 160.h,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => const SpinKitWave(
                        size: 20,
                        color: fydPgrey,
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.image_not_supported_outlined,
                        color: fydPgrey,
                        size: 70.h,
                      ),
                    ),
                  ),
                ),
                //! Banner-Info
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 0.h, top: 20.h, left: 5.w, right: 5.w),
                  child: FydText.b4custom(
                    text: info,
                    color: fydPwhite,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

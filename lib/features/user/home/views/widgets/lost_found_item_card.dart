import 'package:fien/core/helper/format_time_diffrence.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/home/models/lost_found_item_model.dart';
import 'package:fien/features/user/home/views/widgets/lost_found_item_date.dart';
import 'package:fien/features/user/home/views/widgets/lost_found_item_location.dart';
import 'package:fien/features/user/home/views/widgets/lost_found_item_status.dart';
import 'package:fien/features/user/home/views/widgets/lost_founf_item_title_and_type.dart';
import 'package:fien/features/user/home/views/widgets/network_image_with_ssls.dart';
import 'package:flutter/material.dart';

class LostFoundItemCard extends StatelessWidget {
  const LostFoundItemCard({
    super.key,
    required this.lostFoundItemModel,
    this.onTap,
  });

  final LostFoundItemModel lostFoundItemModel;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.height * 0.17,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: NetworkImageWithSSL(
                      imageUrl: lostFoundItemModel.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.height * 0.012),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width * 0.013,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LostFoundItemTitleAndType(
                        title: lostFoundItemModel.title,
                        type: lostFoundItemModel.itemType.name,
                      ),
                      SizedBox(height: SizeConfig.height * 0.007),
                      LostFoundItemLocation(
                        location: lostFoundItemModel.locationDescription,
                      ),
                      SizedBox(height: SizeConfig.height * 0.005),
                      LostFoundItemDate(date: lostFoundItemModel.dateTime),
                      SizedBox(height: SizeConfig.height * 0.008),
                      Text(
                        lostFoundItemModel.comments == ''
                            ? 'No comments'
                            : lostFoundItemModel.comments,
                        style: AppTextStyles.title16Black,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: SizeConfig.height * 0.005),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            formatTimeDifference(lostFoundItemModel.createdAt),
                            style: AppTextStyles.title14Grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          LostFoundItemStatus(status: lostFoundItemModel.status),
        ],
      ),
    );
  }
}

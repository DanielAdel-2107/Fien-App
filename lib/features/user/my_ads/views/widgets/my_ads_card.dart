import 'package:fien/core/helper/format_time_diffrence.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/home/models/lost_found_item_model.dart';
import 'package:fien/features/user/home/views/widgets/lost_found_item_date.dart';
import 'package:fien/features/user/home/views/widgets/lost_found_item_location.dart';
import 'package:fien/features/user/home/views/widgets/lost_founf_item_title_and_type.dart';
import 'package:fien/features/user/home/views/widgets/network_image_with_ssls.dart';
import 'package:flutter/material.dart';

class MyAdsCard extends StatelessWidget {
  const MyAdsCard({super.key, required this.lostFoundItemModel});
  final LostFoundItemModel lostFoundItemModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.width * 0.6,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.height * 0.01,
                horizontal: SizeConfig.width * 0.01,
              ),
              child: Column(
                children: [
                  LostFoundItemTitleAndType(
                    title: lostFoundItemModel.title,
                    type: lostFoundItemModel.itemType.name,
                  ),
                  LostFoundItemLocation(
                    location: lostFoundItemModel.locationDescription,
                  ),
                  LostFoundItemDate(date: DateTime.now()),
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
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppColors.kPrimaryColor),
              child: NetworkImageWithSSL(
                imageUrl: lostFoundItemModel.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

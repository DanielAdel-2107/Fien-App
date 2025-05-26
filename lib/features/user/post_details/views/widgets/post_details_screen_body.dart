import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/cache/cache_helper.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/helper/format_time_diffrence.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/chat/models/chat_model.dart';
import 'package:fien/features/user/home/models/lost_found_item_model.dart';
import 'package:fien/features/user/post_details/views/widgets/finder_details.dart';
import 'package:fien/features/user/post_details/views/widgets/lost_found_item_date_and_title.dart';
import 'package:fien/features/user/post_details/views/widgets/lost_found_item_image.dart';
import 'package:fien/features/user/post_details/views/widgets/lost_found_item_location_and_date.dart';
import 'package:fien/features/user/post_details/views/widgets/lost_found_item_location_on_map.dart';
import 'package:fien/features/user/post_details/views/widgets/lost_found_item_type.dart';
import 'package:flutter/material.dart';

class PostDetailsScreenBody extends StatelessWidget {
  const PostDetailsScreenBody({super.key, required this.post});

  final LostFoundItemModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LostFoundItemImage(image: post.image, status: post.status),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width * 0.03,
                vertical: SizeConfig.height * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LostFoundItemDateAndTitle(
                    date: formatTimeDifference(post.createdAt),
                    title: post.title,
                  ),
                  SizedBox(height: SizeConfig.height * 0.01),
                  LostFoundItemLocationAndDate(
                    location: post.locationDescription,
                    date: post.dateTime,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.height * 0.01,
                    ),
                    child: Text(
                      post.comments == '' ? 'No comments' : post.comments,
                      style: AppTextStyles.title16Black,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Divider(),
                  LostFoundItemType(itemType: post.itemType.name),
                  Divider(),
                  LostFoundLocationOnMap(
                    cityName: post.locationDescription.isEmpty
                        ? "Cairo, Egypt"
                        : post.locationDescription,
                  ),
                  Divider(),
                  FinderDetails(
                    finderName: post.user.username,
                    onPressed: () {
                      context.pushScreen(
                        RouteNames.chatScreen,
                        arguments: ChatModel(
                          id:
                              post.id.toString() +
                              post.user.id.toString() +
                              getIt<CacheHelper>()
                                  .getUserModel()!
                                  .id
                                  .toString(),
                          userId: getIt<CacheHelper>().getUserModel()!.id,
                          finderId: post.user.id.toString(),
                          finderName: post.user.username,
                          userName: getIt<CacheHelper>().getUserModel()!.username,
                        ).toJson(),
                      );
                    },
                  ),
                  Divider(),
                  Text(
                    "Tips For Safety",
                    style: AppTextStyles.title20BlackBold,
                  ),
                  SizedBox(height: SizeConfig.height * 0.015),
                  Text(
                    "• Verify the item’s details and request proof, like photos or unique features, before proceeding.\n\n• Avoid sharing personal or sensitive information during communication.\n\n• Always meet in a safe, public location and bring someone with you if possible.\n\n• Use FIEN’s chat to keep your communication secure and traceable.\n\n• Confirm all details clearly in the chat before arranging any meeting.",
                    style: AppTextStyles.title16Black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

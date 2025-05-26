import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/my_chats/models/my_chat_model.dart';
import 'package:flutter/material.dart';

class FoundChatsList extends StatelessWidget {
  const FoundChatsList({super.key, required this.myChats});
  final List<MyChatModel> myChats;
  @override
  Widget build(BuildContext context) {
    return myChats.isEmpty
        ? Center(
          child: Text(
            "No Chats Found",
            style: AppTextStyles.title24PrimaryColorW500,
          ),
        )
        : ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.03,
            vertical: SizeConfig.height * 0.01,
          ),
          itemCount: myChats.length,
          itemBuilder:
              (context, index) => Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.height * 0.01),
                child: ListTile(
                  onTap: () {
                    context.pushScreen(
                      RouteNames.chatScreen,
                      arguments: myChats[index].toJson(),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(width: 1, color: AppColors.kPrimaryColor),
                  ),
                  leading: Image.asset(AppImages.userImage),
                  title: Text(
                    myChats[index].finderName,
                    style: AppTextStyles.title20BlackW600,
                  ),
                  subtitle: Text(
                    myChats[index].messages == null
                        ? "No messages yet"
                        : myChats[index].messages!.first.message,
                  ),
                ),
              ),
        );
  }
}

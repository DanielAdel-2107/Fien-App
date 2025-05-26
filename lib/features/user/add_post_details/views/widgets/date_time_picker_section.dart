import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/add_post_details/view_models/cubit/add_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerSection extends StatelessWidget {
  final AddPostCubit cubit;

  const DateTimePickerSection({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Date Picker
        Expanded(
          child: InkWell(
            onTap: () => cubit.pickDate(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy').format(cubit.selectedDate),
                    style: AppTextStyles.title18Black54,
                  ),
                  const Icon(
                    Icons.calendar_today,
                    size: 20,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: SizeConfig.width * 0.03),

        // Time Picker
        Expanded(
          child: InkWell(
            onTap: () => cubit.pickTime(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cubit.selectedTime.format(context),
                    style: AppTextStyles.title18Black54,
                  ),
                  const Icon(
                    Icons.access_time,
                    size: 20,
                    color: Colors.black54,
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

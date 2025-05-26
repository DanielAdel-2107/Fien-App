import 'package:fien/features/user/search/view_models/cubit/search_cubit.dart';
import 'package:flutter/material.dart';

class FilterByDateAndTime extends StatelessWidget {
  final SearchCubit cubit;

  const FilterByDateAndTime({super.key, required this.cubit});

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
                    cubit.formattedDate,
                    style: TextStyle(
                      fontSize: 16,
                      color: cubit.selectedDate == null ? Colors.grey : Colors.black,
                    ),
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
        const SizedBox(width: 12),

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
                    cubit.formattedTime,
                    style: TextStyle(
                      fontSize: 16,
                      color: cubit.selectedTime == null ? Colors.grey : Colors.black,
                    ),
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

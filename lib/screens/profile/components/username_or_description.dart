import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/auth_state_provider.dart';


class UsernameOrEmail extends ConsumerWidget {
  const UsernameOrEmail({
    super.key,
    required this.fontSize,
    this.isUsername = false,
    this.bold = false,
  });

  final bool bold;
  final double fontSize;
  final bool isUsername;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(authStateProvider).userInfo;
    return userInfo == null
        ? const Text('Error: Can not get user info')
        : Row(
            children: [
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    isUsername ? userInfo.displayName : userInfo.email,
                    style: TextStyle(
                      fontWeight: bold ? FontWeight.bold : null,
                      fontSize: fontSize,
                      color: bold ? null : Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Spacer(),
            ],
          );


    // return FutureBuilder<UserThongTin?>(
    //   future: userInfo,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const CircularProgressIndicator(); // Loading indicator
    //     } else if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     } else if (!snapshot.hasData || snapshot.data == null) {
    //       return const Text('User not found');
    //     } else {
    //       final userInfo = snapshot.data;
    //       return Row(
    //         children: [
    //           Flexible(
    //             flex: 3,
    //             child: Padding(
    //               padding: const EdgeInsets.only(left: 15),
    //               child: Text(
    //                 isUsername ? userInfo!.displayName : userInfo!.email,
    //                 style: TextStyle(
    //                   fontWeight: bold ? FontWeight.bold : null,
    //                   fontSize: fontSize,
    //                   color: bold ? null : Colors.grey,
    //                 ),
    //                 maxLines: 2,
    //                 overflow: TextOverflow.ellipsis,
    //                 textAlign: TextAlign.left,
    //               ),
    //             ),
    //           ),
    //           const Spacer(),
    //         ],
    //       );
    //     }
    //   },
    // );
  }
}

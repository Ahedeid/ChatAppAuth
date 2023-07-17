import 'package:chat_app_auth/routes/app_router.dart';
import 'package:chat_app_auth/sheared/widget/CustomeSvg.dart';
import 'package:chat_app_auth/utils/resources/icons_constant.dart';
import 'package:flutter/material.dart';

class AppBarRegistrationWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarRegistrationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          AppRouter.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () {},
            child: CustomSvgAssets(
              path: AppIcons.dangerCircle,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

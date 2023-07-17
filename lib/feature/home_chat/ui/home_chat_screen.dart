import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_auth/feature/home_chat/provider/home_chat_provider.dart';
import 'package:chat_app_auth/logic/localData/shared_pref.dart';
import 'package:chat_app_auth/routes/app_router.dart';
import 'package:chat_app_auth/routes/screen_name.dart';
import 'package:chat_app_auth/sheared/screens/EmptyDataScreen.dart';
import 'package:chat_app_auth/sheared/widget/CustomSearchBarFilter.dart';
import 'package:chat_app_auth/sheared/widget/CustomeSvg.dart';
import 'package:chat_app_auth/utils/resources/colors_manger.dart';
import 'package:chat_app_auth/utils/resources/font_size.dart';
import 'package:chat_app_auth/utils/resources/icons_constant.dart';
import 'package:chat_app_auth/utils/resources/sizes_in_app.dart';
import 'package:chat_app_auth/utils/resources/strings_in_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeChatScreen extends StatefulWidget {
  const HomeChatScreen({Key? key}) : super(key: key);

  @override
  State<HomeChatScreen> createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<HomeChatScreen> {
  TextEditingController? searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeChatProvider>().getMyFriends();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            SharedPrefController().getUser().user.name,
            style: const TextStyle(
              fontSize: FontSize.s24,
              color: ColorManager.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CustomSvgAssets(
                path: AppIcons.logo,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  AppRouter.goTo(
                      screenName: ScreenName.showAllPeopleScreen);
                },
                icon: const Icon(Icons.person_add_alt)),
            IconButton(
                onPressed: () {
                  AppRouter.goToAndRemove(screenName: ScreenName.loginScreen);
                  Future.delayed(const Duration(seconds: 1), () {
                    SharedPrefController().removeUser();
                  });
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild!.unfocus();
            }
          },
          child: Consumer<HomeChatProvider>(
            builder: (context, value, child) => value.isLoadingGetFriends
                ? const Center(
                    child:
                        CircularProgressIndicator(color: ColorManager.primary),
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.paddingVertical,
                      horizontal: 12,
                    ),
                    children: [
                      CustomSearchBar(
                          controller: searchController,
                          hintText: AppStrings.search,
                          onChange: (val) {
                            debugPrint("This is inside onChange");
                            value.searchFriends(searchTextUser: val);
                          }),
                      const SizedBox(height: 15),
                      const Text(
                        AppStrings.chatRooms,
                        style: TextStyle(
                          fontSize: FontSize.s20,
                          color: ColorManager.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 8,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            width: 95,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF03A9F1),
                                  Color(0xFFA0025A),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Anastazja Ziemkowska',
                                  style: TextStyle(
                                    fontSize: AppSize.s12,
                                    color: ColorManager.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      value.isLoadingSearch
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.primary,
                              ),
                            )
                          : value.friendsList.isEmpty
                              ? const ToEmptyDataWidget(
                                  title: 'List Of Friend is Empty',
                                  subTitle:
                                      'Please new friends in your account',
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: value.friendsList.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: ListTile(
                                      onTap: () {
                                        AppRouter.goTo(
                                          screenName: ScreenName.chatScreen,
                                          object: value.friendsList[index],
                                        );
                                      },
                                      leading: CircleAvatar(
                                        radius: 22,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          child: CachedNetworkImage(
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            imageUrl:
                                                'https://i.pinimg.com/564x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg',
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        value.friendsList[index].name,
                                        style: const TextStyle(
                                          fontSize: FontSize.s15,
                                          color: ColorManager.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                        value.friendsList[index].email,
                                        style: const TextStyle(
                                          fontSize: FontSize.s13,
                                          color: ColorManager.white,
                                        ),
                                      ),
                                      trailing: const Text(
                                        '08:43',
                                        style: TextStyle(
                                          fontSize: FontSize.s15,
                                          color: ColorManager.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

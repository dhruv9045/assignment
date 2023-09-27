import 'package:assignment/constants/colors.dart';
import 'package:assignment/screens/controller/user_controller.dart';
import 'package:assignment/screens/model/user_model.dart';
import 'package:assignment/screens/view/schedule.dart';
import 'package:assignment/widget/actionIconButton.dart';
import 'package:assignment/widget/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UsersPage extends StatelessWidget {
  UsersPage({super.key});
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, title: 'Directory', actions: [
        ActionIcon(
          icon: Icons.filter_list_alt,
          onPress: null,
        )
      ]),
      body: GetBuilder<UserController>(builder: (controller) {
        return PagedListView<int, ExtraData>(
          pagingController: userController.pagingController,
          builderDelegate: PagedChildBuilderDelegate<ExtraData>(
            noItemsFoundIndicatorBuilder: (context) {
              return Center(
                child: Text('No Item found'),
              );
            },
            newPageErrorIndicatorBuilder: (context) {
              return Text('Please try again');
            },
            itemBuilder: (context, item, index) {
              return ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: 40,
                      height: 40,
                      color: AppColors.white,
                      child: item.user?.profilePicture == null
                          ? Icon(Icons.person)
                          : Image.network(
                              item.user?.profilePicture,
                              fit: BoxFit.cover,
                            ),
                    )),
                title: Text(
                  "${item.user?.firstName} ${item.user?.lastName}",
                  style: TextStyle(color: AppColors.white),
                ),
                subtitle: Text(
                  "Admin",
                  style: TextStyle(color: AppColors.white.withOpacity(0.2)),
                ),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ActionIcon(
                      icon: Icons.call,
                      onPress: null,
                    ),
                    ActionIcon(
                      icon: Icons.message,
                      onPress: null,
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.more_vert,
                          color: AppColors.white,
                        ))
                  ],
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        child: Icon(
          Icons.calendar_today,
          color: AppColors.white,
        ),
        onPressed: () => Get.to(() => EventSchedule()),
      ),
    );
  }
}

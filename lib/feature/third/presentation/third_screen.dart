import 'package:flutter/material.dart';
import 'package:three_screeens/core/design/decoration/base_color.dart';
import 'package:three_screeens/core/design/style/text_style.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/constant/base_route.dart';
import '../../../core/constant/preferences_keys.dart';
import '../../../core/data/model/user.dart';
import '../../../core/design/layout/base_scaffold.dart';
import '../../../services/shared_preferences.dart';
import '../data/remote_data_source.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final PagingController<int, User> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_loadUsers);
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      withAppBar: true,
      appBarTitle: 'Third Screen',
      backRoute: BaseRoute.secondScreen,
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedListView<int, User>.separated(
          pagingController: _pagingController,
          separatorBuilder: (context, index) {
            return const Divider(color: BaseColors.lightGrey, thickness: 0.5,);
          },
          builderDelegate: PagedChildBuilderDelegate<User>(
            animateTransitions: true,
            itemBuilder: (context, item, index) {
              return ListTile(
                onTap: () async {
                  await SharedPreferencesService.saveString(
                    PreferencesKeys.selectedUser,
                    '${item.firstName} ${item.lastName}',
                  );
                },
                title: Text(
                  '${item.firstName} ${item.lastName}',
                  style: BaseTextStyle.blackH3(),
                ),
                subtitle: Text(
                  item.email,
                  style: BaseTextStyle.grayTitle(),
                ),
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: BaseColors.lightGrey,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(child: Image.network(item.avatar)),
                ),
              );
            },
            firstPageErrorIndicatorBuilder: (context) =>
                const Center(child: Text('Error')),
            noItemsFoundIndicatorBuilder: (context) =>
                const Center(child: Text('Empty')),
          ),
        ),
      ),
    );
  }

  Future<void> _loadUsers(int pageKey) async {
    try {
      final newItems = await RemoteDataSourceImpl.getUsers(
        pageKey,
        10,
      );

      final isLastPage = newItems.page == newItems.totalPages;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.data);
      } else {
        final nextPageKey = pageKey + newItems.page;
        _pagingController.appendPage(newItems.data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}

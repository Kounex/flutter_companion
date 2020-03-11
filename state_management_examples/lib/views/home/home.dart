import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management_examples/shared/custom_list_tile.dart';
import 'package:state_management_examples/views/set_state/set_state.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //   pinned: true,
          //   title: Text('State Management'),
          // ),
          CupertinoSliverNavigationBar(
            largeTitle: Text('State Management'),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              CustomListTile(
                title: 'Stateful Widget',
                subtitle:
                    'Die Grundlage um ein (Stateful) Widget darüber zu informieren, dass ein Rebuild angestoßen werden soll',
                leadingImagePath: 'assets/images/set-state-icon_2.png',
                routingWidget: SetStateView(),
              ),
              Divider(
                height: 0.0,
              ),
              CustomListTile(
                title: 'Provider',
                subtitle:
                    'Basiert rein auf vorhandene Flutter Widgets und ermöglicht durch richtiges Verwenden eine Art Dependency Injection (DI)',
                leadingImagePath: 'assets/images/provider.png',
              ),
              Divider(
                height: 0.0,
              ),
              CustomListTile(
                title: 'MobX',
                subtitle:
                    'Die Grundlage um einem (Stateful) Widget darüber zu informieren, dass ein Rebuild des Widgets angestoßen werden soll',
                leadingImagePath: 'assets/images/mobx.png',
              ),
              Divider(
                height: 0.0,
              ),
              CustomListTile(
                title: 'Bloc',
                subtitle:
                    'Die Grundlage um einem (Stateful) Widget darüber zu informieren, dass ein Rebuild des Widgets angestoßen werden soll',
                leadingImagePath: 'assets/images/bloc.png',
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

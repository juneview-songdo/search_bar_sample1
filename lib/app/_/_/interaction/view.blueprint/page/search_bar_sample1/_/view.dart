import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key});

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  bool searchBarFocus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: SuperScaffold(
          appBar: SuperAppBar(
            backgroundColor: Colors.transparent,
            height: 0,
            // title: null,
            title: Text("Hello SuperScaffold"),
            largeTitle: SuperLargeTitle(
              enabled: false,
              largeTitle: "Welcome",
            ),
            searchBar: SuperSearchBar(
              onFocused: (focused) {
                print("Search Bar Focused: $focused");
                setState(() {
                  searchBarFocus = focused;
                });
              },
              placeholderText: "Search",
              prefixIcon: Icon(CupertinoIcons.search),
              enabled: true,
              scrollBehavior: SearchBarScrollBehavior.pinned,
              onChanged: (query) {
                // Search Bar Changes
              },
              onSubmitted: (query) {
                // On Search Bar submitted
              },
              // searchResult: /* ... */,
              // Add other search bar properties as needed
              actions: [
                const SuperAction(
                  behavior: SuperActionBehavior.visibleOnUnFocus,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.filter_list,
                      color: CupertinoColors.systemBlue,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
            bottom: SuperAppBarBottom(
              enabled: searchBarFocus,
              height: 200,
              child: Container(
                color: Colors.blue.shade100,
                child: Text("Search Area").center(),
              ),
            ),
          ),
          body: Text("Body Widget").fontSize(30).center(),
        ),
      ),
    );
  }
}

main() async {
  return buildApp(appHome: NewView());
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final count = 55;

  @override
  Widget build(BuildContext context) {
    final listItem = List.generate(count, (index) => 'Item${index + 1}');

    final heightItem = (MediaQuery.of(context).size.width - 30) / 4;
    final heightItems = (count ~/ 2 + 1) * heightItem;
    final padding = MediaQuery.of(context).padding;

    double heightScreen =
        (MediaQuery.of(context).size.height - padding.top) - heightItems;
    if (heightScreen < 200) heightScreen = 200;

    final _scrollController = ScrollController();

    return SafeArea(
      child: Scaffold(
        body: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                flexibleSpace: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Image.asset('assets/images/logo.png'),
                )),
                expandedHeight: heightScreen,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: AutoSizeText(listItem[i],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 100),
                            maxLines: 1,
                            minFontSize: 8),
                      );
                    },
                    childCount: listItem.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

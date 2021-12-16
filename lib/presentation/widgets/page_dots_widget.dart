import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class PageDotsWidget extends StatefulWidget {
  final PageController pageController;
  final int pageCount;

  const PageDotsWidget({
    Key? key,
    required this.pageController,
    required this.pageCount,
  }) : super(key: key);

  @override
  _PageDotsWidgetState createState() => _PageDotsWidgetState();
}

class _PageDotsWidgetState extends State<PageDotsWidget> {
  double position = 0;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(onUpdate);
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    widget.pageController.removeListener(onUpdate);
    scrollController.dispose();
  }

  void onUpdate() {
    setState(() {
      position = (widget.pageController.page ?? 0).clamp(0.0, widget.pageCount.toDouble() - 1);
    });
    final offset = position / (widget.pageCount - 1);

    scrollController.animateTo(
      offset * scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 20, right: 20),
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: DotsIndicator(
          dotsCount: widget.pageCount,
          position: position.clamp(0.0, widget.pageCount.toDouble() - 1),
          decorator: DotsDecorator(
            activeSize: const Size(60.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            color: Theme.of(context).iconTheme.color!.withOpacity(0.2),
            activeColor: Theme.of(context).iconTheme.color!,
          ),
        ),
      ),
    );
  }
}

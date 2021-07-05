import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';

import 'components/nav_button.dart';
import 'components/nav_custom_painter.dart';

typedef _LetIndexPage = bool Function(int value);

class CurvedNavigationBar extends StatefulWidget {
  final List<ItemIcon> items;
  final int index;
  final Color color;
  final Color buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int> onTap;
  final _LetIndexPage letIndexChange;
  final Curve animationCurve;
  final Duration animationDuration;
  final double height;

  CurvedNavigationBar({
    required this.items,
    this.index = 0,
    this.color = Colors.white,
    required this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    required this.onTap,
    required _LetIndexPage letIndexChange,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.height = 75.0,
  })  : letIndexChange = letIndexChange,
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        assert(0 <= height && height <= 75.0);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  double? _startingPos;
  int _endingIndex = 0;
  double? _pos;
  double _buttonHide = 0;
  Icon? _icon;
  AnimationController? _animationController;
  int? _length;

  @override
  void initState() {
    super.initState();
    _icon = widget.items[widget.index].child;
    _length = widget.items.length;
    _pos = widget.index / _length!;
    print("${widget.index} ${(_length! / 2).round()}");
    _startingPos = widget.index / _length!;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController!.addListener(() {
      setState(() {
        _pos = _animationController!.value;
        final endingPos = _endingIndex / widget.items.length;
        final middle = (endingPos + _startingPos!) / 2;
        if ((endingPos - _pos!).abs() < (_startingPos! - _pos!).abs()) {
          _icon = widget.items[_endingIndex].child;
        }
        _buttonHide =
            (1 - ((middle - _pos!) / (_startingPos! - middle)).abs()).abs();
      });
    });
  }

  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length!;
      _startingPos = _pos;
      _endingIndex = widget.index;
      _animationController!.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: widget.backgroundColor,
      height: widget.height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            bottom: -40 - (75.0 - widget.height),
            left: Directionality.of(context) == TextDirection.rtl
                ? null
                : _pos! * size.width,
            right: Directionality.of(context) == TextDirection.rtl
                ? _pos! * size.width
                : null,
            width: size.width / _length!,
            child: Center(
              child: Transform.translate(
                offset: Offset(
                  0,
                  -(1 - _buttonHide) * 80,
                ),
                child: Material(
                  color: widget.buttonBackgroundColor,
                  type: MaterialType.circle,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      _icon!.icon,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (75.0 - widget.height),
            child: CustomPaint(
              painter: NavCustomPainter(
                  _pos!, _length!, widget.color, Directionality.of(context)),
              child: Container(
                height: 75.0,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (75.0 - widget.height),
            child: SizedBox(
                height: 100.0,
                child: Row(
                    children: widget.items.map((item) {
                  return NavButton(
                    onTap: _buttonTap,
                    position: _pos!,
                    length: _length!,
                    index: widget.items.indexOf(item),
                    title: item.title,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: item.child,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            "${item.title}",
                            style: TextStyle(fontSize: miniTitleSize),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList())),
          ),
        ],
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (!widget.letIndexChange(index)) {
      return;
    }
    widget.onTap(index);
    final newPosition = index / _length!;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      _animationController!.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    });
  }
}

class ItemIcon {
  final String? title;
  final Icon? child;

  ItemIcon({this.title, this.child});
}

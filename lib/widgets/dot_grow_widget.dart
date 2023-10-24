import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zerei_opensource/core/helpers/delay_tween.dart';

class DotGrowWidget extends StatefulWidget {
  const DotGrowWidget({
    Key? key,
    required this.color,
    this.size = 18.0,
    this.count = 3,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 300),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'Voce deve especificar um itemBuilder ou uma cor!!!'),
        super(key: key);

  final Color? color;
  final double size;
  final int count;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  DotGrowWidgetState createState() => DotGrowWidgetState();
}

class DotGrowWidgetState extends State<DotGrowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(
          vsync: this,
          duration: Duration(
            milliseconds: widget.count * widget.duration.inMilliseconds,
          ),
        ))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 3.5, widget.size * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.count, (i) {
            return ScaleTransition(
              scale: DelayTween(begin: 1.0, end: 1.3, delay: i * 0.2)
                  .animate(_controller),
              child: SizedBox.fromSize(
                size: Size.square(widget.size * 0.5),
                child: _itemBuilder(i),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        );
}

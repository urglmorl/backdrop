import 'package:flutter/material.dart';

class Backdrop extends StatefulWidget {
  final Widget frontLayer;
  final Widget backLayer;
  final Widget appBar;
  final double sliderHeight;
  final double slideSensitivity;

  Backdrop({
    @required this.frontLayer,
    @required this.backLayer,
    this.sliderHeight,
    this.slideSensitivity,
    this.appBar,
  });

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  AnimationController _animationController;
  final double _kFlingVelocity = 2.0;
  double _initialOffset;
  double _swipeOffset;

  double _sensitivity;
  final double _standartSensitivity = 1.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
    _sensitivity = widget.slideSensitivity ?? _standartSensitivity;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool get _frontLayerVisible {
    final AnimationStatus status = _animationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleOn() {
    _animationController.fling(velocity: -_kFlingVelocity);
  }

  void _toggleOff() {
    _animationController.fling(velocity: _kFlingVelocity);
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final double sliderHeight =
        widget.sliderHeight ?? constraints.biggest.height;

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, -sliderHeight, 0.0, sliderHeight),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_animationController.view);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragStart: (details) {
        setState(() {
          _initialOffset = details.globalPosition.dy;
        });
      },
      onVerticalDragUpdate: (details) {
        setState(() {
          _swipeOffset =
              (details.globalPosition.dy - _initialOffset) * _sensitivity;
        });
      },
      onVerticalDragEnd: (details) {
        if (_frontLayerVisible &&
            _swipeOffset < MediaQuery.of(context).size.height / 8 &&
            _swipeOffset != 0) {
          _toggleOn();
        } else if (!_frontLayerVisible &&
            _swipeOffset > MediaQuery.of(context).size.height / 8 &&
            _swipeOffset != 0) {
          _toggleOff();
        }
        setState(() {
          _swipeOffset = 0.0;
        });
      },
      child: Stack(
        key: _backdropKey,
        children: [
          ExcludeSemantics(
            child: widget.backLayer,
            excluding: _frontLayerVisible,
          ),
          PositionedTransition(
            rect: layerAnimation,
            child: widget.frontLayer,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: LayoutBuilder(builder: _buildStack),
    );
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:kids_bids/views/constants/color.dart';
import 'package:painter/painter.dart';

class PaintingPage extends StatefulWidget {
  const PaintingPage({Key? key}) : super(key: key);

  @override
  State<PaintingPage> createState() => _PaintingPageState();
}

class _PaintingPageState extends State<PaintingPage> {
  bool _finished = false;
  PainterController _controller = _newController();

  @override
  void initState() {
    super.initState();
  }

  static PainterController _newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.green;
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions;
    if (_finished) {
      actions = <Widget>[
        IconButton(
          icon: const Icon(Icons.content_copy, color: Colors.white),
          tooltip: 'New Painting',
          onPressed: () => setState(() {
            _finished = false;
            _controller = _newController();
          }),
        ),
      ];
    } else {
      actions = <Widget>[
        Container(
          height: 70,
          decoration: BoxDecoration(
              color: amberColor,
              border: Border.all(width: 1, color: Colors.white)),
          width: 70,
          child: IconButton(
              icon: const Icon(Icons.undo, color: Colors.white),
              tooltip: 'Undo',
              onPressed: () {
                if (_controller.isEmpty) {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) =>
                          const Text('Nothing to undo'));
                } else {
                  _controller.undo();
                }
              }),
        ),
        Container(
          height: 70,
          decoration: BoxDecoration(
              color: pinkColor,
              border: Border.all(width: 1, color: Colors.white)),
          width: 70,
          child: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              tooltip: 'Clear',
              onPressed: _controller.clear),
        ),
        Container(
          height: 70,
          decoration: BoxDecoration(
              color: amberColor,
              border: Border.all(width: 1, color: Colors.white)),
          width: 70,
          child: IconButton(
              icon: const Icon(Icons.check, color: Colors.white),
              onPressed: () => _show(_controller.finish(), context)),
        ),
        const SizedBox(
          width: 20,
        )
      ];
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 140,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Painting World',
            style: TextStyle(color: Colors.white),
          ),
          actions: actions,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 30.0),
            child: DrawBar(_controller),
          )),
      body: Stack(
        children: [
          Image.asset(
            "assets/image/homebg.jpg",
            fit: BoxFit.cover,
          ),
          Painter(_controller),
        ],
      ),
    );
  }

  void _show(PictureDetails picture, BuildContext context) {
    setState(() {
      _finished = true;
    });
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('View your image'),
        ),
        body: Container(
            alignment: Alignment.center,
            child: FutureBuilder<Uint8List>(
              future: picture.toPNG(),
              builder:
                  (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Image.memory(snapshot.data!);
                    }
                  default:
                    return const FractionallySizedBox(
                      widthFactor: 0.1,
                      alignment: Alignment.center,
                      child: AspectRatio(
                          aspectRatio: 1.0, child: CircularProgressIndicator()),
                    );
                }
              },
            )),
      );
    }));
  }
}

class DrawBar extends StatelessWidget {
  final PainterController _controller;

  DrawBar(this._controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Slider(
            value: _controller.thickness,
            onChanged: (double value) => setState(() {
              _controller.thickness = value;
            }),
            min: 1.0,
            max: 20.0,
            activeColor: Colors.white,
          );
        })),
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return RotatedBox(
              quarterTurns: _controller.eraseMode ? 2 : 0,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    border: Border.all(width: 1, color: Colors.white)),
                width: 70,
                child: IconButton(
                    icon: const Icon(Icons.create),
                    tooltip:
                        '${_controller.eraseMode ? 'Disable' : 'Enable'} eraser',
                    onPressed: () {
                      setState(() {
                        _controller.eraseMode = !_controller.eraseMode;
                      });
                    }),
              ));
        }),
        ColorPickerButton(_controller, false, telColor),
        ColorPickerButton(_controller, true, greenColor),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}

class ColorPickerButton extends StatefulWidget {
  final PainterController _controller;
  final bool _background;
  final Color color;

  ColorPickerButton(this._controller, this._background, this.color);

  @override
  _ColorPickerButtonState createState() => _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(width: 1, color: Colors.white)),
      width: 70,
      child: IconButton(
          icon: Icon(_iconData, color: Colors.white),
          tooltip: widget._background
              ? 'Change background color'
              : 'Change draw color',
          onPressed: _pickColor),
    );
  }

  void _pickColor() {
    Color pickerColor = _color;
    Navigator.of(context)
        .push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Pick color'),
                  ),
                  body: Container(
                      alignment: Alignment.center,
                      child: ColorPicker(
                        pickerColor: pickerColor,
                        onColorChanged: (Color c) => pickerColor = c,
                      )));
            }))
        .then((_) {
      setState(() {
        _color = pickerColor;
      });
    });
  }

  Color get _color => widget._background
      ? widget._controller.backgroundColor
      : widget._controller.drawColor;

  IconData get _iconData =>
      widget._background ? Icons.format_color_fill : Icons.brush;

  set _color(Color color) {
    if (widget._background) {
      widget._controller.backgroundColor = color;
    } else {
      widget._controller.drawColor = color;
    }
  }
}

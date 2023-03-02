import 'package:flutter/material.dart';
import 'package:kids_bids/views/constants/color.dart';

class HoverItem extends StatefulWidget {
  const HoverItem({super.key, required this.child});
  final Widget child;

  @override
  State<HoverItem> createState() => _HoverItemState();
}

class _HoverItemState extends State<HoverItem> {
  bool isHovered = false;
  final hoveredTranform = Matrix4.identity()..translate(0, -8, 0);
  @override
  Widget build(BuildContext context) {
    final transForm = isHovered == true ? hoveredTranform : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transForm,
        child: Stack(
          children: [
            widget.child,
            // isHovered
            //     ? Container(
            //         width: 166.0,
            //         color: Colors.black.withOpacity(0.2),
            //       )
            //     : const SizedBox()
          ],
        ),
      ),
    );
  }

  onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}

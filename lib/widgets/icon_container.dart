import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  final double size;
  const IconContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: this.size,
        height: this.size,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 189, 183, 183),
          borderRadius: BorderRadius.circular(this.size * 0.15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 191, 184, 184),
              blurRadius: 10,
            ),
          ],
        ),
        padding: EdgeInsets.all(this.size * 0.15),
        child: Center(
          child: SvgPicture.asset(
            'assets/icon.svg',
            width: this.size * 0.5,
            height: this.size * 0.5,
            color: const Color.fromARGB(255, 222, 176, 108),
          ),
        ),
      ),
    );
  }
}

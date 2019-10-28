import 'package:chroma/models/chroma.dart';
import 'package:flutter/material.dart';

class ChromaItem extends StatelessWidget {
  final int index;
  final Chroma chroma;
  final void Function(int index, Chroma chroma) onTap;

  const ChromaItem({
    Key key,
    @required this.index,
    @required this.chroma,
    @required this.onTap,
  })  : assert(index != null),
        assert(chroma != null),
        assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: chroma.visible ? () => onTap(index, chroma) : null,
        child: AnimatedOpacity(
          curve: Curves.fastOutSlowIn,
          duration: Duration(
            milliseconds: 400,
          ),
          opacity: chroma.visible ? 1.0 : 0.0,
          child: AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: Duration(
              milliseconds: 400,
            ),
            decoration: BoxDecoration(
              color: chroma.color.withOpacity(0.6),
              border: Border.all(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

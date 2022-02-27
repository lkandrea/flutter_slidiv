import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/common/enum/screen_size_enum.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({required this.child, Key? key}) : super(key: key);

  final Function(BuildContext, ScreenSize) child;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenSize =
        _screenWidth <= 576 ? ScreenSize.small : ScreenSize.large;

    return Container(
      child: child.call(context, _screenSize),
    );
  }
}

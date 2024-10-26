import 'package:flutter/material.dart';

class BottomActionButton extends StatelessWidget {
  final void Function()? _onPressed;

  final Widget _child;
  final Widget? _top;

  const BottomActionButton({
    super.key,
    void Function()? onPressed,
    required Widget child,
    Widget? top,
  })  : _onPressed = onPressed,
        _child = child,
        _top = top;

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        );
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Wrap(
          children: [
            _top ?? const SizedBox(),
            SizedBox(
              width: double.maxFinite,
              child: FilledButton(
                  style: FilledButton.styleFrom(
                      textStyle: buttonTextStyle,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                  onPressed: _onPressed,
                  child: _child),
            ),
          ],
        ),
      ),
    );
  }
}

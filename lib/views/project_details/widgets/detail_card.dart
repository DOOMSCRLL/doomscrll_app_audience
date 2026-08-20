import "package:doomscrll_app_audience/utils/string_extensions.dart";
import "package:flutter/material.dart";

abstract class DetailCard extends StatelessWidget {
  const new({super.key});

  const factory row({Key? key, required String label, required Widget child}) = _DetailRow;
  const factory column({Key? key, required String label, required Widget child}) = _DetailColumn;
}

class _DetailLabel extends StatelessWidget {
  final String label;

  const new({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(label.upper, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}

class _DetailColumn extends DetailCard {
  final String label;
  final Widget child;

  const new({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailLabel(label: label),
        child,
      ],
    );
  }
}

class _DetailRow extends DetailCard {
  final String label;
  final Widget child;

  const new({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _DetailLabel(label: label)),
        Expanded(
          flex: 2,
          child: Padding(padding: const EdgeInsets.only(left: 16.0), child: child),
        ),
      ],
    );
  }
}

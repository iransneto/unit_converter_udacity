import 'package:flutter/material.dart';
import 'package:unit_converter/converter.route.dart';

import 'unities.model.dart';

final _iconSize = 60.0;
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final Color color;
  final IconData icon;
  final List<Unit> units;

  ///Cria uma [Category]
  ///
  ///Recebe como parâmetro o nome da categoria, a cor do InkWell e o ícone com [name], [color] e [icon]
  const Category({
    Key? key,
    required this.name,
    required this.color,
    required this.icon,
    required this.units,
  }) : super(key: key);

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<ConverterRoute>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              title: Text(name),
              backgroundColor: color,
            ),
            body: ConverterRoute(units: units, color: color),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: () => _navigateToConverter(context),
        highlightColor: color,
        splashColor: color,
        child: SizedBox(
          height: _rowHeight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(icon, size: _iconSize),
                ),
                Center(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

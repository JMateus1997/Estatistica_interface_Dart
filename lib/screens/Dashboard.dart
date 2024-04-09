import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu_data.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/logo_ufsj.png',
              scale: 0.6,
            ),
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _FeatureItem(
                  'Sobre',
                  Icons.question_mark_rounded,
                  onClick: () => null,
                ),
                _FeatureItem(
                  'Começar',
                  Icons.play_circle_outline,
                  onClick: () => _showMenuData(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showMenuData(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MenuData(),
    ));
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  const _FeatureItem(this.name, this.icon, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                  size: 24,
                ),
                Text(name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

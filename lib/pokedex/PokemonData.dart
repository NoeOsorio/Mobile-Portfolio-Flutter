import 'package:flutter/material.dart';

import 'Pokemon.model.dart';

class PokemonData extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonData({
    Key key,
    @required this.pokemon,
  }) : super(key: key);
  @override
  _PokemonDataState createState() => _PokemonDataState();
}

class _PokemonDataState extends State<PokemonData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: widget.pokemon.color,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(widget.pokemon.name,
                          style: TextStyle(
                              color: widget.pokemon.textColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600)),
                      background: Image.network(
                        widget.pokemon.imageURL,
                        fit: BoxFit.fitHeight,
                      )),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Información"),
                        Tab(text: "Movimientos"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: Center(
              child: Text("Sample text"),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

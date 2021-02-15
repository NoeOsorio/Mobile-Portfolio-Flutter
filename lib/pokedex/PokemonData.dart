import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_portfolio/pokedex/Loader.dart';
import 'package:mobile_portfolio/pokedex/pokedata.dart';

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
          length: 1,
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
                      indicatorColor: widget.pokemon.color,
                      labelColor: widget.pokemon.color,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        // Tab(text: "Información"),
                        Tab(text: "Tipos"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: Center(
              child: FutureBuilder(
                future: getPokemonById(widget.pokemon.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return PokeLoader();
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Container();
                  }

                  List<Widget> tipos = [];
                  if (snapshot.data["types"] != null) {
                    tipos = (snapshot.data["types"] as List)
                        .map((e) => Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: widget.pokemon.color,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                (e["type"]["name"] as String).toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700),
                              ),
                            ))
                        .toList();
                  }

                  return Wrap(
                    spacing: 10,
                    children: tipos,
                  );
                },
              ),
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

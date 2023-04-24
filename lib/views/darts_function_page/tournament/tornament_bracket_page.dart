import 'package:darts_link_project/views/components/app_bar_back_view.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class TournamentBracketPage extends StatefulWidget {
  const TournamentBracketPage({Key? key, this.teamName = const []})
      : super(key: key);
  final List<String> teamName;

  @override
  State<TournamentBracketPage> createState() => _TournamentBracketPageState();
}

class _TournamentBracketPageState extends State<TournamentBracketPage> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  Widget rectangleWidget(String? a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: a?.contains('Block') ?? false
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(),
            )
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(color: Colors.blue[100]!, spreadRadius: 1),
                ],
              ),
              child: Text(a ?? '')),
    );
  }

  @override
  void initState() {
    super.initState();
    final nodes = widget.teamName.map((e) => Node.Id(e)).toList();
    final blockCount = widget.teamName.length - 2;
    final blocks =
        List.generate(blockCount, (index) => Node.Id('Block${index + 1}'));
    nodes.insertAll(0, blocks);
    final winner = Node.Id('Winner');
    graph.addEdge(winner, nodes[0]);
    graph.addEdge(winner, nodes[1]);
    for (int i = 0; i < nodes.length; i++) {
      if (nodes[i].key?.value.contains('Block')) {
        graph.addEdge(nodes[i], nodes[i * 2 + 2]);
        graph.addEdge(nodes[i], nodes[i * 2 + 3]);
      }
    }

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_RIGHT_LEFT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 76,
        leading: const AppBarBackView(),
        title: const Text('トーナメント表'),
      ),
      body: InteractiveViewer(
          constrained: false,
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.01,
          maxScale: 5.6,
          child: GraphView(
            graph: graph,
            algorithm:
                BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
            paint: Paint()
              ..color = Colors.green
              ..strokeWidth = 1
              ..style = PaintingStyle.stroke,
            builder: (Node node) {
              // I can decide what widget should be shown here based on the id
              var a = node.key!.value as String?;
              return rectangleWidget(a);
            },
          )),
    );
  }
}

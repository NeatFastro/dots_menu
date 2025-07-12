import 'package:flutter/material.dart';

import 'package:dots_menu/dots_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(body: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 64),
              VerticalExample(),
              SizedBox(height: 64 * 2),
              HorizontalExample(),
              SizedBox(height: 64 * 2),
              TenExample(),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalExample extends StatefulWidget {
  const VerticalExample({super.key});

  @override
  State<VerticalExample> createState() => _VerticalExampleState();
}

class _VerticalExampleState extends State<VerticalExample> {
  var expanded = false;

  void setStateExpanded(bool v) {
    setState(() {
      expanded = v;
    });
  }

  late final items2 = [
    DotsMenuIcon(
      backgroudColor: Colors.blue.shade100,
      child: const Icon(size: 18, Icons.edit),
      onTap: () {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: const Text('Edit!'),
            actions: [IconButton(onPressed: () {}, icon: const Text('x'))],
          ),
        );
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      backgroudColor: Colors.red.shade100,
      child: const Icon(size: 18, Icons.delete, color: Colors.red),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Deleted!')));
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      child: const Icon(size: 18, Icons.close_rounded),
      onTap: () => setStateExpanded(false),
    ),
    // DotsMenuIcon(
    //   child: const Icon(
    //     size: 32,
    //     Icons.icecream,
    //   ),
    //   onTap: () => setStateExpanded(false),
    // ),
    // DotsMenuIcon(
    //   child: const Icon(
    //     Icons.money,
    //   ),
    //   onTap: () => setStateExpanded(false),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Vertical'),
        const SizedBox(height: 24),
        Center(
          child: DotsMenu(
            expanded: expanded,
            direction: Axis.vertical,
            onTap: () => setStateExpanded(true),
            items: items2,
          ),
        ),
      ],
    );
  }
}

class HorizontalExample extends StatefulWidget {
  const HorizontalExample({super.key});

  @override
  State<HorizontalExample> createState() => _HorizontalExampleState();
}

class _HorizontalExampleState extends State<HorizontalExample> {
  var expanded = false;

  void setStateExpanded(bool v) {
    setState(() {
      expanded = v;
    });
  }

  late final items2 = [
    DotsMenuIcon(
      backgroudColor: Colors.blue.shade100,
      child: const Icon(size: 18, Icons.edit),
      onTap: () {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: const Text('Edit!'),
            actions: [IconButton(onPressed: () {}, icon: const Text('x'))],
          ),
        );
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      backgroudColor: Colors.red.shade100,
      child: const Icon(size: 18, Icons.delete, color: Colors.red),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Deleted!')));
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      child: const Icon(size: 18, Icons.close_rounded),
      onTap: () => setStateExpanded(false),
    ),
    // DotsMenuIcon(
    //   child: const Icon(
    //     size: 32,
    //     Icons.icecream,
    //   ),
    //   onTap: () => setStateExpanded(false),
    // ),
    // DotsMenuIcon(
    //   child: const Icon(
    //     Icons.money,
    //   ),
    //   onTap: () => setStateExpanded(false),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Horizontal'),
        const SizedBox(height: 24),
        Center(
          child: DotsMenu(
            expanded: expanded,
            direction: Axis.horizontal,
            onTap: () => setStateExpanded(true),
            items: items2,
          ),
        ),
      ],
    );
  }
}

class TenExample extends StatefulWidget {
  const TenExample({super.key});

  @override
  State<TenExample> createState() => _TenExampleState();
}

class _TenExampleState extends State<TenExample> {
  var expanded = false;

  void setStateExpanded(bool v) {
    setState(() {
      expanded = v;
    });
  }

  late final items2 = [
    DotsMenuIcon(
      backgroudColor: Colors.blue.shade100,
      child: const Icon(size: 18, Icons.edit),
      onTap: () {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: const Text('Edit!'),
            actions: [IconButton(onPressed: () {}, icon: const Text('x'))],
          ),
        );
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      backgroudColor: Colors.red.shade100,
      child: const Icon(size: 18, Icons.delete, color: Colors.red),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Deleted!')));
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      child: const Icon(size: 18, Icons.close_rounded),
      onTap: () => setStateExpanded(false),
    ),
    DotsMenuIcon(
      child: const Icon(size: 18, Icons.star, color: Colors.amber),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Starred!')));
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      child: const Icon(size: 18, Icons.favorite, color: Colors.pink),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Favorited!')));
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      child: const Icon(size: 18, Icons.share, color: Colors.blue),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Shared!')));
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      child: const Icon(size: 18, Icons.copy, color: Colors.green),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Copied!')));
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      child: const Icon(size: 18, Icons.download, color: Colors.indigo),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Downloaded!')));
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      child: const Icon(size: 18, Icons.upload, color: Colors.orange),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Uploaded!')));
        setStateExpanded(false);
      },
    ),
    DotsMenuIcon(
      child: const Icon(size: 18, Icons.settings, color: Colors.grey),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Settings!')));
        setStateExpanded(false);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('You can have as many dots as you want!'),
        const SizedBox(height: 24),
        Center(
          child: DotsMenu(
            expanded: expanded,
            direction: Axis.horizontal,
            onTap: () => setStateExpanded(true),
            items: items2,
          ),
        ),
      ],
    );
  }
}

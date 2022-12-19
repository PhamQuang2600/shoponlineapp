import 'package:flutter/material.dart';

class ActivityLog extends StatefulWidget {
  const ActivityLog({super.key});

  @override
  State<ActivityLog> createState() => _ActivityLogState();
}

class _ActivityLogState extends State<ActivityLog>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Log'),
        backgroundColor: const Color.fromARGB(255, 82, 77, 77),
        elevation: 1,
        bottom: TabBar(
            indicator: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 248, 98, 11), width: 2))),
            unselectedLabelColor: Colors.white,
            labelColor: const Color.fromARGB(255, 248, 98, 11),
            controller: _tabController,
            tabs: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  'Activity',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text('Comment', style: TextStyle(fontSize: 18)),
              )
            ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 300,
                ),
                const Text('Set Image for no activity!'),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: 50,
                  child: const Text('No activity'),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 300,
                ),
                const Text('Set Image for no comment!'),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: 50,
                  child: const Text('No comment'),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

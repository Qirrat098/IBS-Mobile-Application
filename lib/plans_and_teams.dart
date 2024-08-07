import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Plans_and_Teams/All_focus_areas.dart';
import 'Plans_and_Teams/All_plans.dart';
import 'Plans_and_Teams/All_teams.dart';
import 'Plans_and_Teams/One_Page_plans.dart';
import 'Tab_indicator.dart';
import 'drawer_menu.dart';

class PlansandTeams extends StatefulWidget {
  const PlansandTeams({Key? key}) : super(key: key);

  @override
  _PlansandTeamsState createState() => _PlansandTeamsState();
}

class _PlansandTeamsState extends State<PlansandTeams> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final double appBarPadding = 20.0;
  late TabController _tabController;
  String _selectedTabText = 'All Plans'; // Default text

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    // Listen to tab changes
    _tabController.addListener(() {
      setState(() {
        switch (_tabController.index) {
          case 0:
            _selectedTabText = 'All Plans';
            break;
          case 1:
            _selectedTabText = 'All Teams';
            break;
          case 2:
            _selectedTabText = 'All Focus Areas';
            break;
          case 3:
            _selectedTabText = 'One Page Plans';
            break;
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF333452),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DrawerMenu()),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/1.png',
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFF8F9FA),
            child: Padding(
              padding: EdgeInsets.all(appBarPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(
                        'Plans and Teams',
                        style: GoogleFonts.nunito(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: CustomTabIndicator(
                color: Color(0xFFE94CD9),
                width: 80.0, // Adjust the width here
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              labelStyle: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
              tabs: [
                Tab(child: Align(alignment: Alignment.center, child: Text('All Plans'))),
                Tab(child: Align(alignment: Alignment.center, child: Text('All Teams'))),
                Tab(child: Align(alignment: Alignment.center, child: Text('All Focus \n   Areas'))),
                Tab(child: Align(alignment: Alignment.center, child: Text('One Page \n    Plans'))),
              ],
            ),
          ),
          Container(
            color: Color(0xFFF8F9FA),
            child: Padding(
              padding: EdgeInsets.all(appBarPadding),
              child: Row(
                children: [
                  Text(
                    _selectedTabText,
                    style: GoogleFonts.nunito(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 20,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AllPlansTab(),
                AllTeamsTab(),
                AllFocusAreasTab(),
                OnePagePlansTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

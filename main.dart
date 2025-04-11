import 'package:flutter/material.dart';
import 'screens/chats_screen.dart';
import 'screens/status_screen.dart';
import 'screens/calls_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.tealGreen,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.tealGreen,
          secondary: AppColors.lightGreen,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.tealGreenDark,
          elevation: 0,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Colors.white),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.tealGreen,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : const Text('WhatsApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = true;
              });
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu selections
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'New group',
                  child: Text('New group'),
                ),
                const PopupMenuItem(
                  value: 'New broadcast',
                  child: Text('New broadcast'),
                ),
                const PopupMenuItem(
                  value: 'Linked devices',
                  child: Text('Linked devices'),
                ),
                const PopupMenuItem(
                  value: 'Starred messages',
                  child: Text('Starred messages'),
                ),
                const PopupMenuItem(value: 'Settings', child: Text('Settings')),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            _buildTab(Icons.camera_alt, ""),
            _buildTab(null, "CHATS"),
            _buildTab(null, "STATUS"),
            _buildTab(null, "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text("Camera")),
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: AppColors.tealGreenDark),
              child: Text(
                'WhatsApp Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('New Group'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to new group screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.archive),
              title: const Text('Archived'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to archived chats screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Starred Items'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to starred items screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: const TextStyle(color: Colors.white60),
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            setState(() {
              _searchController.clear();
              _isSearching = false;
            });
          },
        ),
      ),
      style: const TextStyle(color: Colors.white),
      onChanged: (value) {
        // Perform search
      },
    );
  }

  Widget _buildTab(IconData? icon, String text) {
    return Tab(icon: icon != null ? Icon(icon) : null, text: text);
  }
}

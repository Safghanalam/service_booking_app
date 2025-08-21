import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../profile/views/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int _selectedCategoryIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: _buildPageContent(), // 👈 Switch pages
      ),

      /// Floating middle button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: const Icon(Icons.cut, color: AppColors.primary, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /// Bottom navigation
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home_outlined, "Home", 0),
                  _buildNavItem(Icons.map_outlined, "Explore", 1),
                  const SizedBox(width: 40),
                  _buildNavItem(Icons.message_outlined, "Message", 3),
                  _buildNavItem(Icons.person_outline, "Account", 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// --------------------
  /// Page Switching
  /// --------------------
  Widget _buildPageContent() {
    switch (_selectedIndex) {
      case 0:
      // Full Home Page with categories
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top bar + Search bar
                _buildHomeTopBar(),
                const SizedBox(height: 20),

                /// Category Tabs
                /// Category Tabs (Home Page)
                CategoryTabs(
                  activeIndex: _selectedCategoryIndex,   // ✅ changed from selectedIndex
                  onChanged: (index) {                   // ✅ changed from onTabSelected
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                ),

                const SizedBox(height: 20),

                /// Category specific content
                _buildCategoryContent(_selectedCategoryIndex),
              ],
            ),
          ),
        );

      case 1:
      // Explore Page
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Explore Nearby Shops 🗺️",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    _buildShopCard('assets/images/pnb-pony.webp'),
                    _buildShopCard('assets/images/trimx.webp'),
                    _buildShopCard('assets/images/showmen.webp'),
                    _buildShopCard('assets/images/cheapandbest.webp'),
                  ],
                ),
              ],
            ),
          ),
        );

      case 2:
      // Message Page
        return const Center(
          child: Text(
            "Trim 💬",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );

      case 3:
      // Message Page
        return const Center(
          child: Text(
            "Messages 💬",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );

      case 4:
      // Account Page
        return const Center(
          child: Text(
            "My Account 👤",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  /// --------------------
  /// Home Top Bar (logo, search bar, notifications)
  /// --------------------
  Widget _buildHomeTopBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Image.asset('assets/images/urban.png', height: 50),
                ),
                const Text(
                  "Urban Trim",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.notifications_none, color: Color(0xFF8A4F4F)),
                IconButton(
                  icon: const Icon(Icons.person_outline, color: Color(0xFF8A4F4F)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 5),

        /// Search bar
        TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: const Color(0xFFF4F5F7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
          cursorColor: AppColors.primary,
        ),
      ],
    );
  }

  /// --------------------
  /// Category Specific Content
  /// --------------------
  Widget _buildCategoryContent(int index) {
    switch (index) {
      case 0:
        return _buildHaircutContent();
      case 1:
        return const Center(child: Text("Beard Content 🧔"));
      case 2:
        return const Center(child: Text("Spa Content 💆"));
      case 3:
        return const Center(child: Text("Facial Content 💆"));
      case 4:
        return const Center(child: Text("Styling Content 💆"));
      default:
        return const SizedBox.shrink();
    }
  }

  /// Haircut Content
  Widget _buildHaircutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF8A4F4F),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/barber.png",
                    height: 150,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Haircut",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 6),
                  const Text("50% off",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text("Feb 14 - Mar 24",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Get Offer Now",
                            style:
                            TextStyle(color: Colors.black, fontSize: 14)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward,
                            color: Colors.black, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
        const Text("Hairstyles",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary)),
        const SizedBox(height: 12),

        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildHairStyleCard('assets/images/buzz-cut1.webp', 'Buzz cut'),
              _buildHairStyleCard('assets/images/crew-cut1.webp', 'Crew cut'),
              _buildHairStyleCard('assets/images/quiff1.webp', 'Quiff'),
              _buildHairStyleCard('assets/images/undercut1.jpg', 'Undercut'),
            ],
          ),
        ),

        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Nearby Barbershops",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("view all",
                style: TextStyle(
                    color: Color(0xFF8A4F4F), fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 12),

        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildShopCard('assets/images/pnb-pony.webp'),
            _buildShopCard('assets/images/trimx.webp'),
            _buildShopCard('assets/images/showmen.webp'),
            _buildShopCard('assets/images/cheapandbest.webp'),
          ],
        ),
      ],
    );
  }

  /// Hairstyle Card
  static Widget _buildHairStyleCard(String image, String title) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(8),
      child: Text(title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  /// Shop Card
  static Widget _buildShopCard(String image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }

  /// Bottom Nav Item
  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 24,
              color: isSelected ? const Color(0xFF8A4F4F) : AppColors.primary),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? const Color(0xFF8A4F4F) : AppColors.primary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

/// --------------------
/// Category Tabs Widget
/// --------------------
class CategoryTabs extends StatefulWidget {
  final int activeIndex;
  final Function(int) onChanged;

  const CategoryTabs({
    super.key,
    required this.activeIndex,
    required this.onChanged,
  });

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  final List<String> categories = [
    "Haircut",
    "Coloring",
    "Facials",
    "Shavings",
    "Styling", // <-- Added new tab
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            final bool isActive = widget.activeIndex == index;
            return GestureDetector(
              onTap: () => widget.onChanged(index),
              child: Container(
                margin: const EdgeInsets.only(right: 24), // spacing between tabs
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isActive
                            ? const Color(0xFF8A4F4F) // Active color
                            : AppColors.primary, // Inactive color
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (isActive)
                      Container(
                        height: 2.5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8A4F4F),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}


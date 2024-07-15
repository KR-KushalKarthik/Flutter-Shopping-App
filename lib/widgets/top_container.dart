import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TopContainer extends StatefulWidget {
  final String title;
  final String searchBarTitle;

  const TopContainer({
    Key? key,
    required this.title,
    required this.searchBarTitle,
  }) : super(key: key);

  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  List<String> recentSearches = [];
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void addToRecentSearches(String searchTerm) {
    if (!recentSearches.contains(searchTerm)) {
      setState(() {
        recentSearches.insert(0, searchTerm);
        if (recentSearches.length > 5) {
          recentSearches.removeLast();
        }
      });
    }
  }

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: buildContainer(),
        );
      },
    );
  }

  Widget buildContainer() {
    return Column(
      children: [
        // Title and Dark Mode Button
        Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: Colors.black87, // Adjust icon color for dark mode
              ),
              onPressed: () {
                toggleDarkMode();
              },
            ),
          ],
        ),

        // Search Bar
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isDarkMode
                ? Colors.black87
                : Colors.grey
                    .withOpacity(0.8), // Adjust search bar color for dark mode
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.search,
                size: 20,
                color: isDarkMode
                    ? Colors.white
                    : Colors.black, // Adjust icon color for dark mode
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  style: TextStyle(
                      color: isDarkMode
                          ? Colors.white
                          : Colors.black), // Adjust text color for dark mode
                  decoration: InputDecoration(
                    hintText: widget.searchBarTitle,
                    hintStyle: TextStyle(
                        color: isDarkMode
                            ? Colors.white70
                            : Colors
                                .black54), // Adjust hint text color for dark mode
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    addToRecentSearches(value);
                    print(" searched name is : $value");
                  },
                ),
              ),
            ],
          ),
        ),

        // Recent Searches
        if (recentSearches.isNotEmpty)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Recent Searches',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: recentSearches.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(recentSearches[index]),
                      onTap: () {
                        // Handle tapping on recent search item
                        print('Tapped on ${recentSearches[index]}');
                      },
                    );
                  },
                ),
              ],
            ),
          ),

        // Horizontal Scrollable List of New Arrivals
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'New Arrivals', // Add the title here
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? Colors.black87
                            : Colors.grey.withOpacity(
                                0.3), // Adjust container color for dark mode
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: getPopularItemImage(index),
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Advertisement Banner
        GestureDetector(
          onTap: () {
            // Handle advertisement click event here
            print('Advertisement clicked!');
          },
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.grey.withOpacity(0.7)
                    : Colors.blueGrey.withOpacity(
                        0.5), // Adjust container color for dark mode
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Add your advertisement content here
                  Image.asset('assets/app3.png'), // Example image
                  SizedBox(height: 10),
                  Text(
                    'Check out our latest deals!',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getPopularItemImage(int index) {
    // Replace with URLs or local asset paths for different images
    switch (index) {
      case 0:
        return 'assets/N.png';
      case 1:
        return 'assets/S.jpg';
      case 2:
        return 'assets/P.png';
      case 3:
        return 'assets/backkkk.png';
      case 4:
        return 'assets/backc.png';
      default:
        return 'assets/D.png';
    }
  }
}

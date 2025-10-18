import 'package:flutter/material.dart';
import 'package:watch_store_app/models/watch.dart';
import 'package:watch_store_app/utils/constants.dart';
import 'package:watch_store_app/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Smart Watch';
  String _searchQuery = '';
  bool _isGridView = true;
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = [
    'Smart Watch',
    'Apple',
    'Samsung',
    'Xiaomi',
    'Huawei',
  ];

  List<Watch> get _filteredWatches {
    List<Watch> filtered = watches;

    // Category filter
    if (_selectedCategory != 'Smart Watch') {
      filtered = filtered
          .where((watch) => watch.brand == _selectedCategory)
          .toList();
    }

    // Search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((watch) {
        final nameLower = watch.name.toLowerCase();
        final brandLower = watch.brand.toLowerCase();
        final queryLower = _searchQuery.toLowerCase();
        return nameLower.contains(queryLower) ||
            brandLower.contains(queryLower);
      }).toList();
    }

    return filtered;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Find your suitable\nwatch now.',
                style: AppStyles.titleStyle,
              ),
              const SizedBox(height: 16),
              // Search Bar Row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search Product',
                          hintStyle: TextStyle(
                            color: Color(0xFFB4B4B4),
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFFB4B4B4),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Icon(
                      _isGridView
                          ? Icons.grid_view_rounded
                          : Icons.list_alt_rounded,
                      color: Colors.grey[700],
                      size: 27,
                    ),
                    onPressed: () {
                      setState(() {
                        _isGridView = !_isGridView;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Category Tabs
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    final isSelected = category == _selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              category,
                              style: isSelected
                                  ? AppStyles.categoryActiveStyle.copyWith(
                                      color: const Color(0xFF6C63FF),
                                    )
                                  : AppStyles.categoryStyle,
                            ),
                            const SizedBox(height: 4),
                            if (isSelected)
                              Container(
                                height: 2,
                                width: category.length * 8.0,
                                color: const Color(0xFF6C63FF),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              // Product Grid/List
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _isGridView
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 15,
                              ),
                          itemCount: _filteredWatches.length,
                          itemBuilder: (context, index) {
                            return ProductCard(watch: _filteredWatches[index]);
                          },
                        )
                      : ListView.builder(
                          itemCount: _filteredWatches.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ProductCard(
                                watch: _filteredWatches[index],
                                isListView: true,
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

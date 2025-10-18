import 'package:flutter/material.dart';
import 'package:watch_store_app/models/watch.dart';
import 'package:watch_store_app/utils/constants.dart';
import 'package:watch_store_app/widgets/custom_toast.dart';

class DetailsScreen extends StatefulWidget {
  final Watch watch;

  const DetailsScreen({super.key, required this.watch});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isFavorite = false;
  int _selectedColorIndex = 1;
  String _selectedTab = 'Details';
  int _currentImageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Color _getColorFromName(String colorName) {
    final colorMap = {
      'Silver': const Color(0xFFC0C0C0),
      'Bright Orange': const Color(0xFFFF6B35),
      'Starlight': const Color(0xFFFFF5E1),
      'Black': const Color(0xFF000000),
      'Pink Gold': const Color(0xFFB76E79),
      'Grey': const Color(0xFF808080),
      'Gold': const Color(0xFFFFD700),
      'Green': const Color(0xFF4CAF50),
      'Midnight': const Color(0xFF191970),
      'Red': const Color(0xFFFF0000),
      'Ivory': const Color(0xFFFFFFF0),
      'Navy': const Color(0xFF000080),
      'Brown': const Color(0xFF8B4513),
      'White': const Color(0xFFFFFFFF),
    };
    return colorMap[colorName] ?? AppColors.gray;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.dark),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : AppColors.dark,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });

              // Show toast notification
              CustomToast.showFavorite(
                context,
                _isFavorite
                    ? '${widget.watch.name} added to favorites!'
                    : '${widget.watch.name} removed from favorites',
                _isFavorite,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Section with PageView
            SizedBox(
              height: 300,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
                itemCount: widget.watch.gallery.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Hero(
                      tag: index == 0
                          ? widget.watch.imageUrl
                          : '${widget.watch.imageUrl}_$index',
                      child: Image.network(
                        widget.watch.gallery[index],
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),

            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(widget.watch.gallery.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == _currentImageIndex
                          ? AppColors.primaryPurple
                          : AppColors.gray.withOpacity(0.3),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.watch.name,
                              style: AppStyles.detailsTitleStyle,
                            ),
                            Text(
                              '(With solo loop)',
                              style: AppStyles.subtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFBF0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.watch.rating.toString(),
                              style: AppStyles.bodyStyle.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Colors Section
                  Text(
                    'Colors',
                    style: AppStyles.tabStyle.copyWith(
                      color: AppColors.dark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: widget.watch.colors.asMap().entries.map((
                        entry,
                      ) {
                        int idx = entry.key;
                        String color = entry.value;
                        bool isSelected = idx == _selectedColorIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColorIndex = idx;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primaryPurple
                                    : AppColors.gray.withOpacity(0.3),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _getColorFromName(color),
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  color,
                                  style: AppStyles.colorChipStyle.copyWith(
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tabs Section
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 'Details';
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'Details',
                              style: AppStyles.tabStyle.copyWith(
                                color: _selectedTab == 'Details'
                                    ? AppColors.primaryPurple
                                    : AppColors.gray,
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (_selectedTab == 'Details')
                              Container(
                                height: 2,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryPurple,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 'Review';
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'Review',
                              style: AppStyles.tabStyle.copyWith(
                                color: _selectedTab == 'Review'
                                    ? AppColors.primaryPurple
                                    : AppColors.gray,
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (_selectedTab == 'Review')
                              Container(
                                height: 2,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryPurple,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (_selectedTab == 'Details')
                    Text(
                      widget.watch.description,
                      style: AppStyles.descriptionStyle,
                    )
                  else
                    Text(
                      'No reviews available yet.',
                      style: AppStyles.descriptionStyle,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            CustomToast.showCart(
              context,
              '${widget.watch.name} added to cart!',
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                'Add to Cart | \$${widget.watch.price.toStringAsFixed(2)}',
                style: AppStyles.priceStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

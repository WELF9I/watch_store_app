import 'package:flutter/material.dart';
import 'package:watch_store_app/models/watch.dart';
import 'package:watch_store_app/screens/details_screen.dart';
import 'package:watch_store_app/utils/constants.dart';

class ProductCard extends StatefulWidget {
  final Watch watch;
  final bool isListView;

  const ProductCard({super.key, required this.watch, this.isListView = false});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(watch: widget.watch),
          ),
        );
      },
      onTapDown: (_) => setState(() => _scale = 0.95), // Scale down on press
      onTapUp: (_) => setState(() => _scale = 1.0), // Scale back on release
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_scale),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: widget.isListView ? _buildListView() : _buildGridView(),
      ),
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: widget.watch.imageUrl, // For animation to details
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.watch.imageUrl,
                    fit: BoxFit.contain,
                    height: 120,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.watch.name,
            style: AppStyles.productNameStyle,
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            widget.watch.brand,
            style: AppStyles.brandStyle,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8),
          Text(
            '\$${widget.watch.price.toStringAsFixed(2)}',
            style: AppStyles.priceStyle,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Image section
          Hero(
            tag: widget.watch.imageUrl, // For animation to details
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Image.network(widget.watch.imageUrl, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 16),
          // Details section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.watch.name,
                  style: AppStyles.productNameStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(widget.watch.brand, style: AppStyles.brandStyle),
                const SizedBox(height: 12),
                Text(
                  '\$${widget.watch.price.toStringAsFixed(2)}',
                  style: AppStyles.priceStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
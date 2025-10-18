import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watch_store_app/models/watch.dart';

class AppColors {
  static const primaryPurple = Color(0xFF6C63FF);
  static const dark = Color(0xFF000000);
  static const gray = Color(0xFFB4B4B4);
  static const searchGray = Color(0xFF888888);
  static const secondaryDark = Color(0xFF201759);
  static const black = Color(0xFF090715);
  static const lightGray = Color(0xFFF5F5F5);
}

class AppStyles {
  static final titleStyle = GoogleFonts.raleway(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.dark,
    height: 1.3,
  );

  static final bodyStyle = GoogleFonts.raleway(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
  );

  static final categoryStyle = GoogleFonts.raleway(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
  );

  static final categoryActiveStyle = GoogleFonts.raleway(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
  );

  static final productNameStyle = GoogleFonts.raleway(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.dark,
  );

  static final brandStyle = GoogleFonts.raleway(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.searchGray,
  );

  static final priceStyle = GoogleFonts.raleway(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryPurple,
  );

  static final detailsTitleStyle = GoogleFonts.raleway(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.dark,
  );

  static final subtitleStyle = GoogleFonts.raleway(
    fontSize: 14,
    color: AppColors.gray,
  );

  static final descriptionStyle = GoogleFonts.raleway(
    fontSize: 14,
    color: AppColors.searchGray,
    height: 1.5,
  );

  static final tabStyle = GoogleFonts.raleway(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final colorChipStyle = GoogleFonts.raleway(
    fontSize: 14,
    color: AppColors.dark,
  );
}

// Static local data
const List<Watch> watches = [
  Watch(
    name: 'Apple Watch SE Gen 2',
    brand: 'Apple',
    price: 349.99,
    imageUrl: 'assets/images/Apple Watch SE Gen 2.jpg',
    description:
        'The aluminum case is lightweight and made from 100 percent recycled aerospace grade alloy.',
    rating: 4.9,
    colors: ['Silver', 'Bright Orange', 'Starlight'],
    gallery: [
      'assets/images/Apple Watch SE Gen 2.jpg',
      'assets/images/Galaxy Watch 4.jpg',
    ],
  ),
  Watch(
    name: 'Galaxy Watch 4',
    brand: 'Samsung',
    price: 249.99,
    imageUrl: 'assets/images/Galaxy Watch 4.jpg',
    description:
        'Advanced health monitoring and seamless integration with Android devices.',
    rating: 4.5,
    colors: ['Black', 'Silver', 'Pink Gold'],
    gallery: [
      'assets/images/Galaxy Watch 4.jpg',
      'assets/images/Apple Watch SE Gen 2.jpg',
    ],
  ),
  Watch(
    name: 'Amazfit GTS 2',
    brand: 'Amazfit',
    price: 199.99,
    imageUrl: 'assets/images/Amazfit GTS 2.jpg',
    description: 'Sleek design with long battery life and built-in GPS.',
    rating: 4.3,
    colors: ['Grey', 'Black', 'Gold'],
    gallery: [
      'assets/images/Amazfit GTS 2.jpg',
      'assets/images/Galaxy Watch 7.jpg',
    ],
  ),
  Watch(
    name: 'Galaxy Watch 7',
    brand: 'Samsung',
    price: 279.99,
    imageUrl: 'assets/images/Galaxy Watch 7.jpg',
    description: 'Latest model with enhanced AI features and health tracking.',
    rating: 4.7,
    colors: ['Green', 'Silver', 'Black'],
    gallery: [
      'assets/images/Galaxy Watch 7.jpg',
      'assets/images/Galaxy Watch 4.jpg',
    ],
  ),
  Watch(
    name: 'Apple Watch Series 8',
    brand: 'Apple',
    price: 429.99,
    imageUrl: 'assets/images/Apple Watch SE Gen 2.jpg',
    description: 'Advanced sensors for temperature and crash detection.',
    rating: 4.8,
    colors: ['Midnight', 'Starlight', 'Red'],
    gallery: [
      'assets/images/Apple Watch SE Gen 2.jpg',
      'assets/images/Amazfit GTS 2.jpg',
    ],
  ),
  Watch(
    name: 'Mi Watch Lite',
    brand: 'Xiaomi',
    price: 149.99,
    imageUrl: 'assets/images/Amazfit GTS 2.jpg',
    description: 'Affordable smartwatch with heart rate monitoring and GPS.',
    rating: 4.2,
    colors: ['Black', 'Ivory', 'Navy'],
    gallery: [
      'assets/images/Amazfit GTS 2.jpg',
      'assets/images/Galaxy Watch 7.jpg',
    ],
  ),
  Watch(
    name: 'Huawei Watch GT 3',
    brand: 'Huawei',
    price: 299.99,
    imageUrl: 'assets/images/Galaxy Watch 7.jpg',
    description: 'Long battery life with professional sports modes.',
    rating: 4.6,
    colors: ['Black', 'Brown', 'White'],
    gallery: [
      'assets/images/Galaxy Watch 7.jpg',
      'assets/images/Galaxy Watch 4.jpg',
    ],
  ),
];

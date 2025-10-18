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
  static final titleStyle = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.dark,
    height: 1.3,
  );

  static final bodyStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
  );

  static final categoryStyle = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
  );

  static final categoryActiveStyle = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
  );

  static final productNameStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.dark,
  );

  static final brandStyle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.searchGray,
  );

  static final priceStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryPurple,
  );
}

// Static local data
const List<Watch> watches = [
  Watch(
    name: 'Apple Watch SE',
    brand: 'Apple',
    price: 349.99,
    imageUrl:
        'https://thewatchstrap.co/wp-content/uploads/2020/11/Silicone-Solo-Loop-Apple-Watch-Orange-669x608.jpg',
  ),
  Watch(
    name: 'Galaxy Watch 4',
    brand: 'Samsung',
    price: 249.99,
    imageUrl: 'https://m.media-amazon.com/images/I/61em2RBifsL.jpg',
  ),
  Watch(
    name: 'Amazfit GTS 2',
    brand: 'Amazfit',
    price: 199.99,
    imageUrl:
        'https://m.media-amazon.com/images/I/610FHtXsfnL._UF894,1000_QL80_.jpg',
  ),
  Watch(
    name: 'Galaxy Watch 7',
    brand: 'Samsung',
    price: 279.99,
    imageUrl:
        'https://m.media-amazon.com/images/I/71E8iEWXY9L._AC_UF894,1000_QL80_.jpg',
  ),
  Watch(
    name: 'Apple Watch Series 8',
    brand: 'Apple',
    price: 429.99,
    imageUrl:
        'https://thewatchstrap.co/wp-content/uploads/2020/11/Silicone-Solo-Loop-Apple-Watch-Orange-669x608.jpg',
  ),
  Watch(
    name: 'Mi Watch Lite',
    brand: 'Xiaomi',
    price: 149.99,
    imageUrl:
        'https://m.media-amazon.com/images/I/610FHtXsfnL._UF894,1000_QL80_.jpg',
  ),
  Watch(
    name: 'Huawei Watch GT 3',
    brand: 'Huawei',
    price: 299.99,
    imageUrl:
        'https://m.media-amazon.com/images/I/71E8iEWXY9L._AC_UF894,1000_QL80_.jpg',
  ),
];

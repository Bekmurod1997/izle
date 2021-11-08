import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/services/all_services.dart';

// ignore: must_be_immutable
class ProductItem extends StatefulWidget {
  bool isFavorite;
  String? imageUrl;
  String? cityName;
  String? title;
  String? price;
  String? date;
  int id;

  ProductItem({
    required this.title,
    required this.price,
    required this.cityName,
    required this.imageUrl,
    required this.date,
    required this.isFavorite,
    required this.id,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  Set<int> favoriteIndex = Set<int>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorPalate.addsBackgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.162,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorPalate.addsBackgroundColor,
            ),
            child: Image.network(
              'http://izle.uz/' + widget.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        widget.title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: FontStyles.semiBoldStyle(
                            fontSize: 13,
                            fontFamily: 'Lato',
                            color: Colors.black),
                        // textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('id');
                        print(widget.id);
                        setState(
                          () {
                            widget.isFavorite = !widget.isFavorite;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(widget.isFavorite
                                    ? "Добавлено в список избранных"
                                    : "Удалено в список избранных")));
                          },
                        );
                        AllServices.addAndRemoveFav(widget.id);
                      },
                      child: widget.isFavorite
                          ? SvgPicture.asset('assets/icons/star_active.svg')
                          : SvgPicture.asset(
                              'assets/icons/star.svg',
                              color: ColorPalate.mainColor,
                            ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    widget.price!,
                    style: FontStyles.blackStyle(
                        fontSize: 14,
                        fontFamily: 'Lato',
                        color: Colors.black87),
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  widget.cityName!,
                  style: FontStyles.regularStyle(
                    fontSize: 13,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.date!,
                  style: FontStyles.regularStyle(
                    fontSize: 13,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

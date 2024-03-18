import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:amaze/model.dart';

class ProdList extends StatefulWidget {
  List<ProdModel> prodlist;

  ProdList({
    Key? key,
    required this.prodlist,
  }) : super(key: key);

  @override
  State<ProdList> createState() => _ProdListState();
}

class _ProdListState extends State<ProdList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: widget.prodlist.length,
        itemBuilder: (context, index) {
          ProdModel model = widget.prodlist[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Price: \$${model.price}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Discount: ${model.disc}',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 16),
                    // Image section
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey, // Placeholder color
                      ),
                      // Placeholder for image
                      child: Center(
                        child: CachedNetworkImage(imageUrl: "${model.image}"),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Implement buy now action here
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber),
                          ),
                          child: Text('Add to Cart'),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Implement buy now action here
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber),
                          ),
                          child: Text('Buy Now'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:billingsoftware/src/models/total_product_model.dart';

class ProductDropdownTextField extends StatefulWidget {
  final List<TotalProduct> products;
  final ValueChanged<TotalProduct?> onChanged;

  const ProductDropdownTextField({
    super.key,
    required this.products,
    required this.onChanged,
  });

  @override
  State<ProductDropdownTextField> createState() =>
      _ProductDropdownTextFieldState();
}

class _ProductDropdownTextFieldState extends State<ProductDropdownTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  List<TotalProduct> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = widget.products;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry!);
      } else {
        _overlayEntry?.remove();
        _overlayEntry = null;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _overlayEntry?.dispose();
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: Material(
          elevation: 4.0,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: _filteredProducts
                .map((product) => ListTile(
                      title: Text(product.productName),
                      onTap: () {
                        setState(() {
                          _controller.text = product.productName;
                          widget.onChanged(product);
                          _focusNode.unfocus();
                          _overlayEntry?.remove();
                          _overlayEntry = null;
                        });
                      },
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
  void _filterProducts(String query) {
    final filtered = widget.products
        .where((product) =>
            product.productName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _filteredProducts = filtered;
      _overlayEntry?.remove();
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: 'Product Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (value) {
        _filterProducts(value);
      },
    );
  }
}

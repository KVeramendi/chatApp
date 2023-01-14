import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  const SearchWidget({Key? key, required this.text, required this.onChanged})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final style = widget.text.isEmpty
        ? const TextStyle(color: Colors.black45)
        : const TextStyle(color: Colors.black87);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 42.0,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          hintText: 'Buscar',
          hintStyle: style,
          suffixIcon: widget.text.isNotEmpty
              ? InkWell(
                  child: Icon(Icons.close_rounded, color: style.color),
                  onTap: () {
                    _controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}

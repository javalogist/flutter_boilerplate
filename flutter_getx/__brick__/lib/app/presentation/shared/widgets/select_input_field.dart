import 'package:flutter/material.dart';

class SelectOrInputField extends StatefulWidget {
  final String? title;
  final ValueChanged<String> onChanged;
  final List<String> values;

  const SelectOrInputField(
      {super.key, this.title, required this.onChanged, required this.values});

  @override
  _SelectOrInputFieldState createState() => _SelectOrInputFieldState();
}

class _SelectOrInputFieldState extends State<SelectOrInputField> {
  final TextEditingController _controller = TextEditingController();
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onChanged(_controller.text);
    });
  }

// Method to show dropdown
  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Rounded corners
          ),
          child: Container(
            padding: EdgeInsets.all(16.0), // Add some padding
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // Adjust height according to content
                children: [
                  Text('Choose Number',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10), // Space between title and options
                  ListView.builder(
                    shrinkWrap: true,
                    // Prevent the ListView from taking up infinite height
                    physics: NeverScrollableScrollPhysics(),
                    // Disable scrolling on ListView
                    itemCount: widget.values.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${widget.values[index]}"),
                        onTap: () {
                          setState(() {
                            _selectedValue = widget.values[index].toString();
                            _controller.text = _selectedValue!;
                          });
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.title ?? 'Select an option',
        suffixIcon: GestureDetector(
          onTap: () => _showDropdown(context),
          child: Icon(Icons.arrow_drop_down),
        ),
      ),
      onTap: () {
        // Select all text when the text field is tapped
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
      },
    );
  }
}

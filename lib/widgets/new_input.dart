import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import './transaction_list.dart';

class NewInput extends StatefulWidget {
  // const NewInput({super.key});
  final Function addItem;

  NewInput(this.addItem);

  @override
  State<NewInput> createState() => _NewInputState();
}

class _NewInputState extends State<NewInput> {
  final _amountControler = TextEditingController();
  final _tilteControler = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final amountData = double.parse(_amountControler.text);
    final titleData = _tilteControler.text;

    if (amountData <= 0 || titleData.isEmpty || _selectedDate == null) {
      // print("Returned");
      return;
    }
    widget.addItem(titleData, amountData, _selectedDate);
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null)
        return;
      else
        setState(() {
          _selectedDate = pickedDate;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            children: [
              TextField(
                // Amount text field
                decoration: InputDecoration(
                  labelText: 'Amount',
                  // errorText: "Invalid",
                  icon: Icon(
                    Icons.add_card_sharp,
                  ),
                ),
                controller:
                    _amountControler, // onChanged: (amount) => inputAmount = amount, // using annymus fun
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                // Title text field
                decoration: InputDecoration(
                  labelText: 'Title',
                  icon: Icon(
                    Icons.post_add_rounded,
                  ),
                  // errorText: "Invalid Input",
                ),
                controller: _tilteControler,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        child: Text((_selectedDate == null)
                            ? "Choose Date.."
                            : "Picked Date :${DateFormat.yMd().format(_selectedDate ?? DateTime.now())}")),
                    // ElevatedButton(onPressed: startDate, child: Text("Choose Date")),
                    ElevatedButton(
                        onPressed: _presentDatePicker,
                        child: Text("Choose Date")),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  // style: ButtonStyle,
                  onPressed: _submitData,
                  child: Text("Add to List"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

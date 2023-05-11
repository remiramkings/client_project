import 'package:flutter/material.dart';

class AlertContent extends StatefulWidget {
  @override
  State<AlertContent> createState() => AlertContentState();
}

class AlertContentState extends State<AlertContent> {
  bool isTrue = false;
  String? selectedContactType;
  var contactTypes = ['Home', 'Office', 'Personal'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown)),
                hintText: 'Contact Name',
                suffixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                )),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown)),
                    hintText: 'Mobile Number',
                    labelText: 'Mobile Number',
                  ),
                ),
              ),
              Checkbox(
                value: isTrue,
                onChanged: (bool? value) {
                  setState(() {
                    isTrue = value!;
                  });
                },
              ),
              SizedBox(
                width: 25,
                child: Image.asset('assets/images/whatapp.png'),
              )
            ],
          ),
          SizedBox(height: 10),
          Align(alignment: Alignment.centerLeft, child: Text('Contact type:')),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: DropdownMenu<String>(
              width: 232,
                inputDecorationTheme: const InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown)),
                    isCollapsed: false),
                dropdownMenuEntries: contactTypes.map((String item) {
                  return DropdownMenuEntry(
                    value: item,
                    label: item,
                  );
                }).toList(),
                onSelected: (String? newValue) {
                  setState(() {
                    selectedContactType = newValue!;
                  });
                },
                initialSelection: selectedContactType,
                label: const Text('Select type')),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: 'Email',
                labelText: 'Email',
              ),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(onPressed: () {}, child: Text('ADD')))
        ],
      ),
    );
  }
}

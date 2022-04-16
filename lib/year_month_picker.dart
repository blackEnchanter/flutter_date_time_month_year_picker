import 'package:flutter/material.dart';

class YearMonthPicker extends StatefulWidget {
  const YearMonthPicker({Key? key}) : super(key: key);

  @override
  State<YearMonthPicker> createState() => _YearMonthPickerState();
}

class _YearMonthPickerState extends State<YearMonthPicker> {
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  late String year, month, yearMonthDay, yearMonthDayTime;
  TextEditingController yController = TextEditingController();
  TextEditingController mController = TextEditingController();
  TextEditingController ymdController = TextEditingController();
  TextEditingController ymdtController = TextEditingController();
  bool autovalidate = false;

  yearPicker() {
    final year = DateTime.now().year;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Please enter the start year',
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: MediaQuery.of(context).size.height / 4.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[200],
            child: YearPicker(
              selectedDate: DateTime(year - 10),
              firstDate: DateTime(year - 10),
              lastDate: DateTime(year + 10),
              onChanged: (value) {
                yController.text = value.toString().substring(0, 4);
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  monthPicker() {
    final year = DateTime.now().year;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Enter start month',
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: MediaQuery.of(context).size.height / 3.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[200],
            child: CalendarDatePicker(
              initialDate: DateTime(year),
              firstDate: DateTime(year),
              lastDate: DateTime(year, 12),
              onDateChanged: (value) {
                mController.text = value.toString().split('-')[1];
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  yearMonthDayPicker() async {
    final year = DateTime.now().year;

    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(year),
      lastDate: DateTime(year + 10),
    );

    if (dateTime != null) {
      ymdController.text = dateTime.toString().split(' ')[0];
    }
  }

  yearMonthDayTimePicker() async {
    final year = DateTime.now().year;
    String hour, min;

    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(year),
      lastDate: DateTime(year + 10),
    );

    if (dateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 0, minute: 0),
      );

      if (pickedTime != null) {
        if (pickedTime.hour < 10) {
          hour = '0' + pickedTime.hour.toString();
        } else {
          hour = pickedTime.hour.toString();
        }

        if (pickedTime.minute < 10) {
          min = '0' + pickedTime.minute.toString();
        } else {
          min = pickedTime.minute.toString();
        }

        ymdtController.text = '${dateTime.toString().split(' ')[0]} $hour:$min';
      }
    }
  }

  submit() {
    setState(() => autovalidate = true);

    if (!_fKey.currentState!.validate()) {
      return;
    }

    _fKey.currentState?.save();

    print('year: $year, month: $month');
    print('year-month-day: $yearMonthDay');
    print('year-month-day-time: $yearMonthDayTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Year, Month Picker'),
      ),
      body: Form(
        key: _fKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: yearPicker,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: yController,
                    decoration: const InputDecoration(
                      labelText: 'Pick Year',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    onSaved: (val) {
                      year = yController.text;
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Year is necessary';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: monthPicker,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: mController,
                    decoration: const InputDecoration(
                      labelText: 'Pick Month',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    onSaved: (val) {
                      month = mController.text;
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Month is necessary';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: yearMonthDayPicker,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: ymdController,
                    decoration: const InputDecoration(
                      labelText: 'Pick Year-Month-Day',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    onSaved: (val) {
                      yearMonthDay = ymdController.text;
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Year-Month-Date is necessary';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: yearMonthDayTimePicker,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: ymdtController,
                    decoration: const InputDecoration(
                      labelText: 'Pick Year-Month-Day-Time',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    onSaved: (val) {
                      yearMonthDayTime = ymdtController.text;
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Year-Month-Date-Time is necessary';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                onPressed: submit,
                color: Colors.indigo,
                textColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: const Text(
                  'Year Picker',
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

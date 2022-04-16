# flutter_date_time_month_year_picker
## A new Flutter project.

- showDatePicker
- showTimePicker
- YearPicker
            - A scrollable list of years to allow picking a year.
            - The year picker widget is rarely used directly. Insted, consider using __showDatePicker__ , which creates a date picker dialog.
            - Requires one of its ancestors to be a __Material__ widget
- Month Picker
              - A scrollable list of months to allow picking a month.
              - Show the days of each month in a rectangular grid with one  column for each day of the week
              - The month picker widget is rarley used directly. Insted, consider using __showDatePicker__, which creates a date picker dialog.

## showDatePicker fuction
```sh
Future<DateTime?> showDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? currentDate,
  DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  SelectableDayPredicate? selectableDayPredicate,
  Locale? locale,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  String? errorFormatText,
  String? errorInvalidText,
  String? fieldHintText,
  String? fieldLabelText,
}) 
```
## YearPicker constructor
```sh
YearPicker({
  Key? key
  required DateTime  selectedDate,
  required valueChanged<DateTime> onChanged,
  required DateTime firstDate,
  required DateTime lastDate,
  DragStartBehaviour dragStartBehavior:DragStartBehavior.start
}) 
```

## MonthPicker constructor
```sh
Month Picker({
  Key? key
  required DateTime  selectedDate,
  required valueChanged<DateTime> onChanged,
  required DateTime firstDate,
  required DateTime lastDate,
  SelectableDayPredicate? selectableDayPredicate,
  DragStartBehaviour dragStartBehavior:DragStartBehavior.start
}) 
```
## Using Time Pickers With Form

Dillinger uses a number of open source projects to work properly:

- As on of form filed
- Enabling error handling
- Making year selection easy in showDatePicker
- Customizing selectable days 

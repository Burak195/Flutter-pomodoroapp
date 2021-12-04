class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> timerlist = AppDataConstanants().timer;

  String _value = AppDataConstanants().timer.first;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.8;
    return Center(
      child: Column(
        children: [
          TextBox(
            labelText: AppDataConstanants().pomodoroname,
            textfieldwidth: width,
            textControl: TextEditingController(),
          ),
          TextBox(
            labelText: "Pomodoro Açıklama",
            textfieldwidth: width,
            textControl: TextEditingController(),
          ),
          selectorTimer(width),
          saveButton(context)
        ],
      ),
    );
  }

  Widget selectorTimer(double width) {
    return Container(
        width: width,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              "Pomodoro Zamanı",
              textAlign: TextAlign.start,
            ),
            DropdownButton(
                onChanged: (val) => {setState(() {})},
                value: _value,
                items: timerlist
                    .map(
                      (item) => DropdownMenuItem(
                        child: Text(item),
                        value: item,
                        onTap: () => setState(() {
                          _value = item;
                        }),
                      ),
                    )
                    .toList())
          ],
        ));
  }

  void savePomodoro() {}
  Widget saveButton(context) {
    return InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Show Snackbar'),
            duration: Duration(seconds: 2),
          ));
        },
        child: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width * 0.7,
          height: 40,
          child: Center(
            child: Text(
              "Kaydet",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ));
  }
}

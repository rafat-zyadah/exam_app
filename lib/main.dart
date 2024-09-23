//import 'package:exam_app/question.dart';
import 'package:flutter/material.dart';
import 'app_brain.dart';
// ignore: unused_import
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('اختبار'),
          backgroundColor: Colors.grey,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  //يفحص الإجابة ويضيف الإيقونة المناسبة لقائمة الإجابات
  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = appBrain.getQuestionAnswer();
    if (whatUserPicked == correctAnswer) {
      appBrain.numberCorrectAnswer++;
      answerResult.add(const Icon(
        Icons.thumb_up,
        color: Colors.green,
        size: 30,
      ));
    } else {
      answerResult.add(
        const Icon(
          Icons.thumb_down,
          color: Colors.red,
          size: 30,
        ),
      );
    }
    if (appBrain.isFinished()) {
      Alert(
        context: context,
        // type: AlertType.error,
        title: "إنتهاء الإختبار",
        desc:
            "لقد أجبت على ${appBrain.numberCorrectAnswer} أسئلة بشكل صحيح من أصل 7",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            width: 120,
            child: const Text(
              "ابدأ من جديد",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
      appBrain.reset();
      answerResult = [];
      //answerResult.removeRange(0, 7);
    } else {
      appBrain.nextQuestion();
    }
  }

  //قائمة الإجابات
  List<Widget> answerResult = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //شريط الإجابات
        Row(
          children: answerResult,
        ),

        //الصورة والسؤال يلي تحتها
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appBrain.getQuestionImage()),
              const SizedBox(
                height: 20,
              ),
              Text(
                appBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 26),
              ),
            ],
          ),
        ),

        //زر صح
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo[700],
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                });
              },
              child: const Text(
                'صح',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),

        //زر خطأ
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                });
              },
              child: const Text(
                'خطأ',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

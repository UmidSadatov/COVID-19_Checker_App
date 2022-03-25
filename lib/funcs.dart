import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Map getTextMap(lang){
  switch(lang){
    case("uz"): {
      return {
        "Start" : "Boshlash",
        "AboutApp" : "Ilova haqida",
        "ChangeLang" : "Tilni o'zgartirish",
        "AboutAppText" : "Bizning Jahon Sog'liqni Saqlash Tashkiloti "
            "tavsiyalariga asoslangan COVID-19 Checker mobil ilovamiz "
            "sizda COVID-19, shamollash yoki gripp xavfini aniqlab, "
            "dastlabki taxminiy tashxis qo'yishga yordam beradi. Vaksina, "
            "simptomlar va boshqalar bilan yaqin masofada bo'lish "
            "haqidagi savollarga javob berib, siz dastlabki taxminiy tashxis "
            "natijasida keyingi harakat choralarini ko'rish bo'yicha "
            "tavsiyalar olasiz.\n\n"
            "Ilovamiz Jahon Sog'liqni Saqlash Tashkiloti ( JSST ) talablariga "
            "javob beradi. ToshPTI Innovatsiya Markazi eng yuqori ilmiy "
            "standartlarga rioya qiladi. COVID-19, shamollash va gripp "
            "bo'yicha differensial tashxis protokoli JSST tavsiyalari "
            "asosida ishlab chiqilgan va sizga eng aniq va tibbiyot "
            "nuqtai-nazaridan isbotlangan ma'lumotlarni taqdim etish "
            "imkonini beradi.",
        "AboutAppTitle" : "Ilova haqida",
        "gender" : "Jinsingiz:",
        "age" : "Yoshingiz",
        "vaccinated" : "Vaksina qabul qildingizmi?",
        "temperature" : "Harorat ko'tarilishi (36,6 gradusdan yuqori)",
        "dry_cough" : "Quruq yo'tal",
        "loss_of_smell" : "Hid yoki ta'm sezishning yo'qolishi",
        "fatigue" : "Charchoq",
        "dyspnea" : "Nafas qisilishi",
        "joint_pain" : "Bo'g'inlarda og'riq",
        "diarrhea" : "Ich ketishi (diareya)",
        "sore_throat" : "Tomoq og'rig'i",
        "headache" : "Bosh og'rig'i",
        "nausea_and_vomiting" : "Ko'ngil aynishi va qayt qilish",
        "skin_rash" : "Teri toshmalari",
        "runny_nose" : "Tumov (burun oqishi)",
        "sneezing" : "Aksirish",
        "conjunctivities" : "Ko'z qizarishi va yoshlanishi (konyuktivit)",
        "eyes_pain" : "Ko'zdagi og'riq",
        "core_pain" : "Qorin og'rig'i",
        "contacted" : "Bemor bilan yaqin masofada muloqotda bo'ldingizmi?",
        "TermsTitle" : "Foydalanish shartlari",
        "TermsText_1" : "Bu so'rovnoma to'liq tashxis qo'yish uchun emas. "
            "Natijalar umumiy ma'lumot berish uchun mo'ljallangan va malakaviy "
            "tibbiy tashxis hisoblanmaydi.",
        "TermsText_2" : "Sog'lingiz o'ta og'ir bo'lgan vaziyatda bu ilovadan "
            "foydalanmang. Agar sizga tez tibbiy yordam kerak bo'lsa, "
            "zudlik bilan 103 raqamiga qo'ng'iroq qiling.",
        "TermsText_3" : "Sizning ma'lumotlaringiz xavsizligi ta'minlanadi. "
            "Siz yuborayotgan ma'lumotlar anonim va ular uchinchi shaxslarga "
            "taqdim etilmaydi.",
        "ReadAndAccept" : "O'qib chiqdim va roziman",
        "PleaseAnswerQuestions" : "Marhamat, quyidagi savollarga javob bering",
        "DoYouHaveFollowingSymptoms" : "Quyidagi simptomlar sizda kuzatilyaptimi?",
        "genders_ans" : ["Erkak", "Ayol"],
        "ages_ans" : ["0-9", "10-19", "20-24", "25-59", "60+"],
        "yes_no_ans" : ["Ha", "Yo'q"],
        "Stop" : "Boshidan boshlash",
        "Results" : "Natija",
        "covid_risk" : "Covid-19 xavfi:",
        "cold_risk" : "Shamollash xavfi:",
        "flu_risk" : "Gripp xavfi:",
        "Recommends" : "Tavsiyalar",

        "RecommendsText_1" : "Shifokor bilan maslahatlashing!\n"
            "Sizda kuzatilayotgan simptomlar shifokor ko'rigidan o'tishingiz zarurligini ko'rsatmoqda. "
            "O'z shifokoringiz qabuliga yoziling. Agar simptomlar kuchayishni boshlasa, darhol shifokorga murojaat eting. \n\n "
            "Tavsiya etiluvchi mutaxassis – LOR.\n\n"
            "Eslatib o'tamiz, yuqorida keltirilgan kasalliklar ehtimolining taqsimotlari "
            "to'liq bo'lmasligi mumkin. Ular faqat ma'lumot berish uchun taqdim etilmoqda "
            "va malakali tibbiy xulosa hisoblanmaydi.\n\n"
            "Sizda kuztilayotgan simptomar COVID-19 kasalligining ehtimoli pastligini "
            "ko'rsatmoqda. Yuqorida ko'rsatilgan tavsiyalarga amal qiling va "
            "aniq tashxis uchun shifokorga murojaat qiling.",

        "RecommendsText_2" : "Shifokor bilan maslahatlashing!\n"
            "Sizda kuzatilayotgan simptomlar shifokor ko'rigidan o'tishingiz zarurligini ko'rsatmoqda. "
            "O'z shifokoringiz qabuliga yoziling. Agar simptomlar kuchayishni boshlasa, darhol shifokorga "
            "murojaat eting. \n\n"
            "Tavsiya etiluvchi mutaxassis – Infeksionist.\n\n"
            "Eslatib o'tamiz, yuqorida keltirilgan kasalliklar ehtimolining taqsimlanishi "
            "to'liq bo'lmasligi mumkin. Ular faqat ma'lumot berish uchun taqdim etilmoqda "
            "va malakali tibbiy xulosa hisoblanmaydi.\n\n"
            "Sizda kuztilayotgan simptomar COVID-19, shamollash va gripp "
            "kasalliklari ehtimoli teng ekanligini "
            "ko'rsatmoqda. Yuqorida ko'rsatilgan tavsiyalarga amal qiling va "
            "aniq tashxis uchun shifokorga murojaat qiling.",

        "RecommendsText_3" : "Shifokor bilan maslahatlashing!\n"
            "Sizda kuzatilayotgan simptomlar shifokor ko'rigidan o'tishingiz zarurligini ko'rsatmoqda. "
            "O'z shifokoringiz qabuliga yoziling. Agar simptomlar kuchayishni boshlasa, darhol shifokorga "
            "murojaat eting. \n\n"
            "Tavsiya etiluvchi mutaxassis – Infeksionist. \n\n"
            "Eslatib o'tamiz, yuqorida keltirilgan kasalliklar ehtimolining taqsimotlari "
            "to'liq bo'lmasligi mumkin. Ular faqat ma'lumot berish uchun taqdim etilmoqda "
            "va malakali tibbiy xulosa hisoblanmaydi.\n\n"
            "Sizda kuztilayotgan simptomar COVID-19 kasalligi xavfi yuqori ekanligini "
            "ko'rsatmoqda. Yuqorida ko'rsatilgan tavsiyalarga amal qiling va "
            "aniq tashxis uchun shifokorga murojaat qiling.",

        "RecommendsText_4" : "Darxol o'zingizni boshqa odamlardan va jonivorlardan uzoqda saqlang. "
            "Iloji boricha uyingizdagi boshqalar kirmaydigan alohida xonada bo'ling. "
            "Agar buning imkoni bo'lmasa, tibbiy niqob taqing va boshqalar bilan 2 metrdan yaqin "
            "masofada bo'lmang. Uy hayvonlariga tegmang.\n\n"
            "Zudlik bilan tez yordam chaqiring. "
            "O'zingiz yashayotgan mamlakatdagi tez tibbiy yordam xizmatini chaqiring. "
            "Sizdagi simptomlar juda og'ir, sizni tibbiy muassasaga yotqizish zarur.\n\n"
            "Niqob taqing. Uyda, biror xonada yoki avtomobilda yoningizda boshqa "
            "Tibbiy muassasaga tashrif buyurganingizda, shuningdek tez yordam mashinasiga chiqishda "
            "niqob taqing. Siz bilan muloqotda bo'layotgan shaxslar ham "
            "albatta niqob taqishlari shart, ayniqsa sizda nafas qisilishi kuzatilsa.",

        "RecommendsText_5" : "Dastlabki tashxisda siz butunlay simptomlar yo'qligini belgiladingiz. Ammo, "
            "epidemiologik vaziyatni hisobga olgan xolda, sizga tibbiy niqob taqishni, "
            "ijtimoiy masofa saqlashni va gavjum joylarda "
            "bo'lmaslikni qat'iy ravishda tavsiya etamiz.",

        "Back" : "Ortga",
        "LeaveFeedback" : "Izoh qoldirish",
      };
    };

    case("ru"): {
      return {
        "Start" : "Начать",
        "AboutApp" : "О приложении",
        "ChangeLang" : "Изменить язык",
        "AboutAppText" : "Наше мобильное приложение COVID-19 Checker, "
            "основанный на рекомендациях ВОЗ, позволяет провести онлайн "
            "самодиагностику на риск наличия заболевания COVID-19, простуды "
            "или гриппа. Ответив на несколько вопросов о симптомах, прививки "
            "и контактах с другими людьми, Вы получите рекомендации "
            "по следующим шагам, которые нужно предпринять по результатам "
            "самодиагностики.\n\n"
            "Наше приложение соответствует требованиям ВОЗ. ИЦ ТашПМИ "
            "придерживается самых высоких научных стандартов. Протокол "
            "дифференциального диагноза COVID-19, простуды и гриппа разработан "
            "в соответствии с рекомендациями ВОЗ и позволяет предоставить "
            "Вам самую точную и доказательную с медицинской точки зрения "
            "информацию.",
        "AboutAppTitle" : "О приложении",
        "gender" : "Укажите ваш пол:",
        "age" : "Ваш возраст:",
        "vaccinated" : "Получили ли Вы вакцину?",
        "temperature" : "Повышение температуры (выше чем 36,6 градусов)",
        "dry_cough" : "Сухой кашель",
        "loss_of_smell" : "Потеря обоняния или вкуса",
        "fatigue" : "Утомляемость",
        "dyspnea" : "Одышка (дискомфорт при дыхании)",
        "joint_pain" : "Боль в суставах",
        "diarrhea" : "Диарея",
        "sore_throat" : "Боль в горле",
        "headache" : "Головная боль",
        "nausea_and_vomiting" : "Тошнота и рвота",
        "skin_rash" : "Кожные высыпания",
        "runny_nose" : "Насморк",
        "sneezing" : "Чихание",
        "conjunctivities" : "Покраснение и жжение в глазах (конъюнктивит)",
        "eyes_pain" : "Боль в глазах",
        "core_pain" : "Боль в животе",
        "contacted" : "Были ли вы в контакте с инфицированными?",
        "TermsTitle" : "Условия использования",
        "TermsText_1" : "Этот опрос не является полноценной диагностикой. "
            "Результаты предназначены для информационных целей и не являются "
            "квалифицированным медицинским диагнозом.",
        "TermsText_2" : "Не используйте данное приложение в случае экстренных "
            "или неотложных ситуациях. Если Вам необходима скорая медицинская "
            "помощь, незамедлительно звоните 103.",
        "TermsText_3" : "Ваши данные в безопасности. Предоставляемая Вами "
            "информация анонимна и не будет передана третьим лицам.",
        "ReadAndAccept" : "Я прочитал(а) и принимаю",
        "PleaseAnswerQuestions" : "Пожалйста, ответьте на следующие вопросы",
        "DoYouHaveFollowingSymptoms" : "Наблюдаются ли у вас следующие симптомы?",
        "genders_ans" : ["Мужчина", "Женщина"],
        "ages_ans" : ["0-9", "10-19", "20-24", "25-59", "60+"],
        "yes_no_ans" : ["Да", "Нет"],
        "Stop" : "Начать сначала",
        "Results" : "Результат",
        "covid_risk" : "Риск наличия Covid-19:",
        "cold_risk" : "Риск наличия простуды:",
        "flu_risk" : "Риск наличия гриппа:",
        "Recommends" : "Рекомендации",

        "RecommendsText_1" : "Проконсультируйтесь с врачом!\n"
            "Имеющиеся у Вас симптомы указывают на необходимость осмотра врачом. "
            "Запишитесь на прием к своему врачу. Если симптомы становятся хуже, "
            "обратитесь к врачу незамедлительно. \n\n "
            "Рекомендуемый специалист – ЛОР.\n\n"
            "Обратите внимание, что приведенное выше распределение вероятности риска "
            "заболеваний может быть неполным. Оно предоставлено исключительно в "
            "информационных целях и не является квалифицированным медицинским заключением.\n\n"
            "Имеющиеся у Вас симптомы указывают на низкую вероятность наличия заболевания COVID-19. "
            "Следуйте приведенной выше рекомендации и обратитесь к врачу для "
            "установления точного диагноза.",

        "RecommendsText_2" : "Проконсультируйтесь с врачом!\n"
            "Имеющиеся у Вас симптомы указывают на необходимость осмотра врачом. "
            "Запишитесь на прием к своему врачу. Если симптомы становятся хуже, "
            "обратитесь к врачу незамедлительно.\n\n"
            "Рекомендуемый специалист – Инфекционист.\n\n"
            "Обратите внимание, что приведенное выше распределение вероятности риска "
            "заболеваний может быть неполным. Оно предоставлено исключительно в "
            "информационных целях и не является квалифицированным медицинским заключением.\n\n"
            "Имеющиеся у Вас симптомы указывают на равнозначную вероятность наличия заболевания COVID-19, "
            "простуды или гриппом. "
            "Следуйте приведенной выше рекомендации и обратитесь к врачу для "
            "установления точного диагноза.",

        "RecommendsText_3" : "Проконсультируйтесь с врачом!\n"
            "Имеющиеся у Вас симптомы указывают на необходимость осмотра врачом. "
            "Запишитесь на прием к своему врачу. Если симптомы становятся хуже, "
            "обратитесь к врачу незамедлительно.\n\n"
            "Рекомендуемый специалист – Инфекционист.\n\n"
            "Обратите внимание, что приведенное выше распределение вероятности риска "
            "заболеваний может быть неполным. Оно предоставлено исключительно в "
            "информационных целях и не является квалифицированным медицинским заключением.\n\n"
            "Имеющиеся у Вас симптомы указывают на высокую вероятность наличия заболевания COVID-19. "
            "Следуйте приведенной выше рекомендации и обратитесь к врачу для "
            "установления точного диагноза.",

        "RecommendsText_4" : "Немедленно изолируйте себя от других людей и животных. "
            "По возможности изолируйте себя в отдельной комнате, куда не "
            "заходят остальные члены семьи. Если это невозможно, наденьте "
            "медицинскую маску и не приближайтесь к другим ближе, чем на 2 метра. "
            "Не контактируйте с домашними животными. \n\n"
            "Немедленно вызовите скорую помощь. "
            "Позвоните в службу скорой медицинской помощи своей страны. "
            "Имеющиеся у Вас симптомы тяжелые, Вас следует доставить в "
            "медицинское учреждение.\n\n"
            "Наденьте маску. Надевайте медицинскую маску всегда, "
            "если в одном помещении или автомобиле с Вами находится кто-либо еще. "
            "Надевайте маску перед посещением медицинского учреждения, "
            "а также входя в автомобиль скорой помощи. Контактирующие с "
            "Вами лица также должны носить медицинские маски, особенно "
            "если у Вас затруднено дыхание.",

        "RecommendsText_5" : "При проведении самодиагностики вы отметили полное отсутствие симптомов. "
            "Но учитывая эпидемиологическое состояние, мы настоятельно рекомендуем "
            "вам носить маску, держать социальную дистанцию и не находится в местах "
            "скопления людей. ",

        "Back" : "Назад",
        "LeaveFeedback" : "Оставить отзыв",
      };
    };

    case("en"): {
      return {
        "Start" : "Start",
        "AboutApp" : "About App",
        "ChangeLang" : "Change Language",
        "AboutAppText" : "This mobile app COVID-19 Checker, based on WHO "
            "recommendations, allows you to conduct online self-diagnosis for "
            "the risk of having a COVID-19 disease, Cold or Flu. After "
            "answering a few questions about symptoms, vaccinations and "
            "contact with other people, you will receive recommendations "
            "on the next steps to take based on the results of "
            "the self-diagnosis.\n\n"
            "Meets WHO requirements. TPMI IC adheres to the highest scientific "
            "standards. The protocol for the differential diagnosis of COVID-19, "
            "Cold and Flu has been developed in accordance with WHO "
            "recommendations and allows to provide you with the most accurate "
            "and evidence-based information from a medical point of view.",
        "AboutAppTitle" : "About App",
        "gender" : "Gender:",
        "age" : "Your age:",
        "vaccinated" : "Are you vaccinated?",
        "temperature" : "Temperature increase (Higher than 36,6 degrees of centigrate)",
        "dry_cough" : "Dry cough",
        "loss_of_smell" : "Loss of taste or smell feeling",
        "fatigue" : "Fatigue",
        "dyspnea" : "Dyspnea",
        "joint_pain" : "Joint pain",
        "diarrhea" : "Diarrhea",
        "sore_throat" : "Sore throat",
        "headache" : "Headache",
        "nausea_and_vomiting" : "Nausea and vomiting",
        "skin_rash" : "Skin rash",
        "runny_nose" : "Runny nose",
        "sneezing" : "Sneezing",
        "conjunctivities" : "Conjunctivitis",
        "eyes_pain" : "Eyes pain",
        "core_pain" : "Core pain",
        "contacted" : "Have you been in close contact with an infected person?",
        "TermsTitle" : "Terms of Use",
        "TermsText_1" : "This survey is not a full-fledged diagnostic. "
            "The results are intended for informational purposes and are not "
            "a qualified medical diagnosis.",
        "TermsText_2" : "Do not use this App in case of emergency or urgent "
            "situations. If you need an ambulance, call emergence service "
            "immediately.",
        "TermsText_3" : "Your data is safe. The information you provide is "
            "anonymous and will not be shared with third parties.",
        "ReadAndAccept" : "I read it and accept",
        "PleaseAnswerQuestions" : "Please, answer the questions below",
        "DoYouHaveFollowingSymptoms" : "Do you have the following symptoms?",
        "genders_ans" : ["Male", "Female"],
        "ages_ans" : ["0-9", "10-19", "20-24", "25-59", "60+"],
        "yes_no_ans" : ["Yes", "No"],
        "Stop" : "Restart",
        "Results" : "Results",
        "covid_risk" : "Covid-19 risk:",
        "cold_risk" : "Cold risk:",
        "flu_risk" : "Flu risk:",
        "Recommends" : "Recommendations",

        "RecommendsText_1" : "Consult your doctor!\n"
            "The symptoms you have indicate that you need to "
            "be examined by a doctor. Make an appointment with "
            "your doctor. If the symptoms get worse, contact "
            "your doctor immediately.\n\n"
            "Recommended specialist – ENT. \n\n"
            "Please note that the probability distribution "
            "of COVID-19 risks shown above may be incomplete. "
            "It is provided for informational purposes only and "
            "is not a qualified medical opinion.\n\n"
            "The symptoms you have indicate a low probability "
            "of having COVID-19 disease. Follow the above "
            "recommendation and consult a doctor to "
            "establish an accurate diagnosis.",

        "RecommendsText_2" : "Consult your doctor!\n"
            "The symptoms you have indicate that you need to "
            "be examined by a doctor. Make an appointment with "
            "your doctor. If the symptoms get worse, contact "
            "your doctor immediately.\n\n"
            "Recommended specialist – Infectious Disease Specialist.\n\n"
            "Please note that the probability distribution "
            "of COVID-19 risks shown above may be incomplete. "
            "It is provided for informational purposes only and "
            "is not a qualified medical opinion.\n\n"
            "The symptoms you have indicate an equivalent probability "
            "of having a COVID-19 disease, a Cold or the Flu. "
            "Follow the above recommendation and consult a doctor "
            "to establish an accurate diagnosis.",

        "RecommendsText_3" : "Consult your doctor!\n"
            "The symptoms you have indicate that you need to "
            "be examined by a doctor. Make an appointment with "
            "your doctor. If the symptoms get worse, contact "
            "your doctor immediately.\n\n"
            "Recommended specialist – Infectious Disease Specialist.\n\n"
            "Please note that the probability distribution "
            "of COVID-19 risks shown above may be incomplete. "
            "It is provided for informational purposes only and "
            "is not a qualified medical opinion.\n\n"
            "The symptoms you have indicate a high probability "
            "of having COVID-19 disease. Follow the above recommendation "
            "and consult an infectious disease doctor "
            "to establish an accurate diagnosis.",

        "RecommendsText_4" : "Immediately isolate yourself from other people and animals. "
            "If possible, isolate yourself in a separate room, where "
            "the rest of the family members do not go. If this is not possible, "
            "wear a medical mask and do not approach others closer than 2 meters. "
            "Do not contact with pets. \n\n"
            "Call an ambulance immediately."
            "Call the emergency medical service of your country. "
            "Your symptoms are severe, and you should be taken to a medical facility.\n\n"
            "Put on a mask. Always wear a medical mask if there "
            "is someone else in the same room or car with you. "
            "Wear a mask before visiting a medical facility, as well as "
            "entering an ambulance. Those in contact with you should also "
            "wear medical masks, especially if you have"
            "difficulty breathing.",

        "RecommendsText_5" : "When conducting a self-diagnosis, you noted the complete absence of symptoms. "
            "But given the epidemiological state, we strongly recommend that you wear a mask, "
            "keep a social distance and do not stay in crowded places. ",

        "Back" : "Bck",
        "LeaveFeedback" : "Leave feedback",
      };
    }
  }
  return {};
}


Map defResult(Map AnsList){
  double covid = 0;
  double cold = 0;
  double flu = 0;
  double sum = 0;

  Points.forEach((symptom, pointsMap) {
    if(AnsList[symptom]=="yes"){
      covid+=Points[symptom]["covid"];
      cold+=Points[symptom]["cold"];
      flu+=Points[symptom]["flu"];
    };
  });

  if(AnsList["vaccinated"]=="yes"){
    covid = covid/6;
  }

  sum = covid+cold+flu;

  int covid_percent = 0;
  int cold_percent = 0;
  int flu_percent = 0;

  if(sum>0){
    covid_percent = ((covid/sum)*100).round();
    cold_percent = ((cold/sum)*100).round();
    flu_percent = ((flu/sum)*100).round();
  }

  while (covid_percent+cold_percent+flu_percent>100){
    flu_percent = flu_percent-1;
  }

  return {
    "covid" : covid_percent,
    "cold" : cold_percent,
    "flu" : flu_percent
  };
}


void fetchData() async {
  final url = "https://jsonplaceholder.typicode.com/posts";
  final response = await http.get(Uri.parse(url));
  final data = jsonDecode(response.body) as List;
  print(data[5]["title"]);
}


// var counter = 0;

void trySend(Map AnsList, Map result) async {

  Map newData = AnsList;

  newData.addAll(result);

  DateTime dt = DateTime.now();
  newData.addAll({"date" : dt.day.toString()+"-"+dt.month.toString()+"-"+dt.year.toString(),
                  "time" : dt.hour.toString()+"-"+dt.minute.toString()+"-"+dt.second.toString()});

  final Prefs = await SharedPreferences.getInstance();

  String? allData = Prefs.getString("allData");
  if(allData==null){
    allData="[]";
  }

  var dataList = json.decode(allData);

  dataList.add(newData);

  final url_external = "http://91.203.174.255:1001/results";
  final url_internal = "http://192.168.100.12:1001/results";
  // final url_for_ip_info = "https://api.ipify.org";

  try{
    final response1 = await http.post(Uri.parse(url_external), body: json.encode(dataList)).timeout(
      const Duration(seconds: 3),
      onTimeout: () async {
        print("external ip doesn't work");
        final response2 = await http.post(Uri.parse(url_internal), body: json.encode(dataList)).timeout(
          const Duration(seconds: 3),
            onTimeout: () {
            print("internal ip doesn't work");
            return http.Response('Error', 408);
          }
        );
        return http.Response('Error', 408);
      }
    );
    Prefs.setString("allData", "[]");
  }
  catch (err) {
    print(err);
    // delete the oldest data to avoid cache overflow
    while(dataList.length>=500){
      dataList.removeAt(0);
    }
    Prefs.setString("allData", json.encode(dataList));
    // print("No Internet");
  }

}
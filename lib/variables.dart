String Lang = "";

Map textMap = {};

Map questionsMap = {};

Map Result = {};

String RecommendsText = "";

const List<String> Questions = ["gender", "age", "vaccinated", "temperature",
"dry_cough", "loss_of_smell", "fatigue", "dyspnea", "joint_pain", "diarrhea",
"sore_throat", "headache", "nausea_and_vomiting", "skin_rash", "runny_nose",
"sneezing", "conjunctivities", "eyes_pain", "core_pain", "contacted"];

const Map Answers = {
  "genders_ans" : ["male", "female"],
  "ages_ans" : ["0-9", "10-19", "20-24", "25-59", "60+"],
  "yes_no_ans" : ["yes", "no"]
};

const Map Points = {

  "temperature" : {
    "covid" : 150,
    "cold" : 20,
    "flu" : 80
  },

  "dry_cough" : {
    "covid" : 150,
    "cold" : 20,
    "flu" : 75
  },

  "loss_of_smell" : {
    "covid" : 150,
    "cold" : 0,
    "flu" : 15
  },

  "fatigue" : {
    "covid" : 150,
    "cold" : 10,
    "flu" : 10
  },

  "dyspnea" : {
    "covid" : 150,
    "cold" : 0,
    "flu" : 0
  },

  "joint_pain" : {
    "covid" : 50,
    "cold" : 60,
    "flu" : 80
  },

  "diarrhea" : {
    "covid" : 50,
    "cold" : 0,
    "flu" : 80
  },

  "sore_throat" : {
    "covid" : 50,
    "cold" : 70,
    "flu" : 10
  },

  "headache" : {
    "covid" : 30,
    "cold" : 10,
    "flu" : 80
  },

  "nausea_and_vomiting" : {
    "covid" : 30,
    "cold" : 0,
    "flu" : 0
  },

  "skin_rash" : {
    "covid" : 20,
    "cold" : 0,
    "flu" : 5
  },

  "runny_nose" : {
    "covid" : 10,
    "cold" : 80,
    "flu" : 5
  },

  "sneezing" : {
    "covid" : 0,
    "cold" : 80,
    "flu" : 0
  },

  "conjunctivities" : {
    "covid" : 20,
    "cold" : 10,
    "flu" : 10
  },

  "eyes_pain" : {
    "covid" : 0,
    "cold" : 20,
    "flu" : 70
  },

  "core_pain" : {
    "covid" : 30,
    "cold" : 60,
    "flu" : 10
  },

  "contacted" : {
    "covid" : 200,
    "cold" : 10,
    "flu" : 10
  },

};


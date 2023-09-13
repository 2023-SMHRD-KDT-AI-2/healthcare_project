document.addEventListener(
  "DOMContentLoaded",
  (e) => {
    $("#search-food").autocomplete();
  },
  false
);

let year = "2023";
let month = "08";
let day = "03";
let day_n = Number(day);
let memberID = "3";

let moveUrl = `http://localhost/Members.say?c=member&collection=${
  year + month
}&fieldName=_id&value=${memberID}&valueType=int&dataType=json`;
let memberDailyInfo;

const loadMemberDailyInfo = async () => {
  await $.ajax({
    url: moveUrl,
    success: function (data) {
      memberDailyInfo = data.dailyInfo;
      console.log(memberDailyInfo);
    },
    error: function () {
      console.log("요청이 안됨");
    },
  });
};

const loadmember = async () => {
  await loadMemberDailyInfo();
  console.log(memberDailyInfo[(day_n - 1)].diet.breakfast);

  let meal = {
    "breakfast":memberDailyInfo[(day_n - 1)].diet.breakfast,
    "lunch":memberDailyInfo[(day_n - 1)].diet.lunch,
    "dinner":memberDailyInfo[(day_n - 1)].diet.dinner,
    "otherfood":memberDailyInfo[(day_n - 1)].diet.otherfood
    };

    console.log(typeof(meal))
    const sendFoodName = async () => {
        await $.ajax({
            url : "/Diet.say?c=foodname",
            type : "POST",
            data : {
                foodName : JSON.stringify(meal)                
            },
            dataType : 'text',
            success: function(data) {
                console.log(meal);
                console.log("음식 이름 전송 성공");

            },
            error: function(error) {
                console.log("전송 실패", error);
            }
        })
    }

    sendFoodName();

    let sum_calorie = {
        "breakfast":0,
        "lunch":0,
        "dinner":0,
        "otherfood":0
    }

    meal.breakfast.forEach((calorie, index) => {
        sum_calorie.breakfast += calorie.calorie;
    })

    meal.lunch.forEach((calorie, index) => {
        sum_calorie.lunch += calorie.calorie;
    })

    meal.dinner.forEach((calorie, index) => {
        sum_calorie.dinner += calorie.calorie;
    })

    meal.otherfood.forEach((calorie, index) => {
        sum_calorie.otherfood += calorie.calorie;
    })

    console.log("아침 칼로리 : " + sum_calorie.breakfast);
    console.log("점심 칼로리 : " + sum_calorie.lunch);
    console.log("저녁 칼로리 : " + sum_calorie.dinner);
    console.log("간식 칼로리 : " + sum_calorie.otherfood);

};

loadmember();
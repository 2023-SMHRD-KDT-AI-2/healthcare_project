// MonggoDB에 데이터를 받아오기 위해 ajax통신 필요
// ajax요청에 사용되는 url에 들어가는 가변값들 변순 선언
let year = "2023"; //년도
let month = "08"; //월
let day = "03"; //일
let day_n = Number(day); // 일수의 자리수가 한자리 일 때 0을 제거하기 위해 선언한 변수
let memberID = "3"; // 회원ID

// ajax요청에 사용되는 rul
let moveUrl = `http://localhost/Members.say?c=member&collection=${
  year + month
}&fieldName=_id&value=${memberID}&valueType=int&dataType=json`;

// MonggoDB에서 받아온 회원의 모든 상세정보가 저장되는 변수
let memberInfo;

// MonggoDB에서 받아온 회원의 일별 상세정보가 저장되는 변수
let memberDailyInfo;

// 회원이 섭취한 아침, 점심, 저녁, 간식별로 먹은 음식마다의 상세 영양소 절보
let nutrientReceive;

// 회원이 섭취한 아침, 점심, 저녁, 간식별로 먹은 음식들의 영양소마다의 합이 담겨있는 변수
let nutrientCalc = {
  "breakfast" : {
		"energy" : 0,
		"water" : 0,
		"protein" : 0,
		"fat" : 0,
		"carbohydrate" : 0,
		"total_sugars" : 0,
		"saccharose" : 0,
		"glucose" : 0,
		"fruit_sugar" : 0,
		"lactose" : 0,
		"maltose" : 0,
		"dietary_fiber" : 0,
		"calcium" : 0,
		"iron_mg" : 0,
		"iron_ug" : 0,
		"magnesium" : 0,
		"phosphorus" : 0,
		"potassium" : 0,
		"natrium" : 0,
		"zinc" : 0,
		"cuprum" : 0,
		"manganese" : 0,
		"selenium" : 0,
		"retinol" : 0,
		"betacarotene" : 0,
		"vitamin_d3" : 0,
		"tocopherol" : 0,
		"tocotrienols" : 0,
		"vitamin_b1" : 0,
		"vitamin_b2" : 0,
		"niacin" : 0,
		"folicacid" : 0,
		"vitamin_b12" : 0,
		"vitamin_c" : 0,
		"aminoacid" : 0,
		"isoleucine" : 0,
		"leucine" : 0,
		"lysine" : 0,
		"methionine" : 0,
		"phenylalanine" : 0,
		"threonine" : 0,
		"valine" : 0,
		"histidine" : 0,
		"arginine" : 0,
		"tyrosine" : 0,
		"cysteine" : 0,
		"alanine" : 0,
		"aspartic_acid" : 0,
		"glutamic_acid" : 0,
		"glycine" : 0,
		"proline" : 0,
		"serine" : 0,
		"cholesterol" : 0,
		"total_saturated_fatty_acids" : 0,
		"butyric_acid" : 0,
		"caproic_acid" : 0,
		"caprylic_acid" : 0,
		"capric_acid" : 0,
		"lauric_acid" : 0,
		"myristic_acid" : 0,
		"palmitic_acid" : 0,
		"stearic_acid" : 0,
		"arachidic_acid" : 0,
		"myristoleic_acid" : 0,
		"palmitoleic_acid" : 0,
		"oleic_acid" : 0,
		"bacsenic_acid" : 0,
		"gadoleic_acid" : 0,
		"linoleic_acid" : 0,
		"alpha_linoleic_acid" : 0,
		"gamma_linoleic_acid" : 0,
		"eicosadienoic_acid" : 0,
		"arachidonic_acid" : 0,
		"eicosatrienoic_acid" : 0,
		"eicosapentaenoic_acid" : 0,
		"docosapentaenoic_acid" : 0,
		"docosahexaenoic_acid" : 0,
		"trans_fatty_acids" : 0,
		"trans_oleic_acid" : 0,
		"trans_linoleic_acid" : 0,
		"trans_linolenic_acid" : 0,
		"ash" : 0,
		"caffeine" : 0,
		"serving_size":0
  }, "lunch" : {
		"energy" : 0,
		"water" : 0,
		"protein" : 0,
		"fat" : 0,
		"carbohydrate" : 0,
		"total_sugars" : 0,
		"saccharose" : 0,
		"glucose" : 0,
		"fruit_sugar" : 0,
		"lactose" : 0,
		"maltose" : 0,
		"dietary_fiber" : 0,
		"calcium" : 0,
		"iron_mg" : 0,
		"iron_ug" : 0,
		"magnesium" : 0,
		"phosphorus" : 0,
		"potassium" : 0,
		"natrium" : 0,
		"zinc" : 0,
		"cuprum" : 0,
		"manganese" : 0,
		"selenium" : 0,
		"retinol" : 0,
		"betacarotene" : 0,
		"vitamin_d3" : 0,
		"tocopherol" : 0,
		"tocotrienols" : 0,
		"vitamin_b1" : 0,
		"vitamin_b2" : 0,
		"niacin" : 0,
		"folicacid" : 0,
		"vitamin_b12" : 0,
		"vitamin_c" : 0,
		"aminoacid" : 0,
		"isoleucine" : 0,
		"leucine" : 0,
		"lysine" : 0,
		"methionine" : 0,
		"phenylalanine" : 0,
		"threonine" : 0,
		"valine" : 0,
		"histidine" : 0,
		"arginine" : 0,
		"tyrosine" : 0,
		"cysteine" : 0,
		"alanine" : 0,
		"aspartic_acid" : 0,
		"glutamic_acid" : 0,
		"glycine" : 0,
		"proline" : 0,
		"serine" : 0,
		"cholesterol" : 0,
		"total_saturated_fatty_acids" : 0,
		"butyric_acid" : 0,
		"caproic_acid" : 0,
		"caprylic_acid" : 0,
		"capric_acid" : 0,
		"lauric_acid" : 0,
		"myristic_acid" : 0,
		"palmitic_acid" : 0,
		"stearic_acid" : 0,
		"arachidic_acid" : 0,
		"myristoleic_acid" : 0,
		"palmitoleic_acid" : 0,
		"oleic_acid" : 0,
		"bacsenic_acid" : 0,
		"gadoleic_acid" : 0,
		"linoleic_acid" : 0,
		"alpha_linoleic_acid" : 0,
		"gamma_linoleic_acid" : 0,
		"eicosadienoic_acid" : 0,
		"arachidonic_acid" : 0,
		"eicosatrienoic_acid" : 0,
		"eicosapentaenoic_acid" : 0,
		"docosapentaenoic_acid" : 0,
		"docosahexaenoic_acid" : 0,
		"trans_fatty_acids" : 0,
		"trans_oleic_acid" : 0,
		"trans_linoleic_acid" : 0,
		"trans_linolenic_acid" : 0,
		"ash" : 0,
		"caffeine" : 0,
		"serving_size":0
  }, "dinner" : {
		"energy" : 0,
		"water" : 0,
		"protein" : 0,
		"fat" : 0,
		"carbohydrate" : 0,
		"total_sugars" : 0,
		"saccharose" : 0,
		"glucose" : 0,
		"fruit_sugar" : 0,
		"lactose" : 0,
		"maltose" : 0,
		"dietary_fiber" : 0,
		"calcium" : 0,
		"iron_mg" : 0,
		"iron_ug" : 0,
		"magnesium" : 0,
		"phosphorus" : 0,
		"potassium" : 0,
		"natrium" : 0,
		"zinc" : 0,
		"cuprum" : 0,
		"manganese" : 0,
		"selenium" : 0,
		"retinol" : 0,
		"betacarotene" : 0,
		"vitamin_d3" : 0,
		"tocopherol" : 0,
		"tocotrienols" : 0,
		"vitamin_b1" : 0,
		"vitamin_b2" : 0,
		"niacin" : 0,
		"folicacid" : 0,
		"vitamin_b12" : 0,
		"vitamin_c" : 0,
		"aminoacid" : 0,
		"isoleucine" : 0,
		"leucine" : 0,
		"lysine" : 0,
		"methionine" : 0,
		"phenylalanine" : 0,
		"threonine" : 0,
		"valine" : 0,
		"histidine" : 0,
		"arginine" : 0,
		"tyrosine" : 0,
		"cysteine" : 0,
		"alanine" : 0,
		"aspartic_acid" : 0,
		"glutamic_acid" : 0,
		"glycine" : 0,
		"proline" : 0,
		"serine" : 0,
		"cholesterol" : 0,
		"total_saturated_fatty_acids" : 0,
		"butyric_acid" : 0,
		"caproic_acid" : 0,
		"caprylic_acid" : 0,
		"capric_acid" : 0,
		"lauric_acid" : 0,
		"myristic_acid" : 0,
		"palmitic_acid" : 0,
		"stearic_acid" : 0,
		"arachidic_acid" : 0,
		"myristoleic_acid" : 0,
		"palmitoleic_acid" : 0,
		"oleic_acid" : 0,
		"bacsenic_acid" : 0,
		"gadoleic_acid" : 0,
		"linoleic_acid" : 0,
		"alpha_linoleic_acid" : 0,
		"gamma_linoleic_acid" : 0,
		"eicosadienoic_acid" : 0,
		"arachidonic_acid" : 0,
		"eicosatrienoic_acid" : 0,
		"eicosapentaenoic_acid" : 0,
		"docosapentaenoic_acid" : 0,
		"docosahexaenoic_acid" : 0,
		"trans_fatty_acids" : 0,
		"trans_oleic_acid" : 0,
		"trans_linoleic_acid" : 0,
		"trans_linolenic_acid" : 0,
		"ash" : 0,
		"caffeine" : 0,
		"serving_size":0
  }, "otherfood" : {
		"energy" : 0,
		"water" : 0,
		"protein" : 0,
		"fat" : 0,
		"carbohydrate" : 0,
		"total_sugars" : 0,
		"saccharose" : 0,
		"glucose" : 0,
		"fruit_sugar" : 0,
		"lactose" : 0,
		"maltose" : 0,
		"dietary_fiber" : 0,
		"calcium" : 0,
		"iron_mg" : 0,
		"iron_ug" : 0,
		"magnesium" : 0,
		"phosphorus" : 0,
		"potassium" : 0,
		"natrium" : 0,
		"zinc" : 0,
		"cuprum" : 0,
		"manganese" : 0,
		"selenium" : 0,
		"retinol" : 0,
		"betacarotene" : 0,
		"vitamin_d3" : 0,
		"tocopherol" : 0,
		"tocotrienols" : 0,
		"vitamin_b1" : 0,
		"vitamin_b2" : 0,
		"niacin" : 0,
		"folicacid" : 0,
		"vitamin_b12" : 0,
		"vitamin_c" : 0,
		"aminoacid" : 0,
		"isoleucine" : 0,
		"leucine" : 0,
		"lysine" : 0,
		"methionine" : 0,
		"phenylalanine" : 0,
		"threonine" : 0,
		"valine" : 0,
		"histidine" : 0,
		"arginine" : 0,
		"tyrosine" : 0,
		"cysteine" : 0,
		"alanine" : 0,
		"aspartic_acid" : 0,
		"glutamic_acid" : 0,
		"glycine" : 0,
		"proline" : 0,
		"serine" : 0,
		"cholesterol" : 0,
		"total_saturated_fatty_acids" : 0,
		"butyric_acid" : 0,
		"caproic_acid" : 0,
		"caprylic_acid" : 0,
		"capric_acid" : 0,
		"lauric_acid" : 0,
		"myristic_acid" : 0,
		"palmitic_acid" : 0,
		"stearic_acid" : 0,
		"arachidic_acid" : 0,
		"myristoleic_acid" : 0,
		"palmitoleic_acid" : 0,
		"oleic_acid" : 0,
		"bacsenic_acid" : 0,
		"gadoleic_acid" : 0,
		"linoleic_acid" : 0,
		"alpha_linoleic_acid" : 0,
		"gamma_linoleic_acid" : 0,
		"eicosadienoic_acid" : 0,
		"arachidonic_acid" : 0,
		"eicosatrienoic_acid" : 0,
		"eicosapentaenoic_acid" : 0,
		"docosapentaenoic_acid" : 0,
		"docosahexaenoic_acid" : 0,
		"trans_fatty_acids" : 0,
		"trans_oleic_acid" : 0,
		"trans_linoleic_acid" : 0,
		"trans_linolenic_acid" : 0,
		"ash" : 0,
		"caffeine" : 0,
		"serving_size":0
  }
}

// 칼로리 계산을 위한 객체
let calorie = {
	"breakfast" : {
		"calborhydrate" : 0,
		"protein" : 0,
		"fat" : 0,
	},
	"lunch" : {
		"calborhydrate" : 0,
		"protein" : 0,
		"fat" : 0,
	},
	"dinner" : {
		"calborhydrate" : 0,
		"protein" : 0,
		"fat" : 0,
	},
	"otherfood" : {
		"calborhydrate" : 0,
		"protein" : 0,
		"fat" : 0,
	}
}

// 영양소별 일일권장섭취량
// 임시 성별 변수, memberInfo.gender로 변경이 될 수도... 
let gender = ""
let recommendedNutrient = {}
if (gender == 'male') {
	recommendedNutrient = {
		"energy" : 2600,
		"carbohydrate" : 130,
		"dietary_fiber" : 30,
		"fat" : 13.0,
		"protein" : 50,
		"water" : 2600,
		"vitamin_d3" : 10,
		"vitamin_e" : 12,
		"vitamin_k" : 75,
		"vitamin_c" : 100,
		"calcium" : 800,
		"natrium" : 1500,
		"potassium" : 3500,
		"magnesium" : 350,
		"iron_mg" : 10
	}
} else if (gender == 'female') {
	recommendedNutrient = {
		"energy" : 2000,
		"carbohydrate" : 130,
		"dietary_fiber" : 20,
		"fat" : 13.0,
		"protein" : 55,
		"water" : 2100,
		"vitamin_d3" : 10,
		"vitamin_e" : 12,
		"vitamin_k" : 65,
		"vitamin_c" : 100,
		"calcium" : 700,
		"natrium" : 1500,
		"potassium" : 3500,
		"magnesium" : 350,
		"iron_mg" : 14
	}
}

// nutrientCalc를 초기화(깊은 복사)하기 위해 생성한 객체
const nutrientCalcCopy = JSON.parse(JSON.stringify(nutrientCalc));

// MonggoDB에서 받아온 회원의 간략한 음식 정보를 저장하기 위한 객체
let meal = {};

// MonggoDB에 저장된 데이터에 접근하기 위해 ajax요청하는 함수
// 비동기 동작을 위한 async()함수 사용
// await : 바로 뒤에 선언되는 함수의 동작이 끝날 때까지 다음 동작으로 넘어가지 않음
//         비동기 통신 시 await를 걸어놓지 않으면 데이터를 받아오기도 전에
//         다음 동작으로 넘어가서 데이터를 못 받은 채로 로직이 실행될 수 있음 
const loadMemberDailyInfo = async () => {
  await $.ajax({
    url: moveUrl,
    success: function (data) {
	  memberInfo = data;	
      memberDailyInfo = data.dailyInfo;
      console.log(data);
    },
    error: function () {
      console.log("요청이 안됨");
    },
  });
};

// 회원이 그날 머근 영양소들의 합을 아침, 점심, 저녁, 간식별로 합산
const calcNutrient = function() {
  
  // 영양소 합산 후 초기화 작업(깊은 복사)
  nutrientCalc = nutrientCalcCopy;

  // 반복문 횟수 제한 변수
  // 해당 반복문은 (객체의 개수 * key의 개수) 만큼 실행
  // 하지만 세개의 객체 모두 key값이 breakfast, lunch, dinner, otherfood로 동일함
  // 각 개체마다 key값을 참조해 반복문을 돌기 때문에 loop로 제한을 걸지 앟으면 
  // breakfast, lunch, dinner, otherfood을 3번 실행되어 영양소 합산이 3번 중복으로 이루어진다.
  let loop = 0;

  // 3개의 객체를 동시에 활용하는 반복문
  // 3개의 객체의 key와 value의 개수와 값이 같기 때문에 사용가능
  for (const [key, value] of [...Object.entries(nutrientReceive), ...Object.entries(nutrientCalc), ...Object.entries(meal)]) {
	// 반복문 key값의 개수인 개번만 동작하도록 제한
	if (loop < 4) {
		for (let i = 0; i < nutrientReceive[key].length; i++) {
			for (const source in nutrientReceive[key][i]) {
					if (source != "serving_size") {
					nutrientCalc[key][source] += (meal[key][i].gram / nutrientReceive[key][i].serving_size) * nutrientReceive[key][i][source];
					// console.log(key, i, '번째', '영양소 이름', [source], '영양소 값', nutrientReceive[key][i][source], 
					// '실제 먹은 비율', (meal[key][i].gram / nutrientReceive[key][i].serving_size), 
					// '현재값', ((meal[key][i].gram / nutrientReceive[key][i].serving_size) * nutrientReceive[key][i][source]),'시간대별 합산된 값', nutrientCalc[key][source]);
					}
			}
		}
	}
	loop++;
  }

}

// MonggoDB에서 회원의 상세정보를 가져와서 저장 후
// MonggoDB에서 가져온 food_code로 MariaDB에 있는 음식정보 테이블을 참조 후
// 음실별 영양정보 리스트를 받아오는 함수
const loadmember = async () => {
  // MonggoDB에 ajax요청 후 데이터를 받을 때까지 대기
  await loadMemberDailyInfo();
  
  // MonggoDB에서 받은 음식 정보만을 meal객체에 저장
  meal = {
    "breakfast":memberDailyInfo[(day_n - 1)].diet.breakfast,
    "lunch":memberDailyInfo[(day_n - 1)].diet.lunch,
    "dinner":memberDailyInfo[(day_n - 1)].diet.dinner,
    "otherfood":memberDailyInfo[(day_n - 1)].diet.otherfood
    };

	// 음식정보가 있는 MariaDB에 접근하기 위해
	// meal을 전송 -> meal이 가지고 있는 food_cood로 MariaDB를 참조 후
	// 음식별 영양정보 수신
    const sendFoodName = async () => {
        await $.ajax({
            url : "/Diet.say?c=foodname", // 해당 페이지에서 데이터 송/수신이 동시에 일어남
            type : "POST",
            data : {
				// meal을 전송하기 위해 JSON으로 변환 후 foodName에 저장
                foodName : JSON.stringify(meal)                
            },
            dataType : 'json',
            success: function(data) {
				// MariaDB에 참조 후 조회한 음식정보를 nutrientReceive에 저장
                nutrientReceive = data;
                console.log("전송 성공");
            },
            error: function(error) {
                console.log("전송 실패", error);
            }
        })
    }

	// ajax이 끝날 때까지 대기
    await sendFoodName();

	console.log("meal : ", meal);
    console.log("nutrientReceive : ", nutrientReceive);
	
	// 영양소 정보 합산 실행
    calcNutrient();
    
    console.log("nutrientCalc : ", nutrientCalc);
	calorie.breakfast.calborhydrate = 4 * nutrientCalc.breakfast.carbohydrate;
	calorie.breakfast.protein = 4 * nutrientCalc.breakfast.protein;
	calorie.breakfast.fat = 9 * nutrientCalc.breakfast.fat;

};

loadmember();

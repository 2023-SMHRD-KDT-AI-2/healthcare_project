let year = "2023";
let month = "08";
let day = "03";
let day_n = Number(day);
let memberID = "3";

let moveUrl = `http://localhost/Members.say?c=member&collection=${
  year + month
}&fieldName=_id&value=${memberID}&valueType=int&dataType=json`;
let memberDailyInfo;

let nutrientReceive;

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

const nutrientCalcCopy = JSON.parse(JSON.stringify(nutrientCalc));

let meal = {};

const loadMemberDailyInfo = async () => {
  await $.ajax({
    url: moveUrl,
    success: function (data) {
      memberDailyInfo = data.dailyInfo;
      console.log(data);
    },
    error: function () {
      console.log("요청이 안됨");
    },
  });
};

const calcNutrient = function() {

  nutrientCalc = nutrientCalcCopy;
  let loop = 0;
  for (const [key, value] of [...Object.entries(nutrientReceive), ...Object.entries(nutrientCalc), ...Object.entries(meal)]) {
	if (loop < 3) {
		for (let i = 0; i < nutrientReceive[key].length; i++) {
			for (const source in nutrientReceive[key][i]) {
					if (source != "serving_size") {
					nutrientCalc[key][source] += (meal[key][i].gram / nutrientReceive[key][i].serving_size) * nutrientReceive[key][i][source];
				// console.log(key, i, '번째', '영양소 이름', [source], '영양소 값', nutrientReceive[key][i][source], 
				// '실제 먹은 비율', (meal[key][i].gram / nutrientReceive[key][i].serving_size), 
				// '현재값', ((meal[key][i].gram / nutrientReceive[key][i].serving_size) * nutrientReceive[key][i][source]),'계산된 값', nutrientCalc[key][source]);
					}
			}
		}
	}
	loop++;
  }



}

const loadmember = async () => {
  await loadMemberDailyInfo();

  meal = {
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
            dataType : 'json',
            success: function(data) {
                nutrientReceive = data;
                console.log("전송 성공");
            },
            error: function(error) {
                console.log("전송 실패", error);
            }
        })
    }
    await sendFoodName();

	console.log("meal : ", meal);
    console.log("nutrientReceive : ", nutrientReceive);
	
    calcNutrient();
    
    console.log("nutrientCalc : ", nutrientCalc);
};

loadmember();

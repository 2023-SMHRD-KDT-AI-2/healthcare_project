let currentDate = new Date();

// 연도, 월, 일 추출
let year = currentDate.getFullYear();
let month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1 해주고 두 자리로 포맷팅
let day = String(currentDate.getDate()).padStart(2, '0'); // 일자도 두 자리로 포맷팅

// MonggoDB에 데이터를 받아오기 위해 ajax통신 필요
// ajax요청에 사용되는 url에 들어가는 가변값들 변순 선언
let urlYear = year //년도
let urlMonth = month; //월
let urlDay = "03"; //일
let day_n = Number(urlDay); // 일수의 자리수가 한자리 일 때 0을 제거하기 위해 선언한 변수
let memberID = receivedID; // 회원ID

// ajax요청에 사용되는 rul
let moveUrl = `http://localhost/Members.say?c=member&collection=${
	urlYear + urlMonth
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
		"serving_size":0,
		"unit":"",
		"food_name":""
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
		"serving_size":0,
		"unit":"",
		"food":""
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
		"serving_size":0,
		"unit":"",
		"food_name":""
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
		"serving_size":0,
		"unit":"",
		"food_name":""
  }
}

// nutrientCalc의 모든 값이 0값, nutrientCalcCopy을
let nutrientCalcReset = {
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
		  "serving_size":0,
		  "unit":"",
		  "food_name":""
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
		  "serving_size":0,
		  "unit":"",
		  "food":""
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
		  "serving_size":0,
		  "unit":"",
		  "food_name":""
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
		  "serving_size":0,
		  "unit":"",
		  "food_name":""
	}
  }

// 영양소별 일일권장섭취량
// 임시 성별 변수, memberInfo.gender로 변경이 될 수도... 
let gender = "male"

let recommendedNutrient = {}
if (gender == 'male') {
	recommendedNutrient = {
		"energy" : [2600, "총칼로리", "cal"],
		"carbohydrate" : [130, "탄수화물", "g"],
		"fat" : [13, "지방", "g"],
		"protein" : [50, "단백질", "g"],
		"water" : [2600, "수분", "mL"],
		"dietary_fiber" : [30, "식이섬유", "g"],
		"calcium" : [800, "칼슘", "mg"],
		"natrium" : [1500, "나트륨", "mg"],
		"potassium" : [3500, "칼륨", "mg"],
		"magnesium" : [350, "마그네슘", "mg"],
		"iron_mg" : [100, "철", "mg"],
		"vitamin_b1" : [1.2, "비타민B1", "mg"],
		"vitamin_b12" : [2.4, "비타민B12", "ug"],
		"vitamin_b2" : [1.3, "비타민B2", "mg"],
		"vitamin_c" : [100, "비타민C", "mg"],
		"vitamin_d3" : [10, "비타민D3", "ug"],
		"total_sugars" : [100, "당분", "g"]
	}
} else if (gender == 'female') {
	recommendedNutrient = {
		"energy" : [2000, "총칼로리", "cal"],
		"carbohydrate" : [130, "탄수화물", "g"],
		"fat" : [13, "지방", "g"],
		"protein" : [55, "단백질", "g"],
		"water" : [2100, "수분", "mL"],
		"dietary_fiber" : [20, "식이섬유", "g"],
		"calcium" : [700, "칼슘", "mg"],
		"natrium" : [1500, "나트륨", "mg"],
		"potassium" : [3500, "칼륨", "mg"],
		"magnesium" : [350, "마그네슘", "mg"],
		"iron_mg" : [10, "철", "mg"],
		"vitamin_b1" : [1.2, "비타민B1", "mg"],
		"vitamin_b12" : [2.4, "비타민B12", "ug"],
		"vitamin_b2" : [1.3, "비타민B2", "mg"],
		"vitamin_c" : [100, "비타민C", "mg"],
		"vitamin_d3" : [10, "비타민D3", "ug"],
		"total_sugars" : [100, "당분", "g"]
	}
}

let memberList;

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
	  console.log("monggoDB 수신완료");
	  console.log("memberInfo", memberInfo);
      console.log("memberDailyInfo", memberDailyInfo);
	  
    },
    error: function () {
      console.log("monggoDB 수신 실패");
    },
  });
};

const loadMemberList = async () => {
	await $.ajax({
	  url: "/HttpApi.say?c=getAllMember",
	  success: function (data) {
		memberListInfo = data;	
		console.log("회원목록 수신완료");
		memberList = JSON.parse(memberListInfo);
		console.log("memberList", memberList);
	  },
	  error: function () {
		console.log("회원목록 수신실패");
	  },
	});
};

//전체회원 명단 만들기
const rendTotalName = () => {
    let totalName = document.querySelector('#memberList');
    memberList.forEach(element => {
        totalName.innerHTML +=`
            <div class="card" style="width: 15rem; "max-width:250px;">
                    <img class="card-img-top" src="${element.photopath}" alt="Card image cap" style="max-width:250px; max-height:200px;">
                            <a class="dropdown-item" href="/Diet.say?c=main&no=${element.no}&name=${element.name}&age=${element.age}&gender=${element.gender}&weight=${element.weight}&height=${element.height}&trainer=${element.trainer}"><span style="font-weight: bold;">${element.name}님</span></a>
            </div>
    `
    });
}

const memberName = async() =>{
    await loadMemberList();
    rendTotalName()
}

memberName();

// 회원이 그날 머근 영양소들의 합을 아침, 점심, 저녁, 간식별로 합산
const calcNutrient = function() {
  
  // 영양소 합산 후 초기화 작업(깊은 복사)

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

// 하루 섭취한 모든 음식의 주요 영양소 합산 도너 그래프
const mainNutrientDoughnutChart = function (inputData) {

	let setLabels = [];
	let dataValues = [];
	for (let i = 1; i < 4; i++) {
		setLabels.push(inputData[i].name);
		dataValues.push(inputData[i].eating);
	}

	let doughtnutChart_1 = $('#doughtnut-chart1');
	let myDoughtnutChart1 = new Chart(doughtnutChart_1, {
		type:'doughnut',
		data:{
			labels: setLabels,
			datasets:[
				{
					data: dataValues,
					backgroundColor:[ '#5858FA',
					'#bc69fa',
					'#2E9AFE', 
					'#2EFEC8',
					'#8258FA',
					'#00E1FD', 
					'#819FF7'],
					borerColor:[ "rgb(242,166,54)",
								 "rgb(206,29,22)",
								 "rgb(40,161,130)"],
					hoverBackgroundColor:[
						'#7C7CFF', // #5858FA와 비슷한 색상
						'#D982FF', // #bc69fa와 비슷한 색상
						'#4CBDFE', // #2E9AFE와 비슷한 색상
						'#5DFED9', // #2EFEC8와 비슷한 색상
						'#8F7CFF', // #8258FA와 비슷한 색상
						'#4DF2FF', // #00E1FD와 비슷한 색상
						'#91AFFF'  // #819FF7와 비슷한 색상
					  ],
					borderWidth: 1
				},

			]
		},
		options:{
			maintainAspectRatio :false,
			legend:{
				display:false
			}
		}
	});
}

// 하루 섭취한 모든 음식의 서브 영양소(무기질) 합산 도너 그래프
const mainNutrientBarChart = function (inputData) {

	let setLabels = [];
	let dataValues = [];
	for (let i = 4; i < inputData.length; i++) {
		setLabels.push(inputData[i].name);
		dataValues.push(inputData[i].width);
	}

	let BarChart_1 = $('#bar-chart1');
	let myBarnutChart2 = new Chart(BarChart_1, {
		type:'bar',
		data:{
			labels: setLabels,
			datasets:[
				{
					label: "기타 영양소",
					data: dataValues,
					backgroundColor:[ '#5858FA',
					'#bc69fa',
					'#2E9AFE', 
					'#2EFEC8',
					'#8258FA',
					'#00E1FD', 
					'#819FF7'],
					borerColor:[ "rgb(242,166,54)",
								 "rgb(206,29,22)",
								 "rgb(40,161,130)"],
					hoverBackgroundColor:[
						'#7C7CFF', // #5858FA와 비슷한 색상
						'#D982FF', // #bc69fa와 비슷한 색상
						'#4CBDFE', // #2E9AFE와 비슷한 색상
						'#5DFED9', // #2EFEC8와 비슷한 색상
						'#8F7CFF', // #8258FA와 비슷한 색상
						'#4DF2FF', // #00E1FD와 비슷한 색상
						'#91AFFF'  // #819FF7와 비슷한 색상
					  ],
					borderWidth: 1
				},

			]
		},
		options:{
			maintainAspectRatio :false,
			legend:{
				display:false
			}
		}
	});

}

let myDoughtnutChart2 = [];
// 개별 음식의 주요 영양소 도너 그래프
let oneNutrientDoughnutChart = function (inputData, index) {

	let setLabels = [];
	let dataValues = [];
	for (let i = 1; i < 4; i++) {
		setLabels.push(inputData[i].name);
		dataValues.push(inputData[i].eating);
	}

	// console.log("setLabels", setLabels);
	// console.log("dataValues", dataValues);

	let doughtnutChart_2 = $(".doughnut-chart-modal")[index];
	myDoughtnutChart2.push(new Chart(doughtnutChart_2, {
		type:'doughnut',
		data:{ 
			labels: setLabels,
			datasets:[
				{
					data: dataValues,
					backgroundColor:[ '#5858FA',
					'#bc69fa',
					'#2E9AFE', 
					'#2EFEC8',
					'#8258FA',
					'#00E1FD', 
					'#819FF7'],
					borerColor:[ "rgb(242,166,54)",
								 "rgb(206,29,22)",
								 "rgb(40,161,130)"],
					hoverBackgroundColor:[
								 "rgb(242,166,54)",
								 "rgb(206,29,22)",
								 "rgb(40,161,130)"],
					borderWidth: 1
				},

			]
		},
		options:{
			maintainAspectRatio :false,
			legend:{
				display:false
			}
		}
	}));
}

let myBarChart2 = [];
// 개별 음식의 서브 영양소(무기질) 영양소 도너 그래프
let oneNutrientBarChart = function (inputData, index) {

	let setLabels = [];
	let dataValues = [];
	for (let i = 4; i < inputData.length; i++) {
		setLabels.push(inputData[i].name);
		dataValues.push(inputData[i].eating);
	}

	let barChart_2 = $(".bar-chart-modal")[index];
	myBarChart2.push(new Chart(barChart_2, {
		type:'bar',
		data:{
			labels: setLabels,
			datasets:[
				{
					label: "기타 영양소",
					data: dataValues,
					backgroundColor:[ '#5858FA',
					'#bc69fa',
					'#2E9AFE', 
					'#2EFEC8',
					'#8258FA',
					'#00E1FD', 
					'#819FF7'],
					borerColor:[ "rgb(242,166,54)",
								 "rgb(206,29,22)",
								 "rgb(40,161,130)"],
					hoverBackgroundColor:[
								 "rgb(242,166,54)",
								 "rgb(206,29,22)",
								 "rgb(40,161,130)"],
					borderWidth: 1
				},

			]
		},
		options:{
			maintainAspectRatio :false,
			legend:{
				display:false
			}
		}
	}));
}

// 챠트에 표현할 주요 영양소의 합에 대한 변수
let sumNutrientCalc = {
	"energy" : 0,
	"carbohydrate" : 0,
	"fat" : 0,
	"protein" : 0,
	"water" : 0,
	"dietary_fiber" : 0,
	"calcium" : 0,
	"natrium" : 0,
	"potassium" : 0,
	"magnesium" : 0,
	"iron_mg" : 0,
	"vitamin_b1" : 0,
	"vitamin_b12" : 0,
	"vitamin_b2" : 0,
	"vitamin_c" : 0,
	"vitamin_d3" : 0,
	"total_sugars" : 0
}

// 차트 그릴 때 필요한 영양소 데이터에 대한 변수
let nutrientData = [];

// 페이지 그려주는 부분
const createPage = function() {

	const dietTitleMember = document.querySelector("#page-title-member");
	dietTitleMember.textContent = `${memberInfo.name}`;
	dietTitleMember.style.fontWeight = "bold";
	dietTitleMember.style.color = "#0A58CA"

	let colorSet = [
		"#CFE2FF",
		"#E0CFFC",
		"#E2D9F3",
		"#F7D6E6",
		"#F8D7DA",
		"#FFE5D0"
	];

	// 상세정보 창 챠트 생성에 필요한 데이터 변수
	let modalCanvas = [];

	// 모달 창 인덱스 번호
	let modalIndex = 0; 

	// 아침 점심 저녁 간식별 음식 리스트 그리는 페이지(음식 페이지 왼쪽 구역) ===============================================
	for (key in nutrientCalc) {
		let nutrients = [
			{	
				name: "총칼로리", 
				value: Math.round(nutrientCalc[key].energy), 
				percent: Math.round(100*(nutrientCalc[key].energy/recommendedNutrient.energy[0]))
			},
			{	
				name: "탄수화물", 
				value: Math.round(4*nutrientCalc[key].carbohydrate), 
				percent: Math.round(100*(nutrientCalc[key].carbohydrate/recommendedNutrient.carbohydrate[0]))
			},
			{	
				name: "단백질", 
				value: Math.round(4*nutrientCalc[key].protein),
				percent: Math.round(100*(nutrientCalc[key].protein/recommendedNutrient.protein[0]))
			},
			{	
				name: "지방", 
				value: Math.round(9*nutrientCalc[key].fat), 
				percent: Math.round(100*(nutrientCalc[key].fat/recommendedNutrient.fat[0]))
			}
		];
		
		// 카드 생성 부분 =================================================
		// 부모 요소 가져오기
		let parentElement = document.getElementById(`${key}_food_info`);
		
		// 새로운 div.row 요소 생성
		let rowDiv = document.createElement("div");
		rowDiv.className = "row";
		
		// 각각의 영양소를 생성하고 추가
		nutrients.forEach(function (nut, index) {
			let colDiv = document.createElement("div");
			colDiv.className = "col-md-3 col-sm-6";
		
			let xPanelDiv = document.createElement("div");
			xPanelDiv.className = "x_panel";
			xPanelDiv.style.backgroundColor = colorSet[index];
			xPanelDiv.style.borderRadius = "10px";

		
			let h4Name = document.createElement("h4");
			h4Name.textContent = nut.name;
			h4Name.style.color = "black";
			h4Name.style.fontWeight = "bold";
		
			let h4Value = document.createElement("h4");
			h4Value.textContent = nut.value + "cal";
			h4Value.style.color = "black";
		
			let h4Percent = document.createElement("h4");
			h4Percent.textContent = "DV : " + nut.percent + "%";
			h4Percent.style.color = "black";
		
			xPanelDiv.appendChild(h4Name);
			xPanelDiv.appendChild(h4Value);
			xPanelDiv.appendChild(h4Percent);
		
			colDiv.appendChild(xPanelDiv);
			rowDiv.appendChild(colDiv);
		});
		// 카드 생성 부분 끝 ===============================================

		// 음식 리스트(테이블 형식) 생성 부분 ===============================

		// 음식 리스트 생성에 필요한 변수
		let foodData = [];
		
		for (let i = 0; i < nutrientReceive[key].length; i++) {
			foodData.push({
				name : nutrientReceive[key][i].food_name,
				quantity : meal[key][i].gram,
				unit : nutrientReceive[key][i].unit
			})
		}

		// 테이블 요소 생성
		const table = document.createElement("table");
		table.className = "table table-striped projects";
		table.style.marginBottom = "0px"

		// console.log("foodData", foodData)
		
		// 데이터 배열을 순회하면서 각 행을 생성합니다.
		foodData.forEach((foodItem, index) => {
			const row = document.createElement("tr");
			
			// 음식 이름 셀
			const nameCell = document.createElement("td");
			nameCell.textContent = foodItem.name;
			nameCell.style.fontSize = "17px";
			
			// 수량 셀
			const quantityCell = document.createElement("td");
			quantityCell.textContent = foodItem.quantity;
			quantityCell.style.fontSize = "15px";

			// 단위 셀
			const unitCell = document.createElement("td");
			unitCell.textContent = foodItem.unit;
			unitCell.style.fontSize = "15px";

			// 상세정보 버튼 셀
			const detailCell = document.createElement("td");
			detailCell.style.paddingBottom = "0px";
			detailCell.style.paddingTop = "5px";
			detailCell.style.paddingLeft = "20px";

			const detailButton = document.createElement("button");
			detailButton.className = "btn btn-primary btn-lg btn-block";
			detailButton.setAttribute("data-toggle", "modal");
			detailButton.setAttribute("data-target", `.bs-example-modal-lg${modalIndex}`);
			detailButton.textContent = "상세정보";

			// 상세 정보 클릭 시 생기는 팝업창(modal) 생성 부분 ==================================
			// 모달 대화 상자 생성
			const modal = document.createElement("div");
			modal.className = `modal fade bs-example-modal-lg${modalIndex}`;
			modal.setAttribute("tabindex", "-1");
			modal.setAttribute("role", "dialog");
			modal.setAttribute("aria-hidden", "true");

			modalIndex++;

			// 모달 대화 상자 생성
			const modalDialog = document.createElement("div");
			modalDialog.className = "modal-dialog modal-lg";
		
			// 모달 내용 생성
			const modalContent = document.createElement("div");
			modalContent.className = "modal-content";
		
			// 모달 헤더 생성
			const modalHeader = document.createElement("div");
			modalHeader.className = "modal-header";
			
			// 모달 제목 생성
			const modalTitle = document.createElement("h4");
			modalTitle.className = "modal-title";
			modalTitle.textContent = `${foodItem.name} 의 성분 정보`;

			// 모달에 x_content 생성
			const modalContent1 = document.createElement("div");
			modalContent1.className = "x_content";
		
			// 모달 닫기 버튼 생성
			const closeButton = document.createElement("button");
			closeButton.type = "button";
			closeButton.className = "close";
			closeButton.setAttribute("data-dismiss", "modal");
			closeButton.innerHTML = '<span aria-hidden="true">×</span>';
		
			// 모달 본문 생성
			const modalBody = document.createElement("div");
			modalBody.className = "modal-body";
		
			// 본문 내용 추가
			const modalXpanel = document.createElement("div");
			modalXpanel.className = "x_panel"

			// 모달 헤더에 제목과 닫기 버튼 추가
			modalHeader.appendChild(modalTitle);
			modalHeader.appendChild(closeButton);

			// 팝업 창 안에 표현되는 카드 생성 부분 =====================================
			// 모달 본문에 내용 추가
			// 동적으로 페이지 생성

			// 모달에 들어갈 내용에 필요한 변수
			let nutrientOne = [
				{	
					name: "총칼로리", 
					value: Math.round(nutrientReceive[key][index].energy), 
					percent: Math.round(100*(nutrientReceive[key][index].energy/recommendedNutrient.energy[0]))
				},
				{	
					name: "탄수화물", 
					value: Math.round(nutrientReceive[key][index].carbohydrate), 
					percent: Math.round(100*(nutrientReceive[key][index].carbohydrate/recommendedNutrient.carbohydrate[0]))
				},
				{	
					name: "단백질", 
					value: Math.round(nutrientReceive[key][index].protein),
					percent: Math.round(100*(nutrientReceive[key][index].protein/recommendedNutrient.protein[0]))
				},
				{	
					name: "지방", 
					value: Math.round(nutrientReceive[key][index].fat), 
					percent: Math.round(100*(nutrientReceive[key][index].fat/recommendedNutrient.fat[0]))
				},				{	
					name: "식이섬유", 
					value: Math.round(nutrientReceive[key][index].dietary_fiber), 
					percent: Math.round(100*(nutrientReceive[key][index].dietary_fiber/recommendedNutrient.dietary_fiber[0]))
				},				{	
					name: "당분", 
					value: Math.round(nutrientReceive[key][index].total_sugars), 
					percent: Math.round(100*(nutrientReceive[key][index].total_sugars/recommendedNutrient.total_sugars[0]))
				}
			];
			
			// console.log("nutrientOne", nutrientOne);

			const rowContainer = document.createElement("div");
			rowContainer.className = "row"

			nutrientOne.forEach((item, index) => {
				let colDivModal = document.createElement("div");
				colDivModal.className = "col-md-4 col-sm-6";

				let xPanelModalDiv = document.createElement("div");
				xPanelModalDiv.className = "x_panel";
				xPanelModalDiv.style.backgroundColor = colorSet[index];
				xPanelModalDiv.style.borderRadius = "10px";

				let titleH4 = document.createElement("h4");
				titleH4.style.fontWeight = "bold";
				titleH4.textContent = item.name;
				titleH4.style.color = "black";

				let valueH4 = document.createElement("h4");
				if (item.name == "총칼로리") {
					valueH4.textContent = item.value + "cal";
					valueH4.style.color = "black";
				} else {
					valueH4.textContent = item.value + "g";
					valueH4.style.color = "black";
				}

				let dvH4 = document.createElement("h4");
				dvH4.textContent = "DV : " + item.percent + "%";
				dvH4.style.color = "black";

				xPanelModalDiv.appendChild(titleH4);
				xPanelModalDiv.appendChild(valueH4);
				xPanelModalDiv.appendChild(dvH4);

				colDivModal.appendChild(xPanelModalDiv);
				rowContainer.appendChild(colDivModal);
			});
			
			modalContent1.appendChild(rowContainer)
			modalBody.appendChild(modalContent1);

			// 팝업 창 안에 표현되는 카드 생성 부분 끝 ===================================

			// 팝업 창 안에 표현되는 챠트 생성 부분 =====================================
			let oneNutrientData = []; 

			for (const key2 in recommendedNutrient) {
				oneNutrientData.push({
					name : recommendedNutrient[key2][1],
					width : Math.round(100 * nutrientReceive[key][index][key2] / recommendedNutrient[key2][0]),
					eating : Math.round(nutrientReceive[key][index][key2]),
					recommended : recommendedNutrient[key2][0],
					unit : recommendedNutrient[key2][2]
				})
			}

			// console.log("oneNutrientData", oneNutrientData);

			modalCanvas.push(oneNutrientData);

			// console.log("modalCanvas", modalCanvas);

			// 모달에 x_content 생성
			const modalContent2 = document.createElement("div");
			modalContent2.className = "x_content";

			const rowContainerCanvas = document.createElement("div");
			rowContainerCanvas.className = "row";
			rowContainerCanvas.style.height = "300px"

			const colDivModalCanvas1 = document.createElement("div");
			colDivModalCanvas1.className = "col-md-6";

			const colDivModalCanvas2 = document.createElement("div");
			colDivModalCanvas2.className = "col-md-6";

			const modalCanvas1 = document.createElement("canvas");
			modalCanvas1.className = "doughnut-chart-modal";
			
			const modalCanvas2 = document.createElement("canvas");
			modalCanvas2.className = "bar-chart-modal";

			colDivModalCanvas1.appendChild(modalCanvas1);
			colDivModalCanvas2.appendChild(modalCanvas2);

			rowContainerCanvas.appendChild(colDivModalCanvas1);
			rowContainerCanvas.appendChild(colDivModalCanvas2);

			// modalCanvas1.style.height = "300px"; 
			// modalCanvas2.style.height = "300px"; 

			modalContent2.appendChild(rowContainerCanvas);
			modalBody.appendChild(modalContent2);

			// 팝업 창 안에 표현되는 챠트 생성 부분 끝 =====================================

			// 모달 헤더와 본문을 모달 내용에 추가
			modalContent.appendChild(modalHeader);
			modalContent.appendChild(modalBody);
		
			// 모달 대화 상자에 모달 내용 추가
			modalDialog.appendChild(modalContent);
		
			// 모달 요소에 클래스 추가
			modal.appendChild(modalDialog);

			// 상세 정보 클릭 시 생기는 팝업창(modal) 생성 부분 끝 ================================

			detailCell.appendChild(detailButton);
			detailCell.appendChild(modal);
			
			// 각 셀을 행에 추가
			row.appendChild(nameCell);
			row.appendChild(quantityCell);
			row.appendChild(unitCell);
			row.appendChild(detailCell);
					
			// 행을 테이블에 추가
			table.appendChild(row);
		});
		// 새로 생성한 요소를 부모 요소에 추가
		parentElement.appendChild(rowDiv);
		parentElement.appendChild(table);		
	}
	
	// 모달 창 안에 있는 챠트 정보 세팅
	for (let i = 0; i < modalCanvas.length; i++) {
		oneNutrientDoughnutChart(modalCanvas[i], i);
		oneNutrientBarChart(modalCanvas[i], i);
		// console.log("챠트도넛 데이터", myDoughtnutChart2[i].data.datasets[0].data);
		// console.log("전 데이터", modalCanvas[i][1].eating, modalCanvas[i][2].eating, modalCanvas[i][3].eating);
	}
	
	// console.log("도넛캔버스 요소 확인 : ", $(".doughnut-chart-modal"));
	// console.log("바캔버스 요소 확인 : ", $(".bar-chart-modal"));

	// 음식 리스트(테이블 형식) 생성 부분 끝 ============================= 

	// 아침 점심 저녁 간식별 음식 리스트 그리는 페이지(음식 페이지 왼쪽 구역) 끝 ============================================
	
	// 하루 섭취한 영양소 정보 표츌- 챠트, 프로그래스바 (음식 페이지 오른쪽 구역) ============================================
	// 챠트 생성 코드는 html로 작성함

	const parentElement2 = document.querySelector('#all_nutrient_chart');

	const allNutrientChartContent1 = document.createElement("div");
	allNutrientChartContent1.className = "x_content";

	const allNutrientCanvas1 = document.createElement("canvas");
	allNutrientCanvas1.id = "doughtnut-chart1";
	allNutrientCanvas1.style.marginBottom = "20px";

	const allNutrientChartContent2 = document.createElement("div");
	allNutrientChartContent2.className = "x_content";

	const allNutrientCanvas2 = document.createElement("canvas");
	allNutrientCanvas2.id = "bar-chart1";
	allNutrientCanvas2.style.height = "300px"

	allNutrientChartContent1.appendChild(allNutrientCanvas1);
	allNutrientChartContent2.appendChild(allNutrientCanvas2);

	parentElement2.appendChild(allNutrientChartContent1);
	parentElement2.appendChild(allNutrientChartContent2);

	// 프로그래스바 생성 코드 ========================================================== 
	const parentElement = document.querySelector('#all_nutrient_progressBar');
	// console.log("nutrientCalc: ", nutrientCalc);

	// 각각의 영양소 데이터 배열을 생성합니다.
	let nutrientData = [];

	for (meal in nutrientCalc) {
		for (nutrient in nutrientCalc[meal]) {
			sumNutrientCalc[nutrient] += nutrientCalc[meal][nutrient];
		}
	}

	console.log("sumNutrientCalc", sumNutrientCalc);

	for (const key in recommendedNutrient) {
		nutrientData.push({
			name : recommendedNutrient[key][1],
			width : Math.round(100 * sumNutrientCalc[key] / recommendedNutrient[key][0]),
			eating : Math.round(sumNutrientCalc[key]),
			recommended : recommendedNutrient[key][0],
			unit : recommendedNutrient[key][2]
		})
	}

	mainNutrientDoughnutChart(nutrientData);
	mainNutrientBarChart(nutrientData);

	// 각각의 영양소 데이터를 기반으로 요소를 생성하고 추가합니다.
	nutrientData.forEach((data) => {
		// div 요소 생성
		const nutrientDiv = document.createElement("div");
		nutrientDiv.className = "nutrient";

		// div 요소생성
		const nutrientHeaderDiv = document.createElement("div");
		nutrientHeaderDiv.className = "nutrient-header";
		nutrientHeaderDiv.style.display = "flex";

		// 첫 번째 h5 요소 생성
		const h2Element = document.createElement("h2");
		h2Element.textContent = data.name;
		h2Element.style.flex = "1"; // 왼쪽 정렬 스타일 적용

		// 두 번째 h5 요소 (오른쪽 정렬)
		const rightAlignedH5 = document.createElement("h2");
		rightAlignedH5.textContent = `${data.eating}${data.unit} / ${data.recommended}${data.unit} (${data.width}%)`;
		rightAlignedH5.style.textAlign = "right"; // 텍스트 오른쪽 정렬 스타일 적용
		rightAlignedH5.style.marginLeft = "auto"; // 왼쪽 마진을 auto로 설정하여 오른쪽 정렬 스타일 적용

		// progress 요소 생성
		const progressDiv = document.createElement("div");
		progressDiv.className = "progress";

		// progress-bar 요소 생성
		const progressBar = document.createElement("div");
		if (data.width <= 100) {
			progressBar.className = "progress-bar progress-bar-striped";
		} else {
			progressBar.className = "progress-bar-striped bg-danger";
		}
		progressBar.setAttribute("role", "progressbar");
		progressBar.style.width = `${data.width}%`;
		progressBar.setAttribute("aria-valuenow", data.width);
		progressBar.setAttribute("aria-valuemin", "0");
		progressBar.setAttribute("aria-valuemax", "100");

		// progressDiv에 progressBar를 추가
		progressDiv.appendChild(progressBar);

		nutrientHeaderDiv.appendChild(h2Element);
		nutrientHeaderDiv.appendChild(rightAlignedH5);

		// nutrientDiv에 h5Element와 progressDiv를 추가
		nutrientDiv.appendChild(nutrientHeaderDiv);
		nutrientDiv.appendChild(progressDiv);

		// 부모 요소에 nutrientDiv를 추가
		parentElement.appendChild(nutrientDiv);

		nutrientDiv.style.marginBottom = "5px";

	});
	// 프로그래스바 생성 코드 끝 ============================================================= 
	// 하루 섭취한 영양소 정보 표츌- 챠트, 프로그래스바 (음식 페이지 오른쪽 구역) ============================================
}

// 달력 클릭해서 페이지 로딩 시 createPage()로 생성된 html구문 모두 삭제
function removeAllChildren(parentElementId) {
    // 부모 요소를 가져옵니다.
    const parentElement = document.getElementById(parentElementId);
    
    // 부모 요소가 존재하면 모든 자식 요소를 제거합니다.
    if (parentElement) {
        while (parentElement.firstChild) {
            parentElement.removeChild(parentElement.firstChild);
        }
    }
}

// MonggoDB에서 회원의 상세정보를 가져와서 저장 후
// MonggoDB에서 가져온 food_code로 MariaDB에 있는 음식정보 테이블을 참조 후
// 음실별 영양정보 리스트를 받아오는 함수
const loadmember = async () => {
  // MonggoDB에 ajax요청 후 데이터를 받을 때까지 대기

  console.log("실행순서1")
  await loadMemberDailyInfo();
  console.log("실행순서2")
  // await loadMemberList();

  console.log("실행순서3")
   //rendTotalName();
  
  // MonggoDB에서 받은 음식 정보만을 meal객체에 저장
	meal = {
		"breakfast":memberDailyInfo[(day_n - 1)].diet.breakfast,
		"lunch":memberDailyInfo[(day_n - 1)].diet.lunch,
		"dinner":memberDailyInfo[(day_n - 1)].diet.dinner,
		"otherfood":memberDailyInfo[(day_n - 1)].diet.otherfood
	};

	// console.log(meal);

	// 음식정보가 있는 MariaDB에 접근하기 위해
	// meal을 전송 -> meal이 가지고 있는 food_cood로 MariaDB를 참조 후
	// 음식별 영양정보 수신
    const sendFoodCode = async () => {
        await $.ajax({
            url : "/Diet.say?c=foodCode", // 해당 페이지에서 데이터 송/수신이 동시에 일어남
            type : "POST",
            data : {
				// meal을 전송하기 위해 JSON으로 변환 후 foodCode에 저장
                foodCode : JSON.stringify(meal)                
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
	console.log("실행순서4")
    await sendFoodCode();

	console.log("meal : ", meal);
    console.log("nutrientReceive : ", nutrientReceive);

	// 영양소 정보 합산 실행
    calcNutrient();
	createPage();

	console.log("실행순서5")
	$('#single_calCustom').daterangepicker({
        singleDatePicker: true,
        singleClasses: "picker_1"
    }, function (start, end, label) {
        globalEnd = end.toISOString();
        console.log(start.toISOString(), end.toISOString(), label);

		let dateString = globalEnd;
		let dateObject = new Date(dateString);

		let clickYear = String(dateObject.getFullYear()); // 연도 추출
		let clickMonth = String(dateObject.getMonth() + 1).padStart(2, '0'); // 월 추출 (0부터 시작하므로 1을 더하고 2자리 문자열로 변환)
		let clickDay = String(dateObject.getDate()).padStart(2, '0'); // 일 추출

		console.log("달력 클릭 시 날짜", clickYear, clickMonth, clickDay);

		year = clickYear;
		month = clickMonth;
		day = clickDay;

		// MonggoDB에 데이터를 받아오기 위해 ajax통신 필요
		// ajax요청에 사용되는 url에 들어가는 가변값들 변순 선언
		urlYear = year //년도
		urlMonth = month; //월
		urlDay = day; //일
		day_n = Number(urlDay); // 일수의 자리수가 한자리 일 때 0을 제거하기 위해 선언한 변수

		// ajax요청에 사용되는 rul
		moveUrl = `http://localhost/Members.say?c=member&collection=${
			urlYear + urlMonth
		}&fieldName=_id&value=${memberID}&valueType=int&dataType=json`;

		console.log("실행순서6")
		removeAllChildren("breakfast_food_info");
		removeAllChildren("lunch_food_info");
		removeAllChildren("dinner_food_info");
		removeAllChildren("otherfood_food_info");
		removeAllChildren("all_nutrient_chart");
		removeAllChildren("all_nutrient_progressBar");

		console.log("실행순서7")
		for (m in nutrientCalc) {
			for (n in nutrientCalc[m]) {
				nutrientCalc[m][n] = 0;
			}
		}
		console.log("실행순서8")
		for (m in sumNutrientCalc) {
			sumNutrientCalc[m] = 0;
		}

		myDoughtnutChart2 =[];
		myBarChart2 = [];

		console.log("실행순서9")
		loadmember();
    });
	
};

loadmember();

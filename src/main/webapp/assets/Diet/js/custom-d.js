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
		"dietary_fiber" : [30, "식이섬유", "g"],
		"water" : [2600, "수분", "mL"],
		"vitamin_b1" : [1.2, "비타민B1", "mg"],
		"vitamin_b12" : [2.4, "비타민B12", "ug"],
		"vitamin_b2" : [1.3, "비타민B2", "mg"],
		"vitamin_c" : [100, "비타민C", "mg"],
		"vitamin_d3" : [10, "비타민D3", "ug"],
		"calcium" : [800, "칼슘", "mg"],
		"natrium" : [1500, "나트륨", "mg"],
		"potassium" : [3500, "칼륨", "mg"],
		"magnesium" : [350, "마그네슘", "mg"],
		"iron_mg" : [100, "철", "mg"]
	}
} else if (gender == 'female') {
	recommendedNutrient = {
		"energy" : [2000, "총칼로리", "cal"],
		"carbohydrate" : [130, "탄수화물", "g"],
		"fat" : [13, "지방", "g"],
		"protein" : [55, "단백질", "g"],
		"dietary_fiber" : [20, "식이섬유", "g"],
		"water" : [2100, "수분", "mL"],
		"vitamin_b1" : [1.2, "비타민B1", "mg"],
		"vitamin_b12" : [2.4, "비타민B12", "ug"],
		"vitamin_b2" : [1.3, "비타민B2", "mg"],
		"vitamin_c" : [100, "비타민C", "mg"],
		"vitamin_d3" : [10, "비타민D3", "ug"],
		"calcium" : [700, "칼슘", "mg"],
		"natrium" : [1500, "나트륨", "mg"],
		"potassium" : [3500, "칼륨", "mg"],
		"magnesium" : [350, "마그네슘", "mg"],
		"iron_mg" : [10, "철", "mg"]
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
      console.log(memberInfo.dailyInfo);
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

// 차트 정의 함수
const createChart = function () {

	// let doughtnutChart_1 = $('#doughtnut-chart1');
	// let myDoughtnutChart1 = new Chart(doughtnutChart_1, {
	// 	type:'doughnut',
	// 	data:{
	// 		labels:[nutrientData[1].name, nutrientData[2].name, nutrientData[3].name],
	// 		datasets:[
	// 			{
	// 				data:[nutrientData[1].eating, nutrientData[2].eating, nutrientData[3].eating],
	// 				backgroundColor:["rgba(242,166,54,.5)",
	// 								 "rgba(206,29,22,.5)",
	// 								 "rgba(40,161,130,.5)"],
	// 				borerColor:[ "rgb(242,166,54)",
	// 							 "rgb(206,29,22)",
	// 							 "rgb(40,161,130)"],
	// 				hoverBackgroundColor:[
	// 							 "rgb(242,166,54)",
	// 							 "rgb(206,29,22)",
	// 							 "rgb(40,161,130)"],
	// 				borderWidth: 1
	// 			},

	// 		]
	// 	},
	// 	options:{
	// 		maintainAspectRatio :false,
	// 		legend:{
	// 			display:false
	// 		}
	// 	},
	// 	plugins: {
	// 		datalabels: {
	// 		  color: 'black', // 데이터값의 텍스트 색상 설정
	// 		  anchor: 'center', // 데이터값의 위치 설정 (start, center, end 중 선택)
	// 		  align: 'center', // 데이터값의 정렬 설정 (start, center, end, top, bottom 중 선택)
	// 		  offset: 5, // 데이터값의 위치 오프셋 설정
	// 		}
	// 	  }
	// });

	// const modalDoughnutChart = function(data) {
	// 	let doughtnutChart_2 = $('#doughtnut-chart2');
	// 	let myDoughtnutChart2 = new Chart(doughtnutChart_2, {
	// 		type:'doughnut',
	// 		data:{
	// 			labels:[nutrientData[1].name, nutrientData[2].name, nutrientData[3].name],
	// 			datasets:[
	// 				{
	// 					data:[nutrientData[1].eating, nutrientData[2].eating, nutrientData[3].eating],
	// 					backgroundColor:["rgba(242,166,54,.5)",
	// 									"rgba(206,29,22,.5)",
	// 									"rgba(40,161,130,.5)"],
	// 					borerColor:[ "rgb(242,166,54)",
	// 								"rgb(206,29,22)",
	// 								"rgb(40,161,130)"],
	// 					hoverBackgroundColor:[
	// 								"rgb(242,166,54)",
	// 								"rgb(206,29,22)",
	// 								"rgb(40,161,130)"],
	// 					borderWidth: 1
	// 				},

	// 			]
	// 		},
	// 		options:{
	// 			maintainAspectRatio :false,
	// 			legend:{
	// 				display:false
	// 			}
	// 		},
	// 		plugins: {
	// 			datalabels: {
	// 			color: 'black', // 데이터값의 텍스트 색상 설정
	// 			anchor: 'center', // 데이터값의 위치 설정 (start, center, end 중 선택)
	// 			align: 'center', // 데이터값의 정렬 설정 (start, center, end, top, bottom 중 선택)
	// 			offset: 5, // 데이터값의 위치 오프셋 설정
	// 			}
	// 		}
	// 	});
	// }
}

let sumNutrientCalc = {
	"energy" : 0,
	"carbohydrate" : 0,
	"fat" : 0,
	"protein" : 0,
	"dietary_fiber" : 0,
	"water" : 0,
	"vitamin_b1" : 0,
	"vitamin_b12" : 0,
	"vitamin_b2" : 0,
	"vitamin_c" : 0,
	"vitamin_d3" : 0,
	"calcium" : 0,
	"natrium" : 0,
	"potassium" : 0,
	"magnesium" : 0,
	"iron_mg" : 0
}
let nutrientData = [];

// 페이지 그려주는 부분
const createPage = function() {

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
		  
		// 부모 요소 가져오기
		let parentElement = document.getElementById(`${key}_food_info`);
		
		// 새로운 div.row 요소 생성
		let rowDiv = document.createElement("div");
		rowDiv.className = "row";
		
		// 각각의 영양소를 생성하고 추가
		nutrients.forEach(function (nutrientData) {
			let colDiv = document.createElement("div");
			colDiv.className = "col-md-3 col-sm-6";
		
			let xPanelDiv = document.createElement("div");
			xPanelDiv.className = "x_panel";
		
			let h4Name = document.createElement("h4");
			h4Name.textContent = nutrientData.name;

			h4Name.style.fontWeight = "bold";
		
			let h4Value = document.createElement("h4");
			h4Value.textContent = nutrientData.value + "cal";
		
			let h4Percent = document.createElement("h4");
			h4Percent.textContent = nutrientData.percent + "%";
		
			xPanelDiv.appendChild(h4Name);
			xPanelDiv.appendChild(h4Value);
			xPanelDiv.appendChild(h4Percent);
		
			colDiv.appendChild(xPanelDiv);
			rowDiv.appendChild(colDiv);
		});

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
		
		// 데이터 배열을 순회하면서 각 행을 생성합니다.
		foodData.forEach((foodItem, index) => {
			const row = document.createElement("tr");
			
			// 음식 이름 셀
			const nameCell = document.createElement("td");
			nameCell.textContent = foodItem.name;
			
			// 수량 셀
			const quantityCell = document.createElement("td");
			quantityCell.textContent = foodItem.quantity;
			
			// 단위 셀
			const unitCell = document.createElement("td");
			unitCell.textContent = foodItem.unit;
			
			// 상세정보 버튼 셀
			const detailCell = document.createElement("td");
			const detailButton = document.createElement("button");
			detailButton.className = "btn btn-primary";
			detailButton.setAttribute("data-toggle", "modal");
			detailButton.setAttribute("data-target", `.bs-example-modal-lg${index}`);
			detailButton.textContent = "상세정보";

			// 모달 대화 상자 생성
			const modal = document.createElement("div");
			modal.className = `modal fade bs-example-modal-lg${index}`;
			modal.setAttribute("tabindex", "-1");
			modal.setAttribute("role", "dialog");
			modal.setAttribute("aria-hidden", "true");

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
			
		
			// 모달 헤더에 제목과 닫기 버튼 추가
			modalHeader.appendChild(modalTitle);
			modalHeader.appendChild(closeButton);
		
			// 모달 본문에 내용 추가
			
		
			// 모달 헤더와 본문을 모달 내용에 추가
			modalContent.appendChild(modalHeader);
			modalContent.appendChild(modalBody);
		
			// 모달 대화 상자에 모달 내용 추가
			modalDialog.appendChild(modalContent);
		
			// 모달 요소에 클래스 추가
			modal.appendChild(modalDialog);

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

	const parentElement = document.querySelector('.all_nutrient');

	console.log("nutrientCalc: ", nutrientCalc);

	// 각각의 영양소 데이터 배열을 생성합니다.
	// let nutrientData = [];
	
	for (meal in nutrientCalc) {
		for (nutrient in nutrientCalc[meal]) {
			sumNutrientCalc[nutrient] += nutrientCalc[meal][nutrient];
		}
	}

	for (const key in recommendedNutrient) {
		nutrientData.push({
			name : recommendedNutrient[key][1],
			width : Math.round(100 * sumNutrientCalc[key] / recommendedNutrient[key][0]),
			eating : Math.round(sumNutrientCalc[key]),
			recommended : recommendedNutrient[key][0],
			unit : recommendedNutrient[key][2]
		})
	}

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
	const h5Element = document.createElement("h5");
	h5Element.textContent = data.name;
	h5Element.style.flex = "1"; // 왼쪽 정렬 스타일 적용

	// 두 번째 h5 요소 (오른쪽 정렬)
	const rightAlignedH5 = document.createElement("h5");
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

	nutrientHeaderDiv.appendChild(h5Element);
	nutrientHeaderDiv.appendChild(rightAlignedH5);

	// nutrientDiv에 h5Element와 progressDiv를 추가
	nutrientDiv.appendChild(nutrientHeaderDiv);
	nutrientDiv.appendChild(progressDiv);

	// 부모 요소에 nutrientDiv를 추가
	parentElement.appendChild(nutrientDiv);

	nutrientDiv.style.marginBottom = "10px";

	});
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

	console.log(meal);

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
    await sendFoodCode();

	console.log("meal : ", meal);
    console.log("nutrientReceive : ", nutrientReceive);
	
	// 영양소 정보 합산 실행
    calcNutrient();
	createChart();
	createPage();
};

loadmember();
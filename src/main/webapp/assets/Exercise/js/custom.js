


// MonggoDB에 데이터를 받아오기 위해 ajax통신 필요
// ajax요청에 사용되는 url에 들어가는 가변값들 변순 선언
let year = "2023"; //년도
let month = "09"; //월
let day = "15"; //일
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
      console.log(memberInfo);
      console.log("전송 성공");
    },
    error: function () {
      console.log("전송 실패");
    },
  });
};

// MonggoDB에서 회원의 상세정보를 가져와서 저장 후
// MonggoDB에서 가져온 food_code로 MariaDB에 있는 음식정보 테이블을 참조 후
// 음식별 영양정보 리스트를 받아오는 함수
const loadmember = async () => {
  // MonggoDB에 ajax요청 후 데이터를 받을 때까지 대기
  await loadMemberDailyInfo();
  health = memberDailyInfo[day_n-1].exercise;
  console.log(health)

	// 음식정보가 있는 MariaDB에 접근하기 위해
	 //meal을 전송 -> meal이 가지고 있는 food_cood로 MariaDB를 참조 후
	 //음식별 영양정보 수신
    const sendFoodCode = async () => {
        await $.ajax({
            url : "/Exercise.say?c=exerciseID", // 해당 페이지에서 데이터 송/수신이 동시에 일어남
            type : "POST",
            data : {
	 			// meal을 전송하기 위해 JSON으로 변환 후 foodCode에 저장
                 exerciseID : JSON.stringify(health)                
             },
            dataType : 'json',
            success: function(data) {
	 		// MariaDB에 참조 후 조회한 음식정보를 nutrientReceive에 저장
                 exerciseMet = data;
                console.log("전송 성공");
                console.log(exerciseMet);
             },
            error: function(error) {
                 console.log("전송 실패", error);
            }
        })
     }

	// ajax이 끝날 때까지 대기
 await sendFoodCode(); 


// 차트에서 쓸 쿨톤 색깔들
let goodColor = [ '#bc69fa',
                  '#7386FF',
                  '#5C9EF5',
                  '#00E1FD',
                  '#01F6D5',
                  '#8258FA',
                  '#5858FA']

// 매일 입력받은 운동정보, 운동시간, 색깔 정보를 담을 리스트 선언
let dayExerciseKinds = [];
let dayExerciseTimeMinute = [];
let dayExerciseColor = [];
                  
let exerciseInfo = memberInfo.dailyInfo[day_n-1].exercise
                  
// 운동한 시간 표에 넣는 운동정보, 운동한 시간, 색깔을 리스트로 만드는 for문.
// 색깔은 최대 7개 까지만 사용 가능!

for(let i = 0; i < exerciseInfo.length; i++) {
    dayExerciseKinds.push(exerciseInfo[i].kind);
    dayExerciseTimeMinute.push(exerciseInfo[i].time_minute)
    dayExerciseColor.push(goodColor[i])
}

// console.log(dayExerciseTimeMinute);
// console.log(dayExerciseKinds);



// 가로 바 차트 (몽고 db데이터로만 구동 완료!)

let widthBarChart = $('#widthBar-chart');
let myWidthBarChart = new Chart(widthBarChart, {
type:'bar',
data:{
    labels:dayExerciseKinds,
    datasets:[
        {
            label:'단위(분)',
            // data 값 넣기
            data:dayExerciseTimeMinute,
            // 아래 3개 다 색깔 값만 넣었음.
            backgroundColor:dayExerciseColor,
            borerColor:dayExerciseColor,
            hoverBackgroundColor:dayExerciseColor,
            borderWidth: 1
        },

    ]
},
options:{
    maintainAspectRatio :false,
    legend:{
        display:false
    },
    indexAxis: 'y', 
}
});


// 매번 입력받은 몸무게를 담을 리스트 선언
let dayWeight = [];

let statusInfo = memberInfo.dailyInfo[day_n-1].status

console.log(statusInfo);

let dayofDay = []
const getDayNum = 10
for (let i = day_n - getDayNum; i <= day_n; i++){
    dayofDay.push(i + "일")
    dayWeight.push(statusInfo.weight)
}
// 라인 차트
let lineChart = $('#line-chart');
let myLineChart = new Chart(lineChart, {
  type:'line',
  data:{
      labels: dayofDay,
      datasets:[
          {
              label: year + '년 ' + month + '월',
              data: dayWeight,
              backgroundColor:'#01F6D5',
              borerColor:'#01F6D5'
              
          },
      ]
  },
  options: {
    maintainAspectRatio: false,
    scales: {
        y: {
            title: {
                display: true,
                text: '(kg)' // y축 라벨 설정
            }
        }
    }
}
});

// 도넛 차트
var doughtnutChart = document.getElementById('donutChart').getContext('2d');
var myDoughtnutChart = new Chart(doughtnutChart, {
 type: 'doughnut',
 data: {
     labels: ['스쿼트', '팔굽혀펴기', '줌바댄스', '라인댄스', 'Others'],
     datasets: [{
         data: [15, 19, 20, 15, 18],
         backgroundColor: [
            //  '#ff7590',
            //  '#9daaff',
            //  '#83b4ff', 
            //  '#2cd7ef',
            //  '#2ce4ce'

             '#bc69fa',
             '#7386FF',
             '#5C9EF5',
             '#00E1FD',
             '#01F6D5'

         ]
     }]
 },
 options: {
     cutoutPercentage: 50,
     responsive: true,
     maintainAspectRatio: false,
 }
});

// 세로 바 차트
let heightBarChart = $('#heightBar-chart');
let myHeightBarChart = new Chart(heightBarChart, {
 type:'bar',
 data:{
     labels:[
         '월요일','화요일','수요일','목요일','금요일','토요일','일요일'
     ],
     datasets:[
         {
             label:'단위 (kcal)',
             data:[230,250,150,170,200,160,210],
             backgroundColor: goodColor,
             borerColor:goodColor,
             hoverBackgroundColor:goodColor,
             borderWidth: 1
         },

     ]
 },
 options:{
     maintainAspectRatio :false,
     legend:{
         display:false
     },
 }
});



    

};



loadmember();


     
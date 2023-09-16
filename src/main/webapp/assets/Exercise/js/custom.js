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

// MonggoDB에서 받아온 회원의 운동정보를 저장하기 위한 객체
let health = {};

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

// MonggoDB에서 받은 운동 정보만을 health객체에 저장


// MonggoDB에서 회원의 상세정보를 가져와서 저장 후
// MonggoDB에서 가져온 exerciseID로 MariaDB에 있는 운동정보 테이블을 참조 후
// 운동정보 리스트를 받아오는 함수
const loadmember = async () => {
  // MonggoDB에 ajax요청 후 데이터를 받을 때까지 대기
  await loadMemberDailyInfo();
  health = memberDailyInfo[(day_n - 1)].exercise
  console.log(health);

	// 음식정보가 있는 MariaDB에 접근하기 위해
	// health 전송 -> health이 가지고 있는 exerciseID로 MariaDB를 참조 후
	// 음식별 영양정보 수신
    const sendExerciseID = async () => {
        await $.ajax({
            url : "/Exercise.say?c=exerciseID", // 해당 페이지에서 데이터 송/수신이 동시에 일어남
            type : "POST",
            data : {
				// health을 전송하기 위해 JSON으로 변환 후 exerciseID에 저장
                exerciseID : JSON.stringify(health)                
            },
            dataType : 'json',
            success: function(data) {
				// MariaDB에 참조 후 조회한 음식정보를 nutrientReceive에 저장
                nutrientReceive = data;
                console.log("전송 성공");
                console.log("운동페이지")
                console.log(data)
                console.log(data.exercise_id)
                console.log(data.exercise_name)
                console.log(data.met)
                console.log(data.met)

            },
            error: function(error) {
                console.log("전송 실패", error);
            }
        })
    }

    sendExerciseID();

	// ajax이 끝날 때까지 대기
/*     await sendFoodCode(); */

// 가로 바 차트

let ex = memberInfo.dailyInfo[day_n-1].exercise[0].kind

            
let widthBarChart = $('#widthBar-chart');
let myWidthBarChart = new Chart(widthBarChart, {
type:'bar',
data:{
    labels:[
        ex,'데드리프트','벤치프레스','바벨로우'
    ],
    datasets:[
        {
            label:'운동 목록',
            data:[80,30,40,50],
            backgroundColor:["#bc69fa",
                             "#7386FF",
                             "#5C9EF5",
                             "#00E1FD"],
            borerColor:[    "#bc69fa",
                             "#7386FF",
                             "#5C9EF5",
                             "#00E1FD"],
            hoverBackgroundColor:[
                             "#bc69fa",
                             "#7386FF",
                             "#5C9EF5",
                             "#00E1FD"],
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

// 라인 차트
let lineChart = $('#line-chart');
let myLineChart = new Chart(lineChart, {
  type:'line',
  data:{
      labels:[
          '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
      ],
      datasets:[
          {
              label:'2023년',
              data:[70,72,74,76,78,80,82,84,80,79,78,77],
              backgroundColor:'#01F6D5',
              borerColor:'#01F6D5'
              
          },

      ]
  },
  options:{
      maintainAspectRatio :false
  }
});

// 도넛 차트
var doughtnutChart = document.getElementById('donutChart').getContext('2d');
var myDoughtnutChart = new Chart(doughtnutChart, {
 type: 'doughnut',
 data: {
     labels: ['Navy', 'Blue', 'Red', 'Gray', 'Purple'],
     datasets: [{
         data: [15, 19, 20, 15, 18],
         backgroundColor: [
             // '#ff7590',
             // '#9daaff',
             // '#83b4ff', 
             // '#2cd7ef',
             // '#2ce4ce'

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
         '월요일','화요일','수요일','목요일','금요일'
     ],
     datasets:[
         {
             label:'2023년',
             data:[10,8,6,5,9],
             backgroundColor:['#bc69fa',
                              '#7386FF',
                              '#5C9EF5',
                              '#00E1FD',
                              '#01F6D5'],
             borerColor:[     '#bc69fa',
                              '#7386FF',
                              '#5C9EF5',
                              '#00E1FD',
                              '#01F6D5'],
             hoverBackgroundColor:[
                              '#bc69fa',
                              '#7386FF',
                              '#5C9EF5',
                              '#00E1FD',
                              '#01F6D5'
             ],
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


     
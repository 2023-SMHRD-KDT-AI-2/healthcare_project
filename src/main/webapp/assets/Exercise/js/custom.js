
// 현재 날짜와 시간을 가져오는 Date 객체 생성
const currentDate = new Date();

// 현재 날짜를 출력하거나 다루고 싶은 방식으로 포맷팅합니다.
// 예를 들어, 아래와 같이 포맷팅할 수 있습니다.
let sysYear = currentDate.getFullYear(); // 연도

let sysMonth_pre = currentDate.getMonth() + 1; // 월 (0부터 시작하므로 1을 더해줍니다)
let sysMonth = sysMonth_pre.toString().padStart(2, 0);

let sysDay_pre = currentDate.getDate(); // 일
let sysDay = sysDay_pre.toString().padStart(2, 0);

// 날짜와 시간을 원하는 형식으로 출력
console.log(`현재 날짜: ${sysYear}-${sysMonth}-${sysDay}`);

// MonggoDB에 데이터를 받아오기 위해 ajax통신 필요
// ajax요청에 사용되는 url에 들어가는 가변값들 변순 선언
let year = sysYear.toString(); //년도
let month = sysMonth.toString(); //월
let day = sysDay.toString(); //일
let day_n = Number(day); // 일수의 자리수가 한자리 일 때 0을 제거하기 위해 선언한 변수
let memberID = number; // 회원ID


// ajax요청에 사용되는 rul
let moveUrl = `http://localhost/Members.say?c=member&collection=${year + month
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
    console.log(moveUrl)
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

function removeAllChildren(parentElementId) {
    // 부모 요소를 가져옵니다.
    const parentElement = document.querySelector(parentElementId);
    
    // 부모 요소가 존재하면 모든 자식 요소를 제거합니다.
    if (parentElement) {
        while (parentElement.firstChild) {
            parentElement.removeChild(parentElement.firstChild);
        }
    }
}

// MonggoDB에서 회원의 상세정보를 가져와서 저장 후
// MonggoDB에서 가져온 food_code로 MariaDB에 있는 음식정보 테이블을 참조 후
// 음식별 영양정보 리스트를 받아오는 함수
const loadmember = async () => {
    // MonggoDB에 ajax요청 후 데이터를 받을 때까지 대기
    await loadMemberDailyInfo();

    // 차트에서 쓸 쿨톤 색깔들
    let goodColor = [
        "#bc69fa",
        "#7386FF",
        "#5C9EF5",
        "#00E1FD",
        "#01F6D5",
        "#8258FA",
        "#5858FA",
    ];

    // 매일 입력받은 운동정보, 운동시간, 색깔 정보를 담을 리스트 선언
    let dayExerciseKinds = [];
    let dayExerciseTimeMinute = [];
    let dayExerciseColor = [];

    let exerciseInfo = memberInfo.dailyInfo[day_n - 1].exercise;

    // 운동한 시간 표에 넣는 운동정보, 운동한 시간, 색깔을 리스트로 만드는 for문.
    // 색깔은 최대 7개 까지만 사용 가능!

    for (let i = 0; i < exerciseInfo.length; i++) {
        dayExerciseKinds.push(exerciseInfo[i].kind);
        dayExerciseTimeMinute.push(exerciseInfo[i].time_minute);
        dayExerciseColor.push(goodColor[i]);
    }

    console.log("운동 종류", dayExerciseKinds);
    console.log("운동 시간", dayExerciseTimeMinute);

    // console.log(dayExerciseTimeMinute);
    // console.log(dayExerciseKinds);

    // 가로 바 차트 (몽고 db데이터로만 구동 완료!)

    // 챠트 그리는 로직
    const divDoughnut = document.querySelector('#donutChart_div');
    const canvas1 = document.createElement('canvas');
    canvas1.id = "donutChart";
    canvas1.style.width = "280px";
    canvas1.style.height = "280px";

    divDoughnut.appendChild(canvas1);

    const divlineChart = document.querySelector('.line_chart-container');
    const canvas2 = document.createElement('canvas');
    canvas2.id = "line-chart";

    divlineChart.appendChild(canvas2);

    const divWidthBarChart = document.querySelector('.widthBarChart-container');
    const canvas3 = document.createElement('canvas');
    canvas3.id = "widthBar-chart";

    divWidthBarChart.appendChild(canvas3);

    const divHeightChart = document.querySelector('.heightChart-container');
    const canvas4 = document.createElement('canvas');
    canvas4.id = "heightBar-chart";

    divHeightChart.appendChild(canvas4);

    let widthBarChart = $("#widthBar-chart");
    let myWidthBarChart = new Chart(widthBarChart, {
        type: "bar",
        data: {
            labels: dayExerciseKinds,
            datasets: [
                {
                    label: "단위(분)",
                    // data 값 넣기
                    data: dayExerciseTimeMinute,
                    // 아래 3개 다 색깔 값만 넣었음.
                    backgroundColor: dayExerciseColor,
                    borerColor: dayExerciseColor,
                    hoverBackgroundColor: dayExerciseColor,
                    borderWidth: 1,
                },
            ],
        },
        options: {
            maintainAspectRatio: false,
            legend: {
                display: false,
            },
            indexAxis: "y",
        },
    });

    // 매번 입력받은 몸무게를 담을 리스트 선언
    let dayWeight = [];

    let statusInfo = memberInfo.dailyInfo[day_n - 1].status;

    console.log(statusInfo);

    let dayofDay = [];
    const getDayNum = 10;
    for (let i = day_n - getDayNum; i <= day_n; i++) {
        dayofDay.push(i + "일");
        dayWeight.push(statusInfo.weight);
    }
    // 라인 차트
    let lineChart = $("#line-chart");
    let myLineChart = new Chart(lineChart, {
        type: "line",
        data: {
            labels: dayofDay,
            datasets: [
                {
                    label: year + "년 " + month + "월",
                    data: dayWeight,
                    backgroundColor: "#01F6D5",
                    borerColor: "#01F6D5",
                },
            ],
        },
        options: {
            maintainAspectRatio: false,
            scales: {
                y: {
                    title: {
                        display: true,
                        text: "(kg)", // y축 라벨 설정
                    },
                },
            },
        },
    });

    let nowWeight = statusInfo.weight;

    console.log(nowWeight);
    console.log(exerciseInfo);

    // MET를 활용해서 칼로리 소모량 구하는 함수
    // 칼로리 소모량 구하는 식 MET * 체중 * 시간(분/60) == 칼로리 소비량

    // MetCalculation(met);
    const MetCalculation = function (met, weight, time_minute) {
        var CalResult = met * weight * (time_minute / 60);
        return CalResult;
    };

    let dayExerciseCal = memberDailyInfo[day_n - 1].exercise;
    let dayExerciseweight = memberDailyInfo[day_n - 1].status.weight;

    let dayExerciseCalList = [];

    // 일 운동별 칼로리 소모량 구하기
    for (let i = 0; i < dayExerciseCal.length; i++) {
       dayExerciseCalList.push(Math.floor(MetCalculation(dayExerciseCal[i].met, dayExerciseweight, dayExerciseCal[i].time_minute)));
    }



    // 도넛 차트
    var doughtnutChart = document.getElementById("donutChart").getContext("2d");
    var myDoughtnutCart = new Chart(doughtnutChart, {
        type: "doughnut",
        data: {
            labels: dayExerciseKinds,
            datasets: [
                {
                    data: dayExerciseCalList,
                    backgroundColor: dayExerciseColor,
                },
            ],
        },
        options: {
            cutoutPercentage: 50,
            responsive: true,
            maintainAspectRatio: false,
        },
    });

    const showExercise = document.getElementById('showExercise')
    console.log(showExercise)
    let dayExerciseKindsNum = 0
    const iClassdayExerciseKinds = [ "fa fa-square fa_custom1", "fa fa-square fa_custom2", "fa fa-square fa_custom3", "fa fa-square fa_custom4", 
                                     "fa fa-square fa_custom5", "fa fa-square fa_custom6", "fa fa-square fa_custom7"]
    dayExerciseKinds.forEach((element,index) => {
        console.log('test console',element)
        showExercise.innerHTML += `
        <div class="container">
        <div class="row text-left">
          <div class="col-md-1 mb-2">
            <i class="`
            + iClassdayExerciseKinds[dayExerciseKindsNum] +
            `"></i>
          </div>
          <div class="col-md-6 mb-2">
          `
          + element +
          `
          </div>
          <div class="col-md-5 mb-2">
          `
          + dayExerciseCalList[index] + " cal" +
          `
          </div>
        </div>
      </div>
        `
        dayExerciseKindsNum += 1
    });
    
    
    
    let calorieSum = 0;
    let calorieSumList = [];
    
    // 일별 총 칼로리 소모량 구하기.
    // calorieSumList에 일별 총 칼로리 소모량을 넣어둠.
    for(let i = 0; i< memberInfo.dailyInfo.length; i++) {
        for(let j = 0; j< memberDailyInfo[i].exercise.length; j++){
            calorieSum += memberInfo.dailyInfo[i].exercise[j].calorie;
        }
        calorieSumList.push(calorieSum);
        calorieSum = 0;
    }
    
    console.log("칼로리썸 : ", calorieSumList);
    
    console.log("여깃지롱2~" , memberInfo.dailyInfo);

    
    
    // 매일 입력받은 칼로리 정보를 담을 리스트 선언 
    let dayOfTheWeek_1 = [];
    let dayCalorieSumList_1 = [];
    
    
    for(let i = day_n-1; i > day_n-8; i-- ) {
        if(i>0){
            dayOfTheWeek_1.push(memberInfo.dailyInfo[i].dayOfTheWeek);
            dayCalorieSumList_1.push(Math.floor(calorieSumList[i]));
        }else{
            break;
        }
    }
  
    // 오늘을 기준으로 -7 동안의 요일과 칼로리 소모량을 담은 리스트
    let dayOfTheWeek = dayOfTheWeek_1.reverse();
    let dayCalorieSumList = dayCalorieSumList_1.reverse();

    // 세로 바 차트
    let heightBarChart = $("#heightBar-chart");
    let myHeightBarChart = new Chart(heightBarChart, {
        type: "bar",
        data: {
            labels: dayOfTheWeek,
            datasets: [
                {
                    label: "단위 (kcal)",
                    data: dayCalorieSumList,
                    backgroundColor: goodColor,
                    borerColor: goodColor,
                    hoverBackgroundColor: goodColor,
                    borderWidth: 1,
                },
            ],
        },
        options: {
            maintainAspectRatio: false,
            legend: {
                display: false,
            },
        },
    });

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

        removeAllChildren('#donutChart_div');
        removeAllChildren('.line_chart-container');
        removeAllChildren('.widthBarChart-container');
        removeAllChildren('.heightChart-container');
        removeAllChildren('#showExercise');

		loadmember();
    });

};

loadmember();

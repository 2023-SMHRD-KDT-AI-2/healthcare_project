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
// MonggoDB에서 가져온 exerciseid MariaDB에 있는 음식정보 테이블을 참조 후
// 음실별 영양정보 리스트를 받아오는 함수
const loadmember = async () => {
  // MonggoDB에 ajax요청 후 데이터를 받을 때까지 대기
  await loadMemberDailyInfo();

	// MET가 있는 MariaDB에 접근하기 위해
	// health을 전송 -> health이 가지고 있는 exerciseid MariaDB를 참조 후
	// MET 수신
    const sendExerciseID = async () => {
        await $.ajax({
            url : "/Exercise.say?c=exerciseCode", // 해당 페이지에서 데이터 송/수신이 동시에 일어남
            type : "POST",
            data : {
				// health을 전송하기 위해 JSON으로 변환 후 exerciseid 저장
                exerciseid : JSON.stringify()                
            },
            dataType : 'json',
            success: function(data) {
				// MariaDB에 참조 후 조회한 음식정보를 nutrientReceive에 저장
                console.log("전송 성공");
                met = data;
                
            },
            error: function(error) {
                console.log("전송 실패", error);
            }
        })
    }

};

const loadPage = async() => {
    await loadmember();
}

loadPage();

console.log(memberInfo);

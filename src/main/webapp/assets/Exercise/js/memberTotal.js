//전체회원 명단
let memberList = "/HttpApi.say?c=getAllMember"

// 전체회원 명단 받음
let checkMember;

// await : async안에서만 구현 가능하다!
//         await가 다 실행 된다음에 실행 된다는 거다!!!(비동기 통신의 핵심!!!)
const memberTotal = async () => {
    console.log("전체회원 명단 : ",memberList)
    await $.ajax({
        url: memberList,
        success: function (data) {
            checkMember = JSON.parse(data);
            console.log("전체회원 명단 : ",checkMember);
            console.log("전송 성공");
            
        },
        error: function () {
            console.log("전송 실패");
        },
    });

    
};

//전체회원 명단 만들기
const rendTotalName = () => {
    let totalName = document.getElementById("totalName")
    checkMember.forEach(element => {
        totalName.innerHTML +=`
            <div class="card" style="width: 18rem; max-width:400px">
                    <img class="card-img-top" src="${element.photopath}" alt="Card image cap" style="max-width:400px; max-height:250px;">
                            <a class="dropdown-item" href="/Exercise.say?c=sub2&no=${element.no}&name=${element.name}&age=${element.age}&gender=${element.gender}&weight=${element.weight}&height=${element.height}&trainer=${element.trainer}"><span style="font-weight: bold;">${element.name}님</span></a>
            </div>
    `
    });
   
}
    
//회원 명단 이름, 사진 불러오는 함수
const memberName = async() =>{
    await memberTotal();

    console.log("이름 :",checkMember[0].name);

    checkMember.forEach(element => {

        console.log("이름2",element.name)

       
        
    });

    rendTotalName()
}

memberName();

// json형태로 변환
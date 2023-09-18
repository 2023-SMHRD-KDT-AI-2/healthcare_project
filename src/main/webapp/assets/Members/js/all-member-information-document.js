/*
회원 명단 / 날짜별
요청 주소
/Members.say?c=member&collection=202308&fieldName=_id&value=2&valueType=int&dataType=json 
*/

const showAllMemberElement = document.getElementById('showAllMembers');

let loadDocumentId = () => {
    let todayDate = ``;
    let memberObjectId = ``;
};

const loadAllMembers = async () => {
    let allMembersInfo = '';
    const loadMemberInfoUrl = '/Members.say?c=json';

    await fetch(loadMemberInfoUrl, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
        },
    })
        .then((response) => response.json())
        .then((json) => {
            allMembersInfo = json;
            allMembersInfo.forEach((data) => {
                showAllMemberElement.innerHTML += `
                <a class="dropdown-item" href="/Members.say?c=input&no=${data.no}&name=${data.name}&email=${data.kakao_id}&age=${data.age}&gender=${data.gender}&trainer=${data.trainer}&weight=${data.weight}&height=${data.height}">
                    ${data.no} | ${data.name}(${data.age}) | ${data.trainer}
                </a>
                `;
            });
        })
        .catch((err) => {
            console.log('[getAccessToken] failed to request user information: ' + JSON.stringify(err));
        });
};

loadAllMembers();

const loadMemberDailyInfo = async () => {
    await fetch('/Members.say', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
        },
        body: `?c=member&collection=${todayDate}&fieldName=_id&value=${memberNo}&valueType=int&dataType=json`,
    })
        .then((response) => response.json())
        .then((json) => {
            showAllMemberElement.innerHTML += json;
        })
        .catch((err) => {
            console.log('[getAccessToken] failed to request user information: ' + JSON.stringify(err));
            //window.location.href = "/Main.say";
        });
};
loadMemberDailyInfo();

let addFoodCategory = (strLabel, categoryName, num) => {
    return `<div class="x_content">
     <div class="col-md-3 col-sm-12  form-group">
         <label class="control-label col-md-3 col-sm-3 ">${strLabel} 이름</label>
         <div class="col-md-9 col-sm-9 ">
             <input type="text" placeholder=".col-md-3" class="form-control"
                 name="${categoryName}_foodname_${num}">
         </div>
     </div>
              <div class="col-md-3 col-sm-12  form-group">
             <label class="control-label col-md-3 col-sm-3 ">MET</label>
             <div class="col-md-9 col-sm-9 ">
                <input type="text" placeholder=".col-md-3" class="form-control"
                   name="met_${num}" readonly>
             </div>
          </div>
     <div class="col-md-3 col-sm-12  form-group">
         <label class="control-label col-md-3 col-sm-3 ">${strLabel} 
             먹은 양</label>
         <div class="col-md-9 col-sm-9 ">
             <input type="text" placeholder=".col-md-3" class="form-control"
                 name="${categoryName}_gram_${num}">
         </div>
     </div>
     <div class="col-md-3 col-sm-12  form-group">
         <label class="control-label col-md-3 col-sm-3 ">${strLabel} 
             먹은 칼로리</label>
         <div class="col-md-9 col-sm-9 ">
             <input type="text" placeholder=".col-md-3" class="form-control"
                 name="${categoryName}_calorie_${num}">
         </div>
     </div>
 </div>
 `;
};

const exerciseAdd = document.getElementById('exerciseAdd');
const exercisePanel = document.getElementById('exercise_panel');

let exerciseNum = 1;

exerciseAdd.onclick = () => {
    exerciseNum += 1;
    const appendHTML = addCategory('운동', 'exercise', exerciseNum);
    exercisePanel.innerHTML += appendHTML;
};

const bfAdd = document.getElementById('bfAdd');
const lunchAdd = document.getElementById('lunchAdd');
const dinnerAdd = document.getElementById('dinnerAdd');
const otherAdd = document.getElementById('otherAdd');
const bfPanel = document.getElementById('breakfast_panel');
const lunchPanel = document.getElementById('lunch_panel');
const dinnerPanel = document.getElementById('dinner_panel');
const otherPanel = document.getElementById('other_panel');

let bfNum = 1;
let lunchNum = 1;
let dinnerNum = 1;
let otherNum = 1;

bfAdd.onclick = () => {
    bfNum += 1;
    const appendHTML = addFoodCategory('아침', 'breakfastFood', bfNum);
    bfPanel.innerHTML += appendHTML;
};

lunchAdd.onclick = () => {
    lunchNum += 1;
    const appendHTML = addFoodCategory('점심', 'lunchFood', lunchNum);
    lunchPanel.innerHTML += appendHTML;
};

dinnerAdd.onclick = () => {
    dinnerNum += 1;
    const appendHTML = addFoodCategory('저녁', 'dinnerFood', dinnerNum);
    dinnerPanel.innerHTML += appendHTML;
};

otherAdd.onclick = () => {
    otherNum += 1;
    const appendHTML = addFoodCategory('간식', 'otherFood', otherNum);
    otherPanel.innerHTML += appendHTML;
};

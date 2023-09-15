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
    const appendHTML = addCategory('아침', 'breakfastFood', bfNum);
    bfPanel.innerHTML += appendHTML;
};

lunchAdd.onclick = () => {
    lunchNum += 1;
    const appendHTML = addCategory('점심', 'lunchFood', lunchNum);
    lunchPanel.innerHTML += appendHTML;
};

dinnerAdd.onclick = () => {
    dinnerNum += 1;
    const appendHTML = addCategory('저녁', 'dinnerFood', dinnerNum);
    dinnerPanel.innerHTML += appendHTML;
};

otherAdd.onclick = () => {
    otherNum += 1;
    const appendHTML = addCategory('간식', 'otherFood', otherNum);
    otherPanel.innerHTML += appendHTML;
};

let addCategory = (strLabel, categoryName, num) => {
	return `<div class="x_content">
    <div class="col-md-4 col-sm-12  form-group">
        <label class="control-label col-md-3 col-sm-3 ">${strLabel} 이름</label>
        <div class="col-md-9 col-sm-9 ">
            <input type="text" placeholder=".col-md-3" class="form-control"
                name="${categoryName}_foodname_${num}">
        </div>
    </div>
    <div class="col-md-4 col-sm-12  form-group">
        <label class="control-label col-md-3 col-sm-3 ">${strLabel} 
            먹은 양</label>
        <div class="col-md-9 col-sm-9 ">
            <input type="text" placeholder=".col-md-3" class="form-control"
                name="${categoryName}_gram_${num}">
        </div>
    </div>
    <div class="col-md-4 col-sm-12  form-group">
        <label class="control-label col-md-3 col-sm-3 ">${strLabel} 
            먹은 칼로리</label>
        <div class="col-md-9 col-sm-9 ">
            <input type="text" placeholder=".col-md-3" class="form-control"
                name="${categoryName}_calorie_${num}">
        </div>
    </div>
</div>
`;
}
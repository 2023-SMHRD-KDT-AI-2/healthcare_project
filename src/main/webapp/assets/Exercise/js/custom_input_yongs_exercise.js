const exerciseAdd = document.getElementById('exerciseAdd');
const exercisePanel = document.getElementById('exercise_panel');

let exerciseNum = 1;

exerciseAdd.onclick = () => {
   exerciseNum += 1;
   const appendHTML = addCategory('운동', 'exercise', exerciseNum);
   exercisePanel.innerHTML += appendHTML;
};


let addCategory = (strLabel, categoryName, num) => {
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
}
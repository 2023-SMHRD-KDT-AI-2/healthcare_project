        
        
          src="./code.jquery.com_jquery-3.7.1.min.js"
          src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"
         
         let barChart2 = $('#bar-chart2');
         let myBarChart2 = new Chart(barChart2, {
             type:'bar',
             data:{
                 labels:[
                     '월','화','수','목','금','토','일'],
                 datasets:[
                     {
                         label:'2023년',
                         data:[10,8,6,5,8,15,16],
                         backgroundColor:["rgba(242,166,54,.5)",
                                          "rgba(39,79,76,.5)",
                                          "rgba(40,161,130,.5)",
                                          "rgba(206,29,22,.5)",
                                          "rgba(242,166,54,.5)",
                                          "rgba(39,79,76,.5)",
                                          "rgba(40,161,130,.5)"],
                         borerColor:[ "rgba(242,166,54,.5)",
                                      "rgba(39,79,76,.5)",
                                      "rgba(40,161,130,.5)",
                                      "rgba(206,29,22,.5)",
                                      "rgba(242,166,54,.5)",
                                      "rgba(39,79,76,.5)",
                                      "rgba(40,161,130,.5)"],
                         hoverBackgroundColor:[
                                      "rgb(242,166,54)",
                                      "rgb(39,79,76)",
                                      "rgb(40,161,130)",
                                      "rgb(206,29,22)",
                                      "rgba(242,166,54,.5)",
                                      "rgba(39,79,76,.5)",
                                      "rgba(40,161,130,.5)"
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
                 indexAxis: 'y', 
             }
         });
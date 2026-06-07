function getToday(){
    return new Date().getDate()
}
function getCurrentMonth(){
    return new Date().getMonth()
}
function getCurrentYear(){
    return new Date().getFullYear()
}

function getDaysInMonth(year, month){
    return new Date(year, month + 1, 0).getDate()
}
function getFirstDayOfMonth(year, month){
    return new Date(year, month, 1).getDay()
}

function getMonthName(month){
    const months = [ 
        "January", "February", "March", "April",
        "May", "June", "July", "August",
        "September", "October", "November", "December"
    ]
    return months[month]
}

function buildGridLayout(month, year){
    let grid = []

    let firstDayOfMonth = new Date(year, month, 1).getDay()

    for(let i = 0; i < firstDayOfMonth; i++){   
        grid.push({day:0, isCurrentMonth:false})
    }

    for(let j = 0; j < getDaysInMonth(year, month); j++){
        grid.push({day:j+1, isCurrentMonth:true})
    }
    
    while(grid.length <= 42){
        grid.push({day:0,isCurrentMonth:false})
    }

    return grid
}

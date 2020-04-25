var cells = new Array(42) // מערך של כל התאים במשחק
var p1Counter = 0; //מונה של מספר המהלכים של משתמש 1
var p2Counter = 0; //מונה של מספר המהלכים של משתמש 2

function play(cell) {
    if (p2Counter < p1Counter) {
        p2Play(cell);
    }
    else {
        p1Play(cell);

    }
    checkAllWin();
}

function p1Play(cell) {
    var cell = (cell);
    if (cells[cell] != null) {
        alert("cell is already taken");
        return (null);
    }
    if (cell < 35 && cells[(parseInt(cell) + 7).toString()] == null) {
        alert("you can only place a disk under another disk");
        return (null);
    }
    document.getElementById(cell).className = "red";
    cells[cell] = 1;
    p1Counter++;

}

function p2Play(cell) {
    var cell = (cell);
    if (cells[cell] != null) {
        alert("cell is already taken");
        return (null);
    }
    if (cell < 35 && cells[(parseInt(cell) + 7).toString()] == null) {
        alert("you can only place a disk under another disk");
        return (null);
    }
    document.getElementById(cell).className = "blue";
    cells[cell] = 2;
    p2Counter++;

}

function checkAllWin() {
    checkHorizontalWin();
    checkVerticalWin();
    checkGoingUpDiagonalWin();
    checkGoingDownDiagonalWin();
}

function checkHorizontalWin() {
    var horizontalArr = [0, 1, 2, 3, 7, 8, 9, 10, 14, 15, 16, 17, 21, 22, 23, 24, 28, 29, 30, 31, 35, 36, 37, 38];
    for (var i = 0; i < horizontalArr.length; i++) {
        currentNum = horizontalArr[i];
        if (cells[currentNum] == 1 && cells[currentNum + 1] == 1 && cells[currentNum + 2] == 1 && cells[currentNum + 3] == 1) {
            colorHorizontally(currentNum);
            alert("p1 won");
            disable();
        }
        if (cells[currentNum] == 2 && cells[currentNum + 1] == 2 && cells[currentNum + 2] == 2 && cells[currentNum + 3] == 2) {
            colorHorizontally(currentNum);
            alert("p2 won");
            disable();
        }
    }
}
function checkVerticalWin() {
    var verticalArr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    for (var i = 0; i < verticalArr.length; i++) {
        currentNum = verticalArr[i];
        if (cells[currentNum] == 1 && cells[currentNum + 7] == 1 && cells[currentNum + 14] == 1 && cells[currentNum + 21] == 1) {
            colorvertically(currentNum);
            alert("p1 won");
            disable();
        }
        if (cells[currentNum] == 2 && cells[currentNum + 7] == 2 && cells[currentNum + 14] == 2 && cells[currentNum + 21] == 2) {
            colorvertically(currentNum);
            alert("p2 won");
            disable();
        }
    }
}
function checkGoingUpDiagonalWin() {
    var goingUpDiagonalArr = [21, 22, 23, 24, 28, 29, 30, 31, 35, 36, 37, 38];
    for (var i = 0; i < goingUpDiagonalArr.length; i++) {
        currentNum = goingUpDiagonalArr[i];
        if (cells[currentNum] == 1 && cells[currentNum - 6] == 1 && cells[currentNum - 12] == 1 && cells[currentNum - 18] == 1) {
            colorGoingUpDiagonally(currentNum);
            alert("p1 won");
            disable();
        }
        if (cells[currentNum] == 2 && cells[currentNum - 6] == 2 && cells[currentNum - 12] == 2 && cells[currentNum - 18] == 2) {
            colorGoingUpDiagonally(currentNum);
            alert("p2 won");
            disable();
        }
    }
}
function checkGoingDownDiagonalWin() {
    var goingDownDiagonalArr = [0, 1, 2, 3, 7, 8, 9, 10, 14, 15, 16, 17];
    for (var i = 0; i < goingDownDiagonalArr.length; i++) {
        currentNum = goingDownDiagonalArr[i];
        if (cells[currentNum] == 1 && cells[currentNum + 8] == 1 && cells[currentNum + 16] == 1 && cells[currentNum + 24] == 1) {
            colorGoingDownDiagonally(currentNum);
            alert("p1 won");
            disable();
        }
        if (cells[currentNum] == 2 && cells[currentNum + 8] == 2 && cells[currentNum + 16] == 2 && cells[currentNum + 24] == 2) {
            colorGoingDownDiagonally(currentNum);
            alert("p2 won");
            disable();
        }
    }
}

function colorHorizontally(num) {
    for (var i = num; i < num + 4; i++) {
        document.getElementById(i).style.border = "1px solid yellow"
    }
}
function colorvertically(num) {
    for (var i = num; i < num + 28; i = i + 7) {
        document.getElementById(i).style.border = "1px solid yellow"
    }
}
function colorGoingUpDiagonally(num) {
    for (var i = num; i > num - 24; i = i - 6) {
        document.getElementById(i).style.border = "1px solid yellow"
    }
}
function colorGoingDownDiagonally(num) {
    for (var i = num; i < num + 32; i = i + 8) {
        document.getElementById(i).style.border = "1px solid yellow"
    }
}

function disable() {
    for (var i = 0; i < 41; i++) {
        document.getElementById(i).disabled = true;
    }
}
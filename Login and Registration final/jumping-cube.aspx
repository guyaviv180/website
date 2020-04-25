<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="jumping-cube.aspx.cs" Inherits="Login_and_Registration_final.jumping_cube" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="display:none">
        <img id="wood" width="50" height="50" src="wood.jpg" />
        <img id="whale" width="50" height="50" src="skins/whale.png" />
        <img id="green_flannel" width="50" height="50" src="skins/green_flannel.jpeg" />
        <img id="red_flannel" width="50" height="50" src="skins/red_flannel.jpeg" />
        <img id="white_flannel" width="50" height="50" src="skins/white_flannel.jpeg" />
    </div>
    <script src="graphics.js"></script>
    <button id="1" type="button" onclick="game(wood)"><img src="wood.jpg" height="50" width="50" /></button> 
    <button id="2" type="button" onclick="game(whale)"><img src="skins/whale.png" height="50" width="50" /></button>
    <button id="3" type="button" onclick="game(green_flannel)"><img src="skins/green_flannel.jpeg" height="50" width="50" /></button>
    <button id="4" type="button" onclick="game(red_flannel)"><img src="skins/red_flannel.jpeg" height="50" width="50" /></button>
    <button id="5" type="button" onclick="game(white_flannel)"><img src="skins/white_flannel.jpeg" height="50" width="50" /></button>

    <br />
    <canvas id="myCanvas" width="600" height="300" style="background-color:lightblue; direction:ltr"></canvas>

    <script>
        canvas = document.getElementById("myCanvas");
        context = canvas.getContext("2d");
        drawText(50, 150, "40px Times New Roman", "white", "Choose a skin to start playing");
        drawText(100, 200, "40px Times New Roman", "white", "Press spacebar to jump ")
    </script>

    <script>
        function game(image) {
            var image = image;
            var cubeWidth = 50;
            var cubeHeight = 50;
            var cubeX = 100;
            var cubeY = document.getElementById("myCanvas").height - cubeHeight;
            var score = 0;
            var obstacleSpeed = 10;
            var spaceKey = false;

            canvas = document.getElementById("myCanvas");
            context = canvas.getContext("2d");
            var fps = 30;
            countScore();
            createObstacle();
            setInterval(function () {
                moveCube();
                moveObstacle();
                draw();
            }, 1000 / fps)
            disable();
            addEventListener("keydown", onKeyDown);
            addEventListener("keyup", onKeyUp);

            function moveCube() {
                if (spaceKey == true && cubeY == canvas.height - cubeHeight) {
                    for (var i = 0; i < 5; i++) {
                        setTimeout(function () { cubeY -= 12; }, 80)
                    }
                }
                gravity();
            }

            function onKeyDown(event) {
                var keyCode = event.keyCode;
                switch (keyCode) {
                    case 32:
                        spaceKey = true;
                        break;
                }
            }

            function onKeyUp(event) {
                var keyCode = event.keyCode;
                switch (keyCode) {
                    case 32:
                        spaceKey = false;
                        break;
                }
            }

            function gravity() {
                if (cubeY != canvas.height - cubeHeight) {
                    cubeY += 5;
                }
            }

            function countScore() {
                setInterval(function () { score += 1 }, 100)
            }

            function decideWhichObstacle() {
                var x = getRandomNumber(0, 1);
                if (x == 0) {
                    obstacleWidth = getRandomNumber(20, 35);
                    obstacleHeight = getRandomNumber(60, 100);
                }
                if (x == 1) {
                    obstacleWidth = getRandomNumber(35, 100);
                    obstacleHeight = getRandomNumber(20, 40);
                }
            }

            function createObstacle() {
                decideWhichObstacle()
                obstacleWidth;
                obstacleHeight;
                obstacleX = canvas.width - obstacleWidth;
                obstacleY = canvas.height - obstacleHeight;
            }

            function moveObstacle() {
                if (obstacleX + obstacleWidth < 0) {
                    createObstacle();
                    obstacleSpeed += 0.3
                }
                obstacleX -= obstacleSpeed;
                if ((cubeX + cubeWidth) >= obstacleX && cubeX <= (obstacleX + obstacleWidth) && (cubeY + cubeHeight) >= obstacleY && cubeY <= (obstacleY + obstacleHeight)) {
                    stopGame();
                }
            }

            function stopGame() {
                alert("you lost, your score was: " + score);
                cubeY = canvas.height - cubeHeight;
                obstacleX = canvas.width - obstacleWidth;
                obstacleY = canvas.height - obstacleHeight;
                obstacleSpeed = 10;
                score = 0;
                spaceKey = false;
                location.reload();

            }

            function disable() {
                document.getElementById("1").disabled = true;
                document.getElementById("2").disabled = true;
                document.getElementById("3").disabled = true;
                document.getElementById("4").disabled = true;
                document.getElementById("5").disabled = true;
            }

            function drawPlayer() {
                context.drawImage(image, cubeX, cubeY, 50, 50);
            }

            function draw() {
                drawRectangle(0, 0, canvas.width, canvas.height, "lightblue");
                drawText(20, 40, "20px press start", "white", score);
                drawPlayer();
                drawRectangle(obstacleX, obstacleY, obstacleWidth, obstacleHeight)
            }
        }
    </script>
</asp:Content>

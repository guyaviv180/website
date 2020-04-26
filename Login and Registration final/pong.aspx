<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="pong.aspx.cs" Inherits="Login_and_Registration_final.pong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <canvas style="margin:auto; display:block" id="screen" width="800" height="600" style="background-color:black"></canvas>
    <script>
        var canvas;
        var context;
        var p1X = 0;
        var p1Y = 240;
        var P2x = 780;
        var P2y = 240;
        var ballX = 400;
        var ballY = 240;
        var XV = 5;
        var YV = 7;
        var arrowUp = false;
        var arrowDown = false;
        var P1Score = 0;
        var P2Score = 0;
        var winningScore = 5;
        var game = false;

        window.onload = function () {
            canvas = document.getElementById("screen");
            context = canvas.getContext("2d");
            var fps = 30;
            setInterval(function () {
                drawAll();
                MovePlayer();
                MoveBotAI();
                moveAll();
            }, 1000 / fps);
            addEventListener("keydown", onKeyDown);
            addEventListener("keyup", onKeyUp);
            addEventListener("keydown", onKeyDown);
            addEventListener("keyup", onKeyUp);

        }

        function MovePlayer() {
            if ((p1Y < (canvas.height - 100)) && (p1Y >= -4)) {
                if (arrowUp) { p1Y -= 10; }
                if (arrowDown) { p1Y += 10; }
            }
            else if (p1Y <= -5) { p1Y += 1; }
            else { p1Y -= 1; }
        }

        function MoveBotAI() {
            if ((P2y < (canvas.height - 100)) && (P2y >= -4)) {
                if (ballY > P2y) { P2y += 9; }
                if (ballY < P2y) { P2y -= 9; }
            }
            else if (P2y <= -5) { P2y += 1; }
            else { P2y -= 1; }

        }

        function onKeyDown(evt) {
            var keyCode = evt.keyCode;
            switch (keyCode) {
                case 38:
                    arrowUp = true;
                    break;
                case 40:
                    arrowDown = true;
                    break;
            }
        }
        function onKeyUp(evt) {
            var keyCode = evt.keyCode;
            switch (keyCode) {
                case 38:
                    arrowUp = false;
                    break;
                case 40:
                    arrowDown = false;
                    break;
            }
        }

        function moveAll() {
            ballX += XV;
            ballY += YV;

            if (ballX >= canvas.width) {
                XV = -5;
                YV = 7;
                ballX = canvas.width / 2;
                ballY = canvas.height / 2;
                P1Score++;
                ballReset();

            }
            if (ballX <= 0) {
                XV = 5;
                YV = 7;
                ballX = canvas.width / 2;
                ballY = canvas.height / 2;
                P2Score++;
                ballReset();

            }
            if (ballY >= canvas.height) { YV = -YV }
            if (ballY <= 0) { YV = -YV }
            if (((p1Y - 3 <= ballY) && (ballY <= p1Y + 100)) && ((ballX >= p1X) && (ballX <= p1X + 15))) {
                YV = (ballY - (p1Y + 50)) * 0.35;
                XV = -XV;
            }

            if (((P2y - 3 <= ballY) && (ballY <= P2y + 193)) && ((ballX >= P2x) && (ballX <= P2x + 15))) {
                YV = (ballY - (P2y + 50)) * 0.35;
                XV = -XV;
            }


        }
        function ballReset() {
            if (P1Score == 5 || P2Score == 5) {
                game = true;
                return game;
            }
        }
        function drawAll() {

            rect(0, 0, canvas.width, canvas.height, "rgba(55,55,55,0.25)", 3, 'black');
            if (game == true) {
                context.fillStyle = "white";
                if (P1Score >= winningScore) {
                    context.fillText("Left Player Won!", 200, 200);
                }
                else if (P2Score >= winningScore) {
                    context.fillText("Right Player Won!", 200, 200);
                }
                return;
            }
            rect(p1X, p1Y, 20, 120, 'white', 0, 'white');
            rect(P2x, P2y, 20, 120, 'white', 0, 'white');
            dottedLine();
            circle(ballX, ballY, 10, 'white');
            context.font = "50px Arial";
            context.fillText(P1Score, canvas.width / 4, 50);
            context.fillText(P2Score, (canvas.width * 3) / 4, 50);
        }

        function rect(x, y, length, width, Color1, LineWidth, Color2) {
            context.beginPath();
            context.rect(x, y, length, width);
            context.fillStyle = Color1;
            context.fill();
            context.lineWidth = LineWidth;
            context.strokeStyle = Color2;
            context.stroke();
        }

        function circle(x, y, radius, brushColor) {
            context.beginPath();
            context.fillStyle = brushColor;
            context.arc(x, y, radius, 0, Math.PI * 2);
            context.fill();

        }

        function dottedLine() {
            for (var i = 10; i < canvas.height; i += 40) {
                rect(canvas.width / 2 - 1, i, 2, 20, "white", 1, "white");
            }
        }


    </script>
</asp:Content>

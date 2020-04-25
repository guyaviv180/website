function drawRectangle(x, y, width, height, color, borderWidth, borderColor) {
    context.beginPath();
    context.rect(x, y, width, height);
    context.fillStyle = color;
    context.fill();
    context.lineWidth = borderWidth;
    context.strokeStyle = borderColor;
    context.stroke();
}

function drawArc(x, y, r, startAngle, endAngle, counterClockWise, color, borderWidth, borderColor) {
    context.beginPath();
    context.arc(x, y, r, startAngle, endAngle, counterClockWise);
    context.fillStyle = color;
    context.fill();
    context.lineWidth = borderWidth;
    context.strokeStyle = borderColor;
    context.stroke();

}

function drawTriangle() {
    context.beginPath();
    context.moveTo(xOfFirstPoint, yOfFirstPoint);
    context.lineTo(xOfSecondPoint, yOfSecondPoint);
    context.lineTo(xOFThirdPoint, yOFThirdPoint);
    context.lineTo(xOfFirstPoint, yOfFirstPoint);
    context.fillStyle = color;
    context.fill();
    context.lineWidth = borderWidth;
    context.strokeStyle = borderColor;
    context.stroke();
}

function drawText(x, y, sizeAndFont, color, text) {
    context.beginPath();
    context.font = sizeAndFont;
    context.fillStyle = color;
    context.fillText(text, x, y);
    context.stroke;
}

function getRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
    

    
while 1
pause(.5);
touch = myLego.TouchPressed(1);
switch touch 
    case 1
    myLego.MoveMotor('A',70);
    pause(0.1);
    myLego.StopMotor('A');
    break;
    case 0
    myLego.MoveMotor('A', 0);
    pause(0.1);
    break;
end
end
    
global key
InitKeyboard();

while 1
    pause(0.1);
        switch key

            case 'w'
                myLego.MoveMotor('AB', -75);
                pause(0.3);
                myLego.StopMotor('AB');

            case 's'
                myLego.MoveMotor('AB', 75);
                pause(0.3);
                myLego.StopMotor('AB');

            case 'a'
                myLego.MoveMotor('B', 85);
                pause(0.4);
                myLego.StopMotor('B');
                

            case 'd'
                myLego.MoveMotor('A', 85);
                pause(0.4);
                myLego.StopMotor('A');

            case 'uparrow'
                myLego.MoveMotor('C', -100);
                pause(0.4);
                myLego.StopMotor('C');

            case 'downarrow'
                myLego.MoveMotor('C', 100);
                pause(0.4);
                myLego.StopMotor('C');  

        end
end

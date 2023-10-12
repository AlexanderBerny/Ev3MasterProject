global key
InitKeyboard();

while 1
    pause(0.1);
        switch key

            case 'w'
                myLego.MoveMotor('A', -50);
                pause(0.1);
                myLego.StopMotor('A');

            case 's'
                myLego.MoveMotor('A', 50);
                pause(0.1);
                myLego.StopMotor('A');

            case 'a'
                myLego.MoveMotor('B', -50);
                pause(0.1);
                myLego.StopMotor('B');

            case 'd'
                myLego.MoveMotor('B', 50);
                pause(0.1);
                myLego.StopMotor('B');

            case 'uparrow'
                myLego.MoveMotor('C', -50);
                pause(0.1);
                myLego.StopMotor('C');

            case 'downarrow'
                myLego.MoveMotor('C', -50);
                pause(0.1);
                myLego.StopMotor('C');  

        end
end

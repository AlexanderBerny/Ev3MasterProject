% Programmers: Alexander Bernickus, Irene Fahndrich, Siri Poluri, Joshua Coreas
% Date: 11/9/2023
% Objective: Remote Control for CHPY

global key
InitKeyboard();

while 1
    pause(0.1);
        switch key

            case 'w' %Move Forward
                myLego.MoveMotor('AB', -75);
                pause(0.3);
                myLego.StopMotor('AB');

            case 's' %Move Back
                myLego.MoveMotor('AB', 75);
                pause(0.3);
                myLego.StopMotor('AB');

            case 'a'%left turn
                myLego.MoveMotor('B', 85);
                myLego.MoveMotor('A', -85);
                pause(0.4);
                myLego.StopMotor('AB');
                

            case 'd'%right turn
                myLego.MoveMotor('A', 85);
                myLego.MoveMotor('B', -85);
                pause(.4);%use .5 for when checking surroundings
                myLego.StopMotor('A');
                myLego.StopMotor('B');

            case 'uparrow' %Claw up
                myLego.MoveMotor('C', 100);
                pause(0.2);
                myLego.StopMotor('C');

            case 'downarrow' %Claw Down
                myLego.MoveMotor('C', -100);
                pause(0.2);
                myLego.StopMotor('C');
            
            case 'i' %Slow move Forward
                myLego.MoveMotor('AB', -25);
                pause(0.3);
                myLego.StopMotor('AB');

            case 'j' %Slow move left
                myLego.MoveMotor('B', 25);
                myLego.MoveMotor('A', -25);
                pause(0.4);
                myLego.StopMotor('B');
                myLego.StopMotor('A');

            case 'k' %slow move back
                myLego.MoveMotor('AB', 25);
                pause(0.3);
                myLego.StopMotor('AB');

            case 'l' %slow move right
                myLego.MoveMotor('A', 25);
                myLego.MoveMotor('B', -25);
                pause(.2);%
                myLego.StopMotor('A');
                myLego.StopMotor('B');
            
            case 'b' %go back to automation program blue is now 1
                blue = 1;
                run('C:\Users\dapea\OneDrive\Documents\MATLAB\Masterproject\AutomationProto.m')

            case 'y' %go back to automation program yellow and green are now 1
                yellow = 1;
                green = 1;
                run('C:\Users\dapea\OneDrive\Documents\MATLAB\Masterproject\AutomationProto.m')


        end
end

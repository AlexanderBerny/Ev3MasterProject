%go straight

%check if walls infront
    %if ==255 or <=3 
        %too close
        %move back

global key
InitKeyboard();
myLego.GyroCalibrate(3);

moving = 1;

    while 1
        pause(0.1);
        angle = myLego.GyroAngle(3);
        color = myLego.ColorCode(2);
        fDistance = myLego.UltrasonicDist(4);
        rDistance = myLego.UltrasonicDist(4);

            switch key

                case 'g'      %Begin automation with g
                    
                    while(moving == 1)

                        angle = myLego.GyroAngle(3);
                        color = myLego.ColorCode(2);
                        fDistance = myLego.UltrasonicDist(4);
                        rDistance = myLego.UltrasonicDist(4);

                    %color check
                        if (255 > fDistance > 20 && color == 0 )
                            myLego.MoveMotor('A', 75);
                            disp(fDistance);
                        
                        else if (255 > fDistance > 20 && color == 2 )
                            myLego.StopMotor('A')
                            moving = 0;
                        
                        else if (255 > fDistance > 20 && color == 5)
                            myLego.MoveMotor('A', 0)
                            pause(2);

                        else if (fDistance )

                    

                    
                    

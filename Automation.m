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
                            % switch to remote control %
                        else if (255 > fDistance > 20 && color == 4 )
                            myLego.StopMotor('A')
                            moving = 0;
                            % switch to remote control %
                        else if (255 > fDistance > 20 && color == 5)
                            myLego.MoveMotor('A', 0)
                            pause(2);

                        
                         else if (distance < 15)
                         myLego.StopMotor('A');
                          % turn right
                          pause(1);
                          myLego.MoveMotor('B', 90);
                          distance = myLego.UltrasonicDist(4);
                          myyLego.GyroCalibrate(3);
                          while (angle < 91)
                          if (distance > 50)
                          myLego.StopMotor('B');
                          myLego.MoveMotor('A',75);
                          
                          myLego.GyroCalibrate(3);
                          else
                          while (angle < 181)
                          myLego.MoveMotor('B',-90);
                          %rotate until 180 degress to the left%
                          distance = myLego.UltrasonicDist(3);
                          if (distance > 50)
                          myLego.StopMotor('B');
                          myLego.MoveMotor('A',75);
                          end
                          
                          
                          disp(distance);
                          pause(0.5);
                          distance = brick.UltrasonicDist(3);
                          disp(distance);

                          
                          
                    
                    
                    
                    
                    
                    
                    
                  
                    
                    

                    
                    
                    
                         
                    
                         


                   
                   
                    
                    
                    
                    
                    


                    

                    
                    

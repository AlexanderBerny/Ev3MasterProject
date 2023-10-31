%go straight

%check if walls infront
    %if ==255 or <=3 
        %too close
        %move back

global key
InitKeyboard();
myLego.GyroCalibrate(3);

moving = 1;
f
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
                        if (255 > fDistance > 20 && color == 0 )%unknown
                            myLego.MoveMotor('A', 75);
                            disp(fDistance);
                        
                        else if (255 > fDistance > 20 && color == 2 )%blue-pickup
                            myLego.StopMotor('A')
                            moving = 0;
                            % switch to remote control %
                        else if (255 > fDistance > 20 && color == 4 )%yellow-drop off
                            myLego.StopMotor('A')
                            moving = 0;
                            % switch to remote control %
                        else if (255 > fDistance > 20 && color == 5)%red-stop 2 seconds
                            myLego.MoveMotor('A', 0)
                            pause(2);
                        else if (255> fDistance > 20 && color ==3) %green- end trip
                            myLego.MoveMotor('')
                            
                        while 1
                        fridistance = myLego.UltrasonicDist(1);

                         if (distance <= 10.16)                   
                         myLego.MoveMotorAngleRel('A', 20, -495, 'Coast');
                         myLego.WaitForMotor('A');
                          elseif (distance > 10.16)
                          myLego.MoveMotor('B',75);
                          myLego.MoveMotor('A',75);
                          pause(1);
                          elseif (distance <= 10.16)
                          myLego.MoveMotorAngleRel('B', 20, 495, 'Coast'); 
                         myLego.WaitForMotor('B');
                         myLego.MoveMotorAngleRel('B', 20, -495, 'Coast'); 
                         myLego.WaitForMotor('B');
                         end
                         end
                         
                         
                         
                         

                         
                          
                          
                          
                          
                          
                    
                    
                    
                    
                    
                    
                    
                  
                    
                    

                    
                    
                    
                         
                    
                         


                   
                   
                    
                    
                    
                    
                    


                    

                    
                    

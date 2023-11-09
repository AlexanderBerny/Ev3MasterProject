%go straight

%check if walls infront
    %if ==255 or <=3 
        %too close
        %move back

global key
InitKeyboard();
pause('on');
myLego.SetColorMode(3, 2);
color = myLego.ColorCode(3);
b = true;

    while 1
        pause(0.1);
        %color = myLego.ColorCode(3);
        %fDistance = myLego.UltrasonicDist(4);
        %rDistance = myLego.UltrasonicDist(4);

            switch key

                case 'g'      %Begin automation with g
                    
                    while(moving == 1)

                        angle = myLego.GyroAngle(3);
                        color = myLego.ColorCode(2);
                        fdistance = myLego.UltrasonicDist(1);
                        rdistance = myLego.UltrasonicDist(2);

                    %color check

                        while b
                        myLego.MoveMotor('AB',-10);
                        color = myLego.ColorCode(3);
                        display(color);
                            if (color == 2)
                                %blue case AKA pick-up
                                %beep 2x
                                myLego.playTone(100,700,750);
                                pause(1);
                                myLego.playTone(100,700,750);
                                %swtich to manual
                            else if (color == 3)
                                %green case AKA end
                                %stop & beep 3x
                                myLego.StopMotor('AB');
                                myLego.playTone(100,700,750);
                                pause(1);
                                myLego.playTone(100,700,750);
                                pause(1);
                                myLego.playTone(100,700,750);
                                b = false;
                            else if (color == 4)
                                %yellow case AKA drop off
                                %switch to remote control
                            else if (color == 5)
                                %red case AKA stop light
                                %stop 2 second
                                myLego.MoveMotor('AB',0);
                                pause(2);
                                myLego.MoveMotor('AB',-10);
                            end
                            end
                            end
                            end
                            pause(2);

                            
                            %turning
                            if (fdistance <= 10.16 && rdistance >= 25.4)                   
                                myLego.MoveMotorAngleRel('A', 20, -495, 'Coast');
                                myLego.WaitForMotor('A');
                                pause(2);
                            else if (fdistance <= 10.16 && rdistance < 25.4)
                                myLego.MoveMotorAngleRel('B', 20, -495, 'Coast');
                                myLego.WaitForMotor('B');
                            else if (rdistance >= 25.4);
                                myLego.MoveMotorAngleRel('B', 20, -495, 'Coast');
                                myLego.WaitForMotor('B');
                                end
                                end
                                end

                        end
                            
                        


















                         
                         
                         
                         

                         
                          
                          
                          
                          
                          
                    
                    
                    
                    
                    
                    
                    
                  
                    
                    

                    
                    
                    
                         
                    
                         


                   
                   
                    
                    
                    
                    
                    


                    

                    
                    

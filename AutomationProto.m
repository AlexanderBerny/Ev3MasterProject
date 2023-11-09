%go straight

%check if walls infront
    %if ==255 or <=3 
        %too close
        %move back
%autonomous drive variables
global key
InitKeyboard();
%front_dist = myLego.UltrasonicDist(1);
%right_dist = myLego.UltrasonicDist(2);


%color detection variables
%pause('on');
%myLego.SetColorMode(3, 2);
%color = myLego.ColorCode(3);
%b = true;

    while 1
        pause(0.5);
        %color = myLego.ColorCode(3);
            switch key

                case 'g'      %Begin automation with g
                    
                    while 1
                        
                        %gather data
                        front_dist = myLego.UltrasonicDist(1);
                        right_dist = myLego.UltrasonicDist(2);

                        if (front_dist<=10.16)
                            display(front_dist);
                            %move back
                            myLego.MoveMotor('AB', 45);
                            pause(0.3);
                            display(right_dist);
                            if(right_dist==255 || right_dist<=18)
                                %turn left
                                myLego.MoveMotorAngleRel('B', 45, 495, 'Coast');
                                myLego.WaitForMotor('B');
                                pause(.5);
                            else if (right_dist ~= 255 && right_dist>18)
                                %turn right
                                myLego.MoveMotorAngleRel('A', 45, 495, 'Coast');
                                myLego.MoveMotorAngleRel('B', -45, 495, 'Coast');
                                myLego.WaitForMotor('A');
                                myLego.WaitForMotor('B');
                                pause(.5);
                            end 
                            end
                        else 
                            %go straight -- default
                            myLego.MoveMotor('AB', -45);
                            pause(0.3);
                        end

                    end
                 case 's'
                     myLego.StopMotor('AB');
            end
    end
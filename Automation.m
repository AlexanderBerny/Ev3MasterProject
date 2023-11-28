% Programmers: Alexander Bernickus, Irene Fahndrich, Siri Poluri, Joshua Coreas
% Date: 10/19/2023
% Objective: Automation for CHPY

%Problems to Fix: Getting stuck on walls, over turning right when it checks multiple times, making a veriable to hold
% 1 or 0 for if it should respond to green or not (so it doesnt stop prematurely).

global key
InitKeyboard();

myLego.SetColorMode(3, 2);

moving = 1;
green;
blue;
yellow;

while 1
    pause(0.1);
    front_distance = myLego.UltrasonicDist(1); % Get front_distance
    right_distance = myLego.UltrasonicDist(2); % Get right_distance
    color = myLego.ColorCode(3); % Get color 

    switch key
        
        case 'g' % Begin Automation
            
            while(moving == 1)
                
                front_distance = myLego.UltrasonicDist(1);
                right_distance = myLego.UltrasonicDist(2);
                color = myLego.ColorCode(3); 
                disp(front_distance);
                disp(right_distance);
                disp(color);

                %no obstacles
                if (front_distance > 20 && color ~= 5 && color ~= 3 && color ~= 2 && color ~= 4) % 3 = Green, 5 = Red
                    if(front_distance<right_distance && right_distance>30)
                        %right case: 
                        myLego.StopMotor('AB', 'Brake');
                        pause(1);
                        myLego.MoveMotor('AB', -50);
                        pause(1);
                        myLego.MoveMotor('A', 50);
                        myLego.MoveMotor('B', -50);
                        pause(3);
                        myLego.MoveMotor('AB', -50);
                        pause(1.65);

                    %go straight case
                    else
                    myLego.MoveMotor('AB', -50);                                
                    front_distance = myLego.UltrasonicDist(1);
                    right_distance = myLego.UltrasonicDist(2);
                    disp(front_distance);
                    disp(right_distance);
                    end
                %green case ~ end traversal    
                elseif (front_distance > 20 && color == 3 && green == 1)
                    myLego.StopMotor('AB');
                    moving = 0;

                %red case ~ stop light                       
                elseif (front_distance > 20 && color == 5)
                    myLego.StopMotor('AB', 'Brake');
                    pause(2);
                    myLego.MoveMotor('AB', -50);
                    pause(1);
                    front_distance = myLego.UltrasonicDist(1);

                %blue case ~ Pickup switch to remote control
                elseif (front_distance > 20 && color == 2 && blue == 0)
                    myLego.StopMotor('AB', 'Brake');
                    run('C:\Users\dapea\OneDrive\Documents\MATLAB\Masterproject\RemoteControl.m')
                    
                    blue = 1;
                    front_distance = myLego.UltrasonicDist(1);

                %yellow case ~ drop off switch to remote control
                elseif (front_distance > 20 && color == 4 && yellow == 0 && blue == 1)
                    myLego.StopMotor('AB', 'Brake');
                    run('C:\Users\dapea\OneDrive\Documents\MATLAB\Masterproject\RemoteControl.m')
                    yellow = 1;
                    green = 1;
                    front_distance = myLego.UltrasonicDist(1);
                
                %obstacle detected right sensor distance is less than 20 cm
                elseif (front_distance < 20 && right_distance < 30)
                    myLego.StopMotor('AB');

                    % turn left
                    pause(1)
                    myLego.MoveMotor('AB', 50);
                    pause(1);
                    myLego.MoveMotor('A', -65);
                    myLego.MoveMotor('B', 65);
                    pause(3);
                    myLego.StopMotor('A');
                    myLego.StopMotor('B');
                    pause(0.5);
                    front_distance = myLego.UltrasonicDist(1);
                    disp(front_distance);
                    pause(0.5);
                    
                    front_distance = myLego.UltrasonicDist(1);
                    disp(front_distance);

                %obstacle detected right sensor distance is more than 20 cm
                elseif (front_distance < 20 && right_distance > 30)
                    myLego.StopMotor('AB');
                    pause(1);
                    myLego.MoveMotor('AB', 25);
                    pause(1);
                    %turn right
                    myLego.MoveMotor('A', 65);
                    myLego.MoveMotor('B', -65);
                    pause(3);
                    myLego.StopMotor('A');
                    myLego.StopMotor('B');
                    pause(0.5);
                    front_distance = myLego.UltrasonicDist(1);
                    disp(front_distance);
                    pause(0.5);
                    
                    front_distance = myLego.UltrasonicDist(1);
                    disp(front_distance);
                    
               
                    
                    if (front_distance < 20)
                        
                        % turn to the left
                        
                        myLego.MoveMotor('A',  -50); 
                        myLego.MoveMotor('B', 45); 
                        pause(2.5);
                        myLego.StopMotor('A');
                        myLego.StopMotor('B');
                        
                        front_distance = myLego.UltrasonicDist(1);
                        disp(front_distance);
                   
                        if (front_distance < 20)
                            
                            % turn around
                            pause(1);
                            myLego.MoveMotor('A', 100);
                            myLego.MoveMotor('B', -100);
                            pause(3.5);
                            myLego.StopMotor('A');
                            myLego.StopMotor('B');
                            
                            front_distance = myLego.UltrasonicDist(1);
                            moving = 0;
                            
                        end
                        
                    end
                end
            end
    
                    
        case 's'
            
            disp('CHPY has been stopped :(');
            myLego.StopMotor('AB');
            moving = 0;
            break;
            
        case 'r'
            
            disp('Resurrecting CHPY :D');
            disp('Make sure to press ''g''');
            moving = 1;
                     
    end % Switch   
end % While


CloseKeyboard();

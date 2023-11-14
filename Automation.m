% Programmers: Alexander Bernickus, Irene Fahndrich, Siri Poluri, Joshua Coreas
% Date: 10/19/2023
% Objective: Automation for CHPY

global key
InitKeyboard();

myLego.SetColorMode(3, 2);

moving = 1;

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
                if (front_distance > 20 && color ~= 5 && color ~= 3) % 3 = Green, 5 = Red
                    %go straight case
                    myLego.MoveMotor('AB', -50);                                
                    front_distance = myLego.UltrasonicDist(1);
                    disp(front_distance);
                %green case ~ end traversal    
                elseif (front_distance > 20 && color == 3)
                    myLego.StopMotor('AB');
                    moving = 0;
                %red case ~ stop light                       
                elseif (front_distance > 20 && color == 5)
                    myLego.StopMotor('AB', 'Brake');
                    pause(2);
                    myLego.MoveMotor('AB', -50);
                    pause(1);
                    front_distance = myLego.UltrasonicDist(1);
                
                %obstacle detected    
                elseif (front_distance < 20 && right_distance < 20)
                    myLego.StopMotor('AB');
                    % turn left
                    pause(1)
                    myLego.MoveMotor('A', -65);
                    myLego.MoveMotor('B', 65);
                    pause(1);
                    myLego.StopMotor('A');
                    myLego.StopMotor('B');
                    pause(0.5);
                    front_distance = myLego.UltrasonicDist(1);
                    disp(front_distance);
                    pause(0.5);
                    
                    front_distance = myLego.UltrasonicDist(1);
                    disp(front_distance);

                elseif (front_distance < 20 && right_distance > 20)
                    myLego.StopMotor('AB');
                    pause(1);
                    %turn right
                    myLego.MoveMotor('A', 65);
                    myLego.MoveMotor('B', -65);
                    pause(1);
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
                        pause(1.5);
                        myLego.StopMotor('A');
                        myLego.StopMotor('B');
                        
                        front_distance = myLego.UltrasonicDist(1);
                        disp(front_distance);
                   
                        if (front_distance < 20)
                            
                            % turn around
                            pause(1);
                            myLego.MoveMotor('A', 25);
                            myLego.MoveMotor('B', -30);
                            pause(1.5);
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

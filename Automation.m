% Programmers: Alexander Bernickus, Irene Fahndrich, Siri Poluri, Joshua Coreas
% Date: 10/19/2023
% Objective: Automation for CHPY

global key
InitKeyboard();

myLego.SetColorMode(3, 2);

moving = 1;

while 1
    pause(0.1);
    distance = myLego.UltrasonicDist(1); % Get distance
    color = myLego.ColorCode(3); % Get color 

    switch key
        
        case 'g' % Begin Automation
            
            while(moving == 1)
                
                distance = myLego.UltrasonicDist(1);
                color = myLego.ColorCode(3); 
                disp(distance);
                disp(color);
                %no obstacles
                if (distance > 20 && color ~= 5 && color ~= 3) % 3 = Green, 5 = Red
                    %go straight case
                    myLego.MoveMotor('AB', -50);                                
                    distance = myLego.UltrasonicDist(1);
                    disp(distance);
                %green case ~ end traversal    
                elseif (distance > 20 && color == 3)
                    myLego.StopMotor('AB');
                    moving = 0;
                %red case ~ stop light                       
                elseif (distance > 20 && color == 5)
                    myLego.StopMotor('AB', 'Brake');
                    pause(2);
                    myLego.MoveMotor('AB', -50);
                    pause(1);
                    distance = myLego.UltrasonicDist(1);
                
                %obstacle detected    
                elseif (distance < 20)
                    
                    myLego.StopMotor('AB');
                    % turn right
                    pause(1);
                    myLego.MoveMotor('A', 30);
                    myLego.MoveMotor('B', -25);
                    pause(1);
                    myLego.StopMotor('A');
                    myLego.StopMotor('B');
                    pause(0.5);
                    distance = myLego.UltrasonicDist(1);
                    disp(distance);
                    pause(0.5);
                    
                    distance = myLego.UltrasonicDist(1);
                    disp(distance);
               
                    
                    if (distance < 20)
                        
                        % turn to the left
                        
                        myLego.MoveMotor('A',  -50); 
                        myLego.MoveMotor('B', 45); 
                        pause(1.5);
                        myLego.StopMotor('A');
                        myLego.StopMotor('B');
                        
                        distance = myLego.UltrasonicDist(1);
                        disp(distance);
                   
                        if (distance < 20)
                            
                            % turn around
                            pause(1);
                            myLego.MoveMotor('A', 25);
                            myLego.MoveMotor('B', -30);
                            pause(1.5);
                            myLego.StopMotor('A');
                            myLego.StopMotor('B');
                            
                            distance = myLego.UltrasonicDist(1);
                            moving = 0;
                            
                        end
                        
                    end
                end
            end
                    
        case 'q'
            
            disp('Quitting');
            myLego.StopMotor('A');
            myLego.StopMotor('B');
            break;
            
        case 'r'
            
            disp('Restart');
            disp('Make sure to press ''g''');
            moving = 1;
                     
    end % Switch   
end % While


CloseKeyboard();

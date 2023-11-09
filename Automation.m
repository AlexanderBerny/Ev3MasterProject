global key
InitKeyboard();

myLego.SetColorMode(3, 2); % set sensor 3 to colorCode

startMoving = 1;
numRightTurns = 0;
numLeftTurns = 0;

while 1
    pause(0.1);
    distance = myLego.UltrasonicDist(1); % Get distance
    color = myLego.ColorCode(3); % Get color 

    
    switch key
        
        case 'g' % Begin Automation
            
            while(startMoving == 1)
                
                distance = myLego.UltrasonicDist(1);
                color = myLego.ColorCode(3); 
                disp(distance);
                disp(color);
                
                if (distance > 20 && color ~= 5 && color ~= 3)
                    
                    myLego.MoveMotor('A', -50);
                    myLego.MoveMotor('B', -50);
                    numRightTurns = 0;
                    numLeftTurns = 0;
                    
                    
                    distance = myLego.UltrasonicDist(1);
                    disp(distance);
                    
                elseif (distance > 20 && color == 3)
                    myLego.StopMotor('A');
                    myLego.StopMotor('B');
                    startMoving = 0;
                      
     %touch cases
                    
                    
                    
                elseif (distance > 20 && color == 5)
                    myLego.StopMotor('A');
                    myLego.StopMotor('B');
                    pause(3);
                    myLego.MoveMotor('A', -50);
                    myLego.MoveMotor('B', -50);
                    pause(1);
                    
                    distance = myLego.UltrasonicDist(1);
                
                    
                elseif (distance < 20)
                    
                    myLego.StopMotor('A');
                    myLego.StopMotor('B');
                    % turn right
                    pause(1);
                    myLego.MoveMotor('A', 30);
                    myLego.MoveMotor('B', -25);
                    pause(1);
                    myLego.StopMotor('A');
                    myLego.StopMotor('B');
                    numRightTurns = 1;
                    pause(0.5);
                    distance = myLego.UltrasonicDist(1);
                    disp(distance);
                    pause(0.5);
                    
                    distance = myLego.UltrasonicDist(1);
                    disp(distance);
               
                    
                    if (distance < 20)
                        
                        % turn to the left 180 degrees
                        
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
                            startMoving = 0;
                            
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
            startMoving = 1;
            
            
    end % Switch
    
end % While


CloseKeyboard();

i = 0;
for i = 1:30
   touch = myLego.TouchPressed(1);
   touch2 = myLego.TouchPressed(2);
    if touch == 1 
        myLego.MoveMotor('A',-50);
        i = i + 1;
    else if touch2 == 1
        myLego.MoveMotor('A',50);
        i = i + 1;
    else
        myLego.MoveMotor('A', 0)
        i = i + 1;
    end
    end   
end
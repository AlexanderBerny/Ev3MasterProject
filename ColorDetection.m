pause('on');
myLego.SetColorMode(3, 2);
color = myLego.ColorCode(3);
b = true;


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
end
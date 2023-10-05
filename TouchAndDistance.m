while 1
    touch = myLego.TouchPressed(1);
    if touch 
        myLego.playTone(50,550,1000);
        break;
    end
end

for i = 0:60
    distance = myLego.UltrasonicDist(4);
    display(distance);
    i = i+1;
end
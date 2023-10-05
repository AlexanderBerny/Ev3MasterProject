% Alexander Bernickus
% Irene Fahndrich
% Joshua Coreas
% Nagasiri Poluri
disp('Push the button to start the tone');
while 1
    touch = myLego.TouchPressed(1);
    touch2 = myLego.TouchPressed(2);
    if touch || touch2
        myLego.beep();
        break;
    end
end
pause('on');
color = myLego.ColorCode(4);

for i=0:10
    if (color == 2)
        %blue case
    else if (color == 3)
        %green case
    else if (color == 4)
        %yellow case
    else if (color == 5)
        %red case
    pause(0.5);
    i = i + 0.5;
end

display(color);
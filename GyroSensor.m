brick.GyroCalibrate(1);
pause('on');

for i = 0:10
    angle = brick.GyroAngle(1);
    display(angle);
    %angleRate = brick.GyroRate(1);
    %display(angleRate);
    pause(0.5);
    i = i + 0.5;
end
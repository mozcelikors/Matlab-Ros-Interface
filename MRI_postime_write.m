%///////////////////////////////////%
%  @project MATLAB-ROS Interface    %
%  @author Mustafa Ozcelikors       %
%  @filename MRI_postime_write      %
%  @version 1.0                     %
%///////////////////////////////////%

function x = MRI_postime_write(data)
    global knm_zaman;
    knm_zaman = data;
    x=1;
end
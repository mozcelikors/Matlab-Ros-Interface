%///////////////////////////////////%
%  @project MATLAB-ROS Interface    %
%  @author Mustafa Ozcelikors       %
%  @filename MRI_plot_update        %
%  @version 1.0                     %
%///////////////////////////////////%

function MRI_plot_update
    global posx_plot_arr;
    global posy_plot_arr;
    global pos_data_count;
    global pos_out;
    
    % Prepare new sequence of data
    posx_plot_arr(pos_data_count+1) = pos_out(2);
    posy_plot_arr(pos_data_count+1) = pos_out(3);
    pos_data_count = pos_data_count+1;

    % just Troubleshooting
    length(posx_plot_arr)
    length(posy_plot_arr)

    % Actual plotting here
    grid on
    xlabel('Position(x)')
    ylabel('Position(y)')
    plot(posx_plot_arr,posy_plot_arr)
    pause(1);
end


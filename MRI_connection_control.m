%///////////////////////////////////%
%  @project MATLAB-ROS Interface    %
%  @author Mustafa Ozcelikors       %
%  @filename MRI_connection_control %
%  @version 1.0                     %
%///////////////////////////////////%
     
function [ ws_y, lh_y ] = MRI_connection_control( server_y, port_y)
    
    % Connection arguments
    ws_header = 'ws://';
    colon = ':';
    master_uri = [ws_header server_y colon port_y];
    
    % Achieve connection
    ws = ros_websocket(master_uri);
    
    % Accumulate information
    ws_acc = ws;
    lh_acc = 1;
    
    % Close connection
    pause(0.1)
    ws.delete
    
    % Return values
    ws_y = ws_acc;
    lh_y = lh_acc;
end


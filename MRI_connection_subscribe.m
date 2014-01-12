%/////////////////////////////////////%
%  @project MATLAB-ROS Interface      %
%  @author Mustafa Ozcelikors         %
%  @filename MRI_connection_subscribe %
%  @version 1.0                       %
%/////////////////////////////////////%

function cikti = MRI_connection_subscribe( server_y, port_y, topic_y, type_y, data_y)

    % Connection arguments
    ws_header = 'ws://';
    colon = ':';
    master_uri = [ws_header server_y colon port_y];
    
    % Achieve connection
    ws = ros_websocket(master_uri);
    
    sub = Subscriber(ws, topic_y, type_y);
    
    %lh = event.listener(sub,'OnMessageReceived',@(h,e) display(strcat('Received: ', int2str(e.data.data))));
    
    lh = event.listener(sub,'OnMessageReceived',@(h,e) disp(strcat('Received: ',...
       num2str(e.data.data(1)),...
       num2str(e.data.data(2)),...
       num2str(e.data.data(3)))));
    
    pause(0.5)
    
    
    % Accumulate info
    lh_acc = 'Subscribe approved';
    
    
    % Free up event listener
    sub.unsubscribe
    delete(lh)
    pause(0.1)
    ws.delete
    
    cikti=lh_acc;
end
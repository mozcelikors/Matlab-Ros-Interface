%///////////////////////////////////%
%  @project MATLAB-ROS Interface    %
%  @author Mustafa Ozcelikors       %
%  @filename MRI_pos_subscriber     %
%  @version 1.0                     %
%///////////////////////////////////%

function out = MRI_pos_subscriber( server_y, port_y, topic_y, type_y, data_y)

    ws_header = 'ws://';
    colon = ':';
    master_uri = [ws_header server_y colon port_y];
    
    % Connection
    ws = ros_websocket(master_uri);
    
    sub = Subscriber(ws, topic_y, type_y);
    
    %lh = event.listener(sub,'OnMessageReceived',@(h,e) display(strcat('Received: ', int2str(e.data.data))));
    
    lh1 = event.listener(sub, 'OnMessageReceived', @(h,e) knmzaman_data_yaz(e.data.data));
    lh = event.listener(sub,'OnMessageReceived',@(h,e)  ...
       disp(strcat('Received: ',...
       num2str(e.data.data(1)),...
       num2str(e.data.data(2)),...
       num2str(e.data.data(3)))));
    
    pause(0.5)
    
    position_time = knmzaman_data_oku;

    sub.unsubscribe
    delete(lh)
    delete(lh1)
    pause(0.1)
    ws.delete
    
    out=position_time;
end





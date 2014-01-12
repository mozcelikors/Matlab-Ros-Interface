%///////////////////////////////////%
%  @project MATLAB-ROS Interface    %
%  @author Mustafa Ozcelikors       %
%  @filename MRI_connection_publish %
%  @version 1.0                     %
%///////////////////////////////////%

function cikti = MRI_connection_publish( server_y, port_y, topic_y, type_y, data_y)
    
    % Connection arguments
    ws_header = 'ws://';
    colon = ':';
    master_uri = [ws_header server_y colon port_y];
    
    % Achieve connection
    ws = ros_websocket(master_uri);
    
    pub = Publisher(ws,topic_y,type_y);
    sub = Subscriber(ws, topic_y, type_y);
    
    lh = event.listener(sub,'OnMessageReceived',@(h,e) disp(strcat('Received: ', int2str(e.data.data))));
    
    % String info
    lh_acc = 'Publish approved'
    
    
    mesaj_y = data_y;
    pub.publish(mesaj_y); 

    pub.unadvertise
    sub.unsubscribe
    delete(lh)
    pause(0.1)
    ws.delete
    
    cikti = lh_acc;
end

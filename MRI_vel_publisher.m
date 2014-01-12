%///////////////////////////////////%
%  @project MATLAB-ROS Interface    %
%  @author Mustafa Ozcelikors       %
%  @filename MRI_vel_publisher      %
%  @version 1.0                     %
%///////////////////////////////////%

function out = MRI_vel_publisher(x_server_input, x_port_input, x_pub_topic, xx_pub_linx, xx_pub_liny, xx_pub_linz, xx_pub_anx, xx_pub_any, xx_pub_anz )
    data2json=struct('linear',struct('x',str2double(xx_pub_linx),'y',str2double(xx_pub_liny),'z', str2double(xx_pub_linz)),'angular',struct('x',str2double(xx_pub_anx),'y',str2double(xx_pub_any),'z',str2double(xx_pub_anz)));
    js = savejson('',data2json);
    data = loadjson(js);
    display(data)
    %JSON_VARIABLE_2 = '{ msg:"{ linear: "{x : 0.8, y:0.2, z:0.3}", "angular": "{x : 0, y:0, z:0}" }"}';
    display_pid_info = MRI_connection_publish (x_server_input, x_port_input, x_pub_topic, 'geometry_msgs/Twist', data);
    out = display_pid_info;
end


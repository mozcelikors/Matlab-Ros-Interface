%///////////////////////////////////%
%  @project MATLAB-ROS Interface    %
%  @author Mustafa Ozcelikors       %
%  @filename MIR_pid_publisher      %
%  @version 1.0                     %
%///////////////////////////////////%

function out = MRI_pid_publisher( x_server_input, x_port_input,  x_pid_topic_input, pid_sag_kp, pid_sag_ki, pid_sag_kd, pid_sol_kp, pid_sol_ki, pid_sol_kd)
    data2json=struct('data',[pid_sag_kp,...
                             pid_sag_ki,...
                             pid_sag_kd,...
                             pid_sol_kp,...
                             pid_sol_ki,...
                             pid_sol_kd]);
	js = savejson('',data2json,struct('ParseLogical',1));
	data = loadjson(js);
	display(js)
	%JSON_VARIABLE_2 = '{ msg:"{ linear: "{x : 0.8, y:0.2, z:0.3}", "angular": "{x : 0, y:0, z:0}" }"}';
	out = MRI_connection_publish (x_server_input, x_port_input, x_pid_topic_input, 'std_msgs/Float32MultiArray', data);
end


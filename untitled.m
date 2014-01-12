%///////////////////////////////////%
%  @project MATLAB-ROS Interface    %
%  @author Mustafa Ozcelikors       %
%  -------------GUI-------------    %
%  @version 1.0                     %
%///////////////////////////////////%

function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 25-Dec-2013 21:01:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)



% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global posx_plot_arr;
global posy_plot_arr;
global pos_data_count;
global x_sub_counter;

pos_data_count = 0;

% Clear array elements
posx_plot_arr = [];
posy_plot_arr = [];
x_sub_counter = [];


end

% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%n = str2num(get(handles.pid_sag_kp,'string'));
%set(handles.displaytext,'string',num2str(n));
global pid_sag_kp;
global pid_sol_kp;
global pid_sag_ki;
global pid_sol_ki;
global pid_sag_kd;
global pid_sol_kd;
global x_pid_topic_input;
global x_server_input;
global x_port_input;
global x_output_text;
global x_pub_topic;
global x_pub_type;
global x_pub_data;
global x_sub_topic;
global x_sub_type;
global x_sub_data;
global x_enable_pub;
global x_enable_sub;
global x_enable_pid;
global xx_pub_linx;
global xx_pub_liny;
global xx_pub_linz;
global xx_pub_anx;
global xx_pub_any;
global xx_pub_anz;
global x_sub_counter; % Counter for the subscriber to work

global knm_zaman; % Test variable
global konum_cikti; % Data subscribed
                    % 1-Timestamp, 2-Pos(x), 3-Pos(y)
global posx_plot_arr; % Arrays for plotting
global posy_plot_arr;
global pos_data_count;
                  



display(pid_sag_kp);
display(pid_sol_kp);
display(pid_sag_ki);
display(pid_sol_ki);
display(pid_sag_kd);
display(pid_sol_kd);
display(x_enable_pub);
display(x_enable_sub);
display(x_enable_pid);


if (x_enable_pub == 1)
    [ws_y lh_y] = MRI_connection_control(x_server_input, x_port_input);
    % Connection messages
    connection_invalid_msg = 'Connection Failed';
    connection_valid_msg = 'Connection Accomplished';

    % Display message
    if (isempty(ws_y))
        % Display in the output area
        display(x_output_text);
        set(handles.output_text, 'String', strcat(connection_invalid_msg, '\n', x_output_text));
    else
        % Connection accomplished, display in the output area
        display(x_output_text);
        set(handles.output_text, 'String', strcat(connection_valid_msg, '\n', x_output_text));
       
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>> Custom Publisher
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %{
        display(x_pub_topic)
        display(x_pub_type)
        display(x_pub_data)
        display(x_enable_pub)
        
        if(~(isempty(x_server_input) && isempty(x_port_input) && isempty(x_pub_topic) && isempty(x_pub_type) && isempty(x_pub_data) && isempty(x_enable_pub)))
            encoded_str = x_pub_data;
            display(encoded_str)
            display(x_pub_data)
            xs = savejson('data',encoded_str,struct('ParseLogical',1));
            display(xs)
            gonderilecek_data_cpub = loadjson(xs);
            display_cpub_bilgisi = baglanti_publish (x_server_input, x_port_input, x_pub_topic, x_pub_type, gonderilecek_data_cpub);
            set(handles.output_text, 'String', strcat(display_cpub_bilgisi, '\n', x_output_text));
        end
        %}
        
        
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>> Cmd_Vel Publisher
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        
        if(~(isempty(x_server_input) && isempty(x_port_input) && isempty(x_pub_topic) && isempty(x_pub_type) && isempty(xx_pub_linx) && isempty(xx_pub_liny) && isempty(xx_pub_linz) && isempty(xx_pub_anx) && isempty(xx_pub_any) && isempty(xx_pub_anz) && isempty(x_enable_pub)))
            out_data = MRI_vel_publisher(x_server_input, x_port_input, x_pub_topic, xx_pub_linx, xx_pub_liny, xx_pub_linz, xx_pub_anx, xx_pub_any, xx_pub_anz )
            set(handles.output_text, 'String', strcat(out_data,  x_output_text));
        end
        
        % PID parameter check
        if (~isempty(x_enable_pub))
            if(isempty(x_server_input) && isempty(x_port_input) && isempty(x_pub_topic))
                % Please enter the right parameters
                parametre_invalid_msg = 'Please enter the right parameters';
                set(handles.output_text, 'String', parametre_invalid_msg);
            end
        end
        
    end
end

if(x_enable_sub == 1)
    [ws_y lh_y] = MRI_connection_control(x_server_input, x_port_input);
    % Connection messages
    connection_invalid_msg = 'Connection failed';
    connection_valid_msg = 'Connection Accomplished';

    % Display message
    if (isempty(ws_y))
        % Adjust output text
        display(x_output_text);
        set(handles.output_text, 'String', strcat(connection_invalid_msg,  x_output_text));
    else
        % Adjust output text
        display(x_output_text);
        set(handles.output_text, 'String', strcat(connection_valid_msg,  x_output_text));
        
        
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>> Pos/Time Subscriber
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        if(~(isempty(x_server_input) && isempty(x_port_input) && isempty(x_sub_topic) && isempty(x_sub_type) ))
            if (isempty(x_sub_counter))
                ctr = 1;
            else
                ctr = x_sub_counter;
            end
            
            while (ctr > 0)
                pos_out = MRI_pos_subscriber( x_server_input, x_port_input, x_sub_topic, x_sub_type, 'xx');
                set(handles.output_text, 'String', strcat('Time:',num2str(pos_out(1)),'  Pos(x):', num2str(pos_out(2)), ' Pos(y):', num2str(pos_out(3)) ));

                MRI_plot_update();
                
                % Decrement counter
                ctr = ctr - 1;
            end
        end
        
        % PID params check
        if (~isempty(x_enable_sub))
            if(isempty(x_server_input) && isempty(x_port_input) && isempty(x_sub_topic) && isempty(x_sub_type))
                % Please enter the right parameters
                parametre_invalid_msg = 'Please enter the right parameters';
                set(handles.output_text, 'String', parametre_invalid_msg);
            end
        end
        
    end
end

if(x_enable_pid == 1)
    [ws_y lh_y] = MRI_connection_control(x_server_input, x_port_input);
    % Connection messages
    connection_invalid_msg = 'Connection failed';
    connection_valid_msg = 'Connection Accomplished';

    % Display message
    if (isempty(ws_y))
        % Adjust output text
        display(x_output_text);
        set(handles.output_text, 'String', strcat(connection_invalid_msg,   x_output_text));
    else
        % Adjust output text
        display(x_output_text);
        set(handles.output_text, 'String', strcat(connection_valid_msg,  x_output_text));
    
        
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>> PID Publisher
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        
        display(x_server_input)
        display(x_port_input)
        display(x_enable_pid)
        display(x_pid_topic_input)
        
        if(~(isempty(x_server_input) && isempty(x_port_input) && isempty(x_pid_topic_input) && isempty(x_enable_pid)))
            out_pid_data = MRI_pid_publisher( x_server_input, x_port_input,  x_pid_topic_input, pid_sag_kp, pid_sag_ki, pid_sag_kd, pid_sol_kp, pid_sol_ki, pid_sol_kd)
            set(handles.output_text, 'String', strcat(out_pid_data,  x_output_text));
        end
        
        % Params check
        if (~isempty(x_enable_pid))
            if(isempty(x_server_input) && isempty(x_port_input) && isempty(x_pid_topic_input))
                % Please enter right params
                parametre_invalid_msg = 'Please enter the right parameters';
                set(handles.output_text, 'String', parametre_invalid_msg);
            end
        end
    end
end


end








% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global x_server_input;
global x_port_input;
global x_output_text;

% Connection control

display(x_server_input)
display(x_port_input)

[ws_y lh_y] = MRI_connection_control(x_server_input, x_port_input);
	
% Connection messages
connection_invalid_msg = 'Connection Failed';
connection_valid_msg = 'Connection Accomplished';

% Display message
if (isempty(ws_y))
    % Adjust output text
    display(x_output_text);
    set(handles.output_text, 'String', strcat(connection_invalid_msg, '\n', x_output_text));
else
    % Adjust output text
    display(x_output_text);
    set(handles.output_text, 'String', strcat(connection_valid_msg, '\n', x_output_text));
end

end



function pid_sol_kd_Callback(hObject, eventdata, handles)
% hObject    handle to pid_sol_kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pid_sol_kd as text
%        str2double(get(hObject,'String')) returns contents of pid_sol_kd as a double
global pid_sol_kd;
pid_sol_kd = str2double(get(hObject,'string'));
if (~isnumeric(pid_sol_kd))
  h=errordlg('You must enter a numeric value','Bad Input','modal')
  beep;
  
  uicontrol(hObject)
    return
end
end


% --- Executes during object creation, after setting all properties.
function pid_sol_kd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pid_sol_kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function pid_sol_ki_Callback(hObject, eventdata, handles)
% hObject    handle to pid_sol_ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pid_sol_ki as text
%        str2double(get(hObject,'String')) returns contents of pid_sol_ki as a double
global pid_sol_ki;
pid_sol_ki = str2double(get(hObject,'string'));
if (~isnumeric(pid_sol_ki))
  h=errordlg('You must enter a numeric value','Bad Input','modal')
  beep;
  
  uicontrol(hObject)
    return
end
end


% --- Executes during object creation, after setting all properties.
function pid_sol_ki_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pid_sol_ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function pid_sol_kp_Callback(hObject, eventdata, handles)
% hObject    handle to pid_sol_kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pid_sol_kp as text
%        str2double(get(hObject,'String')) returns contents of pid_sol_kp as a double
global pid_sol_kp;
pid_sol_kp = str2double(get(hObject,'string'));
if (~isnumeric(pid_sol_kp))
  h=errordlg('You must enter a numeric value','Bad Input','modal')
  beep;
  
  uicontrol(hObject)
    return
end
end

% --- Executes during object creation, after setting all properties.
function pid_sol_kp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pid_sol_kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function pid_sag_kd_Callback(hObject, eventdata, handles)
% hObject    handle to pid_sag_kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pid_sag_kd as text
%        str2double(get(hObject,'String')) returns contents of pid_sag_kd as a double
global pid_sag_kd;
pid_sag_kd = str2double(get(hObject,'string'));
if (~isnumeric(pid_sag_kd))
  h=errordlg('You must enter a numeric value','Bad Input','modal')
  beep;
  
  uicontrol(hObject)
    return
end
end

% --- Executes during object creation, after setting all properties.
function pid_sag_kd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pid_sag_kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function pid_sag_ki_Callback(hObject, eventdata, handles)
% hObject    handle to pid_sag_ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pid_sag_ki as text
%        str2double(get(hObject,'String')) returns contents of pid_sag_ki as a double
global pid_sag_ki;
pid_sag_ki = str2double(get(hObject,'string'));
if (~isnumeric(pid_sag_ki))
  h=errordlg('You must enter a numeric value','Bad Input','modal')
  beep;
  
  uicontrol(hObject)
    return
end
end

% --- Executes during object creation, after setting all properties.
function pid_sag_ki_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pid_sag_ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function pid_sag_kp_Callback(hObject, eventdata, handles)
% hObject    handle to pid_sag_kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pid_sag_kp as text
%        str2double(get(hObject,'String')) returns contents of pid_sag_kp as a double
global pid_sag_kp;
pid_sag_kp = str2double(get(hObject,'string'));
if (~isnumeric(pid_sag_kp))
  h=errordlg('You must enter a numeric value','Bad Input','modal')
  beep;
  
  uicontrol(hObject)
    return
end
end

% --- Executes during object creation, after setting all properties.
function pid_sag_kp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pid_sag_kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes during object creation, after setting all properties.
function displaytext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to displaytext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns
%set(handles.displaytext,'string',num2str(user_entry));
end




function server_input_Callback(hObject, eventdata, handles)
% hObject    handle to server_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of server_input as text
%        str2double(get(hObject,'String')) returns contents of server_input as a double
global x_server_input;
x_server_input = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function server_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to server_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function port_input_Callback(hObject, eventdata, handles)
% hObject    handle to port_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of port_input as text
%        str2double(get(hObject,'String')) returns contents of port_input as a double
global x_port_input;
x_port_input = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function port_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to port_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function pub_topic_Callback(hObject, eventdata, handles)
% hObject    handle to pub_topic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pub_topic as text
%        str2double(get(hObject,'String')) returns contents of pub_topic as a double
global x_pub_topic;
x_pub_topic = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function pub_topic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pub_topic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function pub_type_Callback(hObject, eventdata, handles)
% hObject    handle to pub_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pub_type as text
%        str2double(get(hObject,'String')) returns contents of pub_type as a double
global x_pub_type;
x_pub_type = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function pub_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pub_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function pub_data_Callback(hObject, eventdata, handles)
% hObject    handle to pub_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pub_data as text
%        str2double(get(hObject,'String')) returns contents of pub_data as a double
global x_pub_data;
x_pub_data = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function pub_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pub_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function output_text_Callback(hObject, eventdata, handles)
% hObject    handle to output_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of output_text as text
%        str2double(get(hObject,'String')) returns contents of output_text as a double
global x_output_text;
x_output_text = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function output_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to output_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function sub_topic_Callback(hObject, eventdata, handles)
% hObject    handle to sub_topic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sub_topic as text
%        str2double(get(hObject,'String')) returns contents of sub_topic as a double
global x_sub_topic;
x_sub_topic = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function sub_topic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sub_topic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function sub_type_Callback(hObject, eventdata, handles)
% hObject    handle to sub_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sub_type as text
%        str2double(get(hObject,'String')) returns contents of sub_type as a double
global x_sub_type;
x_sub_type = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function sub_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sub_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function sub_data_Callback(hObject, eventdata, handles)
% hObject    handle to sub_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sub_data as text
%        str2double(get(hObject,'String')) returns contents of sub_data as a double
global x_sub_data;
x_sub_data = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function sub_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sub_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function pid_topic_input_Callback(hObject, eventdata, handles)
% hObject    handle to pid_topic_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pid_topic_input as text
%        str2double(get(hObject,'String')) returns contents of pid_topic_input as a double
global x_pid_topic_input;
x_pid_topic_input = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function pid_topic_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pid_topic_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in help_button.
function help_button_Callback(hObject, eventdata, handles)
% hObject    handle to help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes on button press in custom_button.
function custom_button_Callback(hObject, eventdata, handles)
% hObject    handle to custom_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes on button press in about_button.
function about_button_Callback(hObject, eventdata, handles)
% hObject    handle to about_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hakkinda_bolumu
end


% --- Executes on button press in enable_sub.
function enable_sub_Callback(hObject, eventdata, handles)
% hObject    handle to enable_sub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of enable_sub
global x_enable_sub;
x_enable_sub = get(hObject,'Value');
end


% --- Executes on button press in enable_pub.
function enable_pub_Callback(hObject, eventdata, handles)
% hObject    handle to enable_pub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of enable_pub
global x_enable_pub;
x_enable_pub = get(hObject, 'Value');
end


% --- Executes on button press in enable_pid.
function enable_pid_Callback(hObject, eventdata, handles)
% hObject    handle to enable_pid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of enable_pid
global x_enable_pid;
x_enable_pid = get(hObject, 'Value');
end



function x_pub_linx_Callback(hObject, eventdata, handles)
% hObject    handle to x_pub_linx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_pub_linx as text
%        str2doubleglobal x_pid_topic_input;
global xx_pub_linx;
xx_pub_linx = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function x_pub_linx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_pub_linx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function x_pub_liny_Callback(hObject, eventdata, handles)
% hObject    handle to x_pub_liny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_pub_liny as text
%        str2double(get(hObject,'String')) returns contents of x_pub_liny as a double
global xx_pub_liny;
xx_pub_liny = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function x_pub_liny_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_pub_liny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function x_pub_linz_Callback(hObject, eventdata, handles)
% hObject    handle to x_pub_linz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_pub_linz as text
%        str2double(get(hObject,'String')) returns contents of x_pub_linz as a double
global xx_pub_linz;
xx_pub_linz = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function x_pub_linz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_pub_linz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function x_pub_anx_Callback(hObject, eventdata, handles)
% hObject    handle to x_pub_anx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_pub_anx as text
%        str2double(get(hObject,'String')) returns contents of x_pub_anx as a double
global xx_pub_anx;
xx_pub_anx = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function x_pub_anx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_pub_anx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function x_pub_any_Callback(hObject, eventdata, handles)
% hObject    handle to x_pub_any (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_pub_any as text
%        str2double(get(hObject,'String')) returns contents of x_pub_any as a double
global xx_pub_any;
xx_pub_any = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function x_pub_any_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_pub_any (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function x_pub_anz_Callback(hObject, eventdata, handles)
% hObject    handle to x_pub_anz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_pub_anz as text
%        global xx_pub_linx;
global xx_pub_anz;
xx_pub_anz = get(hObject,'string');
end

% --- Executes during object creation, after setting all properties.
function x_pub_anz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_pub_anz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function sub_time_Callback(hObject, eventdata, handles)
% hObject    handle to sub_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sub_time as text
%        str2double(get(hObject,'String')) returns contents of sub_time as a double
global x_sub_counter;
x_sub_counter = str2double(get(hObject,'string'));
end

% --- Executes during object creation, after setting all properties.
function sub_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sub_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

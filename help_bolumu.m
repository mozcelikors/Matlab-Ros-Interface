function varargout = help_bolumu(varargin)
% HELP_BOLUMU MATLAB code for help_bolumu.fig
%      HELP_BOLUMU, by itself, creates a new HELP_BOLUMU or raises the existing
%      singleton*.
%
%      H = HELP_BOLUMU returns the handle to a new HELP_BOLUMU or the handle to
%      the existing singleton*.
%
%      HELP_BOLUMU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_BOLUMU.M with the given input arguments.
%
%      HELP_BOLUMU('Property','Value',...) creates a new HELP_BOLUMU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before help_bolumu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to help_bolumu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help help_bolumu

% Last Modified by GUIDE v2.5 25-Dec-2013 21:53:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @help_bolumu_OpeningFcn, ...
                   'gui_OutputFcn',  @help_bolumu_OutputFcn, ...
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


% --- Executes just before help_bolumu is made visible.
function help_bolumu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to help_bolumu (see VARARGIN)

% Choose default command line output for help_bolumu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes help_bolumu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = help_bolumu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

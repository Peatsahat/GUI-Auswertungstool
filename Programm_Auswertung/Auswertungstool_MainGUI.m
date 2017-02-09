function varargout = Auswertungstool_MainGUI(varargin)
% AUSWERTUNGSTOOL_MAINGUI MATLAB code for Auswertungstool_MainGUI.fig
%      AUSWERTUNGSTOOL_MAINGUI, by itself, creates a new AUSWERTUNGSTOOL_MAINGUI or raises the existing
%      singleton*.
%
%      H = AUSWERTUNGSTOOL_MAINGUI returns the handle to a new AUSWERTUNGSTOOL_MAINGUI or the handle to
%      the existing singleton*.
%
%      AUSWERTUNGSTOOL_MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUSWERTUNGSTOOL_MAINGUI.M with the given input arguments.
%
%      AUSWERTUNGSTOOL_MAINGUI('Property','Value',...) creates a new AUSWERTUNGSTOOL_MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Auswertungstool_MainGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Auswertungstool_MainGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Auswertungstool_MainGUI

% Last Modified by GUIDE v2.5 09-Feb-2017 12:26:09

%% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Auswertungstool_MainGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Auswertungstool_MainGUI_OutputFcn, ...
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
%%

%% --- Executes just before Auswertungstool_MainGUI is made visible.
function Auswertungstool_MainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Auswertungstool_MainGUI (see VARARGIN)

% Choose default command line output for Auswertungstool_MainGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Auswertungstool_MainGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Auswertungstool_MainGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton_grafisch.
function pushbutton_grafisch_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_grafisch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf('Matthis und Robi')

% --- Executes on button press in pushbutton_konv_alle.
function pushbutton_konv_alle_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_konv_alle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run(fullfile(pwd, 'Funktionen', 'funk_excel2mat_alle.m'))


% --- Executes on button press in pushbutton_konv_einzel.
function pushbutton_konv_einzel_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_konv_einzel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run(fullfile(pwd, 'Funktionen', 'funk_excel2mat_einzel.m'))


% --- Executes on button press in pushbutton_main_beenden.
function pushbutton_main_beenden_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_main_beenden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all

% --- Executes on button press in pushbutton_menu3.
function pushbutton_menu3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_menu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf('Menü 3')
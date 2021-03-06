function varargout = Tarea2Tratamiento(varargin)
% TAREA2TRATAMIENTO MATLAB code for Tarea2Tratamiento.fig
%      TAREA2TRATAMIENTO, by itself, creates a new TAREA2TRATAMIENTO or raises the existing
%      singleton*.
%
%      H = TAREA2TRATAMIENTO returns the handle to a new TAREA2TRATAMIENTO or the handle to
%      the existing singleton*.
%
%      TAREA2TRATAMIENTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAREA2TRATAMIENTO.M with the given input arguments.
%
%      TAREA2TRATAMIENTO('Property','Value',...) creates a new TAREA2TRATAMIENTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tarea2Tratamiento_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tarea2Tratamiento_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tarea2Tratamiento

% Last Modified by GUIDE v2.5 24-Sep-2015 16:29:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tarea2Tratamiento_OpeningFcn, ...
                   'gui_OutputFcn',  @Tarea2Tratamiento_OutputFcn, ...
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


% --- Executes just before Tarea2Tratamiento is made visible.
function Tarea2Tratamiento_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tarea2Tratamiento (see VARARGIN)

% Choose default command line output for Tarea2Tratamiento
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tarea2Tratamiento wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tarea2Tratamiento_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
I = imread('prueba1.jpg');
handles.I=I;
guidata(hObject,handles);
axes(handles.axes1);
imshow(I);
axes(handles.axes2);
imshow(I);
axes(handles.axes3);
imshow(I);
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
X = 0;
i = 1;
I= handles.I;
while i==1 
    hold on
    X = X+10;
    B = imrotate(I,X);
    axes(handles.axes1);
    imshow(B),pause(0.01);
    hold off
    if X == 360
        i=0;
    end 
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
X = 0;
y = 0;
i = 1;
I= handles.I;
while i==1 
    hold on
    X = X+10;
    y = y+10;
    B = imtranslate(I,[X,y]);
    axes(handles.axes2);
    imshow(B),pause(0.01);
    hold off
    if X == 200
        i=0;
        B = imtranslate(I,[0,0]);
        axes(handles.axes2);
        imshow(B)
    end 
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I= handles.I;
axes(handles.axes3);
B = imresize(I,.5);
imshow(B),pause(0.1);
B = imresize(I,.4);
imshow(B),pause(0.1);
B = imresize(I,.3);
imshow(B),pause(0.1);
B = imresize(I,.2);
imshow(B),pause(0.1);
B = imresize(I,.1);
imshow(B),pause(0.1);
imshow(I);
 

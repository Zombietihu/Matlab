function varargout = ExamenT2(varargin)
% EXAMENT2 MATLAB code for ExamenT2.fig
%      EXAMENT2, by itself, creates a new EXAMENT2 or raises the existing
%      singleton*.
%
%      H = EXAMENT2 returns the handle to a new EXAMENT2 or the handle to
%      the existing singleton*.
%
%      EXAMENT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMENT2.M with the given input arguments.
%
%      EXAMENT2('Property','Value',...) creates a new EXAMENT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ExamenT2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ExamenT2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ExamenT2

% Last Modified by GUIDE v2.5 24-Nov-2015 19:31:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ExamenT2_OpeningFcn, ...
                   'gui_OutputFcn',  @ExamenT2_OutputFcn, ...
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


% --- Executes just before ExamenT2 is made visible.
function ExamenT2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ExamenT2 (see VARARGIN)

% Choose default command line output for ExamenT2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ExamenT2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ExamenT2_OutputFcn(hObject, eventdata, handles) 
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
I=imread('abichuela.jpg');
axes(handles.axes1);
imshow(I);
gray=rgb2gray(I);
axes(handles.axes2);
imhist(gray)
tk='14';
cor='14';
%supervisado=ExtraeCorazon(I);
mhu=FinalCorazon(I);
j=1;
k=1;
for i=1:92
    if mhu(i,1)>0.85 && mhu(i,1)<1.2472
        corazon(j)=mhu(i,1);
        j=j+1;
    else
        if mhu(i,1)>0.555 && mhu(i,1)<.8617
            tqm(k)=mhu(i,1);
            k=k+1;
        end
    end
end
%set(handles.edit1,'String' );
%set(handles.edit2,'String',);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

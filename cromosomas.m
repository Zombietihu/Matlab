function varargout = cromosomas(varargin)
% CROMOSOMAS MATLAB code for cromosomas.fig
%      CROMOSOMAS, by itself, creates a new CROMOSOMAS or raises the existing
%      singleton*.
%
%      H = CROMOSOMAS returns the handle to a new CROMOSOMAS or the handle to
%      the existing singleton*.
%
%      CROMOSOMAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CROMOSOMAS.M with the given input arguments.
%
%      CROMOSOMAS('Property','Value',...) creates a new CROMOSOMAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cromosomas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cromosomas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cromosomas

% Last Modified by GUIDE v2.5 06-Oct-2015 13:33:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cromosomas_OpeningFcn, ...
                   'gui_OutputFcn',  @cromosomas_OutputFcn, ...
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


% --- Executes just before cromosomas is made visible.
function cromosomas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cromosomas (see VARARGIN)

% Choose default command line output for cromosomas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cromosomas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cromosomas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
I = imread('cromosomas.tif');
handles.I=I;
guidata(hObject,handles);
axes(handles.axes1);
imshow(I);
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I= handles.I;
[ Im_dilate ] = extrae( I );
axes(handles.axes2);
imshow(Im_dilate);
%Encuentra
[ n,boundary ] = cuentaCromo( I );
 [i,j]=find(boundary);   
 axes(handles.axes3);
 imshow(I);
 hold on; 
 plot(j,i,'r.');
 set(handles.edit1,'String',n);
 



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

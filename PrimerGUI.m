function varargout = PrimerGUI(varargin)
% PRIMERGUI MATLAB code for PrimerGUI.fig
%      PRIMERGUI, by itself, creates a new PRIMERGUI or raises the existing
%      singleton*.
%
%      H = PRIMERGUI returns the handle to a new PRIMERGUI or the handle to
%      the existing singleton*.
%
%      PRIMERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRIMERGUI.M with the given input arguments.
%
%      PRIMERGUI('Property','Value',...) creates a new PRIMERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PrimerGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PrimerGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PrimerGUI

% Last Modified by GUIDE v2.5 17-Sep-2015 17:21:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PrimerGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PrimerGUI_OutputFcn, ...
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


% --- Executes just before PrimerGUI is made visible.
function PrimerGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PrimerGUI (see VARARGIN)

% Choose default command line output for PrimerGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PrimerGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PrimerGUI_OutputFcn(hObject, eventdata, handles) 
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
axes(handles.axes1);
I = imread('HERRAMIENTAS.jpg');
imshow(I);
axes off;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
I = imread('HERRAMIENTAS.jpg');
[im_binariza,im_gray]=fprocesa(I);
imshow(im_binariza);

axes(handles.axes3);
imshow(im_gray);

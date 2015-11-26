function varargout = Frig(varargin)
% FRIG MATLAB code for Frig.fig
%      FRIG, by itself, creates a new FRIG or raises the existing
%      singleton*.
%
%      H = FRIG returns the handle to a new FRIG or the handle to
%      the existing singleton*.
%
%      FRIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRIG.M with the given input arguments.
%
%      FRIG('Property','Value',...) creates a new FRIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Frig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Frig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Frig

% Last Modified by GUIDE v2.5 24-Nov-2015 19:10:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Frig_OpeningFcn, ...
                   'gui_OutputFcn',  @Frig_OutputFcn, ...
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


% --- Executes just before Frig is made visible.
function Frig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Frig (see VARARGIN)

% Choose default command line output for Frig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Frig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Frig_OutputFcn(hObject, eventdata, handles) 
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
try 
    [filename,pathname] = uigetfile('*.jpg','Selecciona imagen para abrir');


    if isequal(filename,0) 
        %Do nothing yet 
    else 
        handles.myImage = imread(fullfile(pathname, filename));

        mImagen2 = handles.myImage;
        image(mImagen2, 'Parent', handles.axes1); 
    end 
    guidata(hObject, handles); 
catch 
    msgbox('Error') 
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%leemos imagen
j=17;
m=19;
frijol=imread('habichuelas.jpg');
%imshow(frijol);
%pause
%binarizamos
bn=im2bw(frijol);
imshow(bn);
pause


%% sacar total de frijoles
BW2 = edge(bn,'canny');
Im_bin=not(BW2);
imshow(BW2);
Im_label=bwlabel(Im_bin,4);
n=max(max(Im_label));

%%Eliminar areas menores a 100 pixeles
bn=bwareaopen(bn,800);
imshow(bn);
pause
%%Etiquetar elementos conectados
[L Ne]=bwlabel(bn);
propied = regionprops(L);

hold on



%%Graficar cajas de frontera
for n=1:size(propied,1)
	rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2);
end
tqm=find([propied.Area]<1400);
d=size(tqm);

%Todas las Q son menores de 1400
for n=1:size(tqm,2)
	rectangle('Position',propied(tqm(n)).BoundingBox,'EdgeColor','r','LineWidth',2)
end
pause

msgbox({'Numero de corazones',num2str(m),'Numero de TQM',num2str(d)});


%num2str(d)





% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = imread('habichuelas.jpg');
h = rgb2gray(I);
%subplot(1,2,1),imshow(h);
%subplot(1,2,2),imhist(h);
imhist(h);

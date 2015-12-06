function varargout = IndianaLego(varargin)
% INDIANALEGO MATLAB code for IndianaLego.fig
%      INDIANALEGO, by itself, creates a new INDIANALEGO or raises the existing
%      singleton*.
%
%      H = INDIANALEGO returns the handle to a new INDIANALEGO or the handle to
%      the existing singleton*.
%
%      INDIANALEGO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INDIANALEGO.M with the given input arguments.
%
%      INDIANALEGO('Property','Value',...) creates a new INDIANALEGO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IndianaLego_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IndianaLego_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IndianaLego

% Last Modified by GUIDE v2.5 06-Dec-2015 01:21:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IndianaLego_OpeningFcn, ...
                   'gui_OutputFcn',  @IndianaLego_OutputFcn, ...
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


% --- Executes just before IndianaLego is made visible.
function IndianaLego_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IndianaLego (see VARARGIN)

% Choose default command line output for IndianaLego
handles.output = hObject;

% Update handles structure



guidata(hObject, handles);

% UIWAIT makes IndianaLego wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IndianaLego_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
cd C:\Users\Tonatihu\Documents\Tratamiento\Matlab\Proyecto_Final
list = dir('*.jpg');
number_of_files = size(list);
names = cell(number_of_files(1,1),1);

for i = 1:number_of_files(1,1)
    names{i} = list(i).name;
    
end
for i = 1:number_of_files(1,1)
    A{i} = imread(names{i});
    
    handles.Original=A{i};%Variable global
    
    guidata(hObject,handles);
    axes(handles.axes1)  
    imshow(A{i});    
    [HM, S, EG, IA, D, PP]=momentosIndianaLego(A{i});
    axes(handles.axes2)
    imshow(S);
    axes(handles.axes4)
    imshow(EG);
    axes(handles.axes5)
    imshow(IA);
    axes(handles.axes6)
    imshow(D);
    axes(handles.axes7)
    imshow(PP);
    
    manita='';
    brazo='';
    pierna='';
    camisa='';
    cabeza='';
    sombrero='';
    carita='';
    if(((HM(1)>.364 && HM(1)<.4153) && (HM(2)>.0572&& HM(2)<.854))&&((HM(3)>.003&&HM(3)<.0047)&&(HM(4)>.00007&& HM(4)<.0021) ))
    brazo='Falta Brazo';
    set(handles.edit10,'String','NO');
    end
    
    if(strcmp(brazo,''))
        if(((HM(1)>.37079574183 && HM(1)<.385472730407)||(HM(1)==.344744858291425|| HM(1)==.356612000813953|| HM(1)==.364314758882646)||(HM(1)==.28678992||HM(1)==.404794468505243||HM(1)==.318426492469676))&&((HM(3)>.00103202&&HM(3)<.00178708)||(HM(3)==.00460935553706976||HM(3)==.000447062865660216|| HM(3)==.0003004||(HM(3)==.00369659378037036)&&(HM(4)>.00106092 && HM(4)<.00119479||(HM(4)>.00058911&&HM(4)<.00097195)||(HM(4)>.00027466&&HM(4)<.00058912||HM(4)==.0000391365601309515||HM(4)==.000430252056001575)||HM(4)==.00119477748514392))))
            manita='Falta Mano';
            set(handles.edit8,'String','NO');
        end
    end
    
    if((HM(1)>.26 && HM(1)<.268) || (HM(1)>.297 && HM(1)<.319) || (HM(1)>.35 && HM(1)<.38 && HM(2)>.035 && HM(2)<.048) ||(HM(1)>.392 && HM(1)<.409 &&HM(2)>.05 && HM(2)<.081))
    pierna='Falta pierna';
    set(handles.edit6,'String','NO');
    end
    
    if((HM(1)>0.27638192 && HM(1)<0.323100045) && (HM(2)>0.011114805 && HM(2)<0.020437705) && (HM(3)>4.09E-05 && HM(3)<0.003696594))
        cabeza='Falta Cabeza';
        sombrero='Falta Sombrero';
        carita='Falta Carita';
        set(handles.edit9,'String','NO');         
        set(handles.edit4,'String','NO');
        set(handles.edit5,'String','NO');
    end
    if((HM(1)>0.450663449 && HM(1)<0.523635872) && (HM(2)>0.07477791 && HM(2)<0.119794631))
        camisa='Falta Camisa';
        set(handles.edit7,'String','NO');
    end
    if (strcmp(cabeza,''))==1
            if ((HM(1)> 0.267282263&& HM(1)< 0.53914308)&&(HM(2)> 0.00036915&& HM(2)< 0.03529293)&&(HM(3)> 0.0000432000&& HM(3)< 0.19173906)&&(HM(4)> 0.00002587735&& HM(4)< 0.03153688)&&(HM(5)> -0.0011355&& HM(5)< 6.4608E-07)&&(HM(6)> -5.462707&& HM(6)< 0.0016099)&&(HM(7)> -0.00217362&& HM(7)< 1.283754E-08))
            sombrero='Falta Sombrero';
            set(handles.edit4,'String','NO');
            end
            if ((HM(1)> 0.33233674 && HM(1)< 0.3773987)&& (HM(2)> 0.03434634&& HM(2)< 0.04738540)&&(HM(3)> 0.00159746&& HM(3)< 0.00254747)&&(HM(4)> 0.000476638&& HM(4)< 0.001501749)&&(HM(5)> 3.9400275E-07&& HM(5)< 2.752349E-06)&&(HM(6)> 0.00007761111&& HM(6)< 0.000319076)&&(HM(7)> -1.62&& HM(7)< 5.39E-07))
            carita='Falta Cara';
            set(handles.edit5,'String','NO');
            end
   end
    %%
    %si tiene todo
   if(strcmp(brazo,'') && strcmp(manita,'') && strcmp(pierna,'')&& strcmp(cabeza,'')&& strcmp(carita,'') && strcmp(camisa,'')&& strcmp(sombrero,''))
       axes(handles.axes3)
       imshow(imread('correcto.png'));
    else 
        axes(handles.axes3)
       imshow(imread('error.png'));
        
   end 
   %%
   %Brazo
   if(strcmp(brazo,''))==1
        set(handles.edit10,'String','SI');
   end
   %%
   %Si tiene mano
   if (strcmp(manita,''))==1
       set(handles.edit8,'String','SI');
   end
   %%
   %Si tiene pierna
   if(strcmp(pierna,''))==1
      set(handles.edit6,'String','SI');
   end
   %%
   %cabeza
   if(strcmp(cabeza,''))==1
    set(handles.edit9,'String','SI');
   end
   %%
   %Cara
   if (strcmp(carita,''))==1
      set(handles.edit5,'String','SI');
   end
   %%
   %Ropa
   if(strcmp(camisa,''))==1
   set(handles.edit7,'String','SI');
   end
   %%
   if(strcmp(sombrero,''))==1
    set(handles.edit4,'String','SI');
   end
   %%
   
      pause();
    
    
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function varargout = numeric(varargin)
% NUMERIC MATLAB code for numeric.fig
%      NUMERIC, by itself, creates a new NUMERIC or raises the existing
%      singleton*.
%
%      H = NUMERIC returns the handle to a new NUMERIC or the handle to
%      the existing singleton*.
%
%      NUMERIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUMERIC.M with the given input arguments.
%
%      NUMERIC('Property','Value',...) creates a new NUMERIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before numeric_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to numeric_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help numeric

% Last Modified by GUIDE v2.5 10-May-2015 11:36:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @numeric_OpeningFcn, ...
                   'gui_OutputFcn',  @numeric_OutputFcn, ...
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


% --- Executes just before numeric is made visible.
function numeric_OpeningFcn(hObject, eventdata, handles, varargin)
% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('background1.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to numeric (see VARARGIN)

% Choose default command line output for numeric
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes numeric wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = numeric_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Itime_Callback(hObject, eventdata, handles)
% hObject    handle to Itime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Itime as text
%        str2double(get(hObject,'String')) returns contents of Itime as a double



% --- Executes during object creation, after setting all properties.
function Itime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Itime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%msgbox('Hello');
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calculate.
function Calculate_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fcapacity=15000;
itime= str2num(get(handles.Itime,'String'))*100;
ftime= str2num(get(handles.Ftime,'String'))*100;
speed= str2num(get(handles.speed,'String'))/60;
it1=fix(itime/100);
it2=mod(itime,100);
iftime=it2+it1*60;
ft1=fix(ftime/100);
ft2=mod(ftime,100);
fftime=ft2+ft1*60;
difference=fftime-iftime;
distance = speed*difference;
fuelleft = fcapacity - distance*12;
%fprintf('%d',fuelleft);
r=(fuelleft*1888)/72000;
%fprintf('%d',radius);
dynamicnew;


function Ftime_Callback(hObject, eventdata, handles)
% hObject    handle to Ftime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%msgbox('Bye');

% Hints: get(hObject,'String') returns contents of Ftime as text
%        str2double(get(hObject,'String')) returns contents of Ftime as a double


% --- Executes during object creation, after setting all properties.
function Ftime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ftime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of speed as text
%        str2double(get(hObject,'String')) returns contents of speed as a double


% --- Executes during object creation, after setting all properties.
function speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LiveImages.
function LiveImages_Callback(hObject, eventdata, handles)
url='http://uk.flightaware.com/live/flight/AIC863/history/20150506/0745Z/VIDP/VABB';
web(url,'-browser');
% hObject    handle to LiveImages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function varargout = MP_TERM_PAPER_GUI(varargin)
% MY_TRAIL_GUI_KMEAN MATLAB code for MP_TERM_PAPER_GUI.fig
%      MY_TRAIL_GUI_KMEAN, by itself, creates a new MY_TRAIL_GUI_KMEAN or raises the existing
%      singleton*.
%
%      H = MY_TRAIL_GUI_KMEAN returns the handle to a new MY_TRAIL_GUI_KMEAN or the handle to
%      the existing singleton*.
%
%      MY_TRAIL_GUI_KMEAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MY_TRAIL_GUI_KMEAN.M with the given input arguments.
%
%      MY_TRAIL_GUI_KMEAN('Property','Value',...) creates a new MY_TRAIL_GUI_KMEAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MP_TERM_PAPER_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MP_TERM_PAPER_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MP_TERM_PAPER_GUI

% Last Modified by GUIDE v2.5 25-Apr-2021 16:26:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MP_TERM_PAPER_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MP_TERM_PAPER_GUI_OutputFcn, ...
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


% --- Executes just before MP_TERM_PAPER_GUI is made visible.
function MP_TERM_PAPER_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
clc;
cla reset;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MP_TERM_PAPER_GUI (see VARARGIN)

% Choose default command line output for MP_TERM_PAPER_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MP_TERM_PAPER_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MP_TERM_PAPER_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in kmean_button.
function kmean_button_Callback(hObject, eventdata, handles)
% hObject    handle to kmean_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clc
%clear all
%close all
%warning off
global im

numberOfClasses = str2double(get(handles.edit1,'String'));

%im=imread('Earth-Western-Hemisphere.jpg');
%subplot(1,2,1);
imshow(im);
redChannel=im(:, :, 1);
greenChannel=im(:, :, 2);
blueChannel=im(:, :, 3);
data=double([redChannel(:), greenChannel(:), blueChannel(:)]);
%numberOfClasses=10;
[m n]=kmeans(data,numberOfClasses);
m=reshape(m,size(im,1),size(im,2));
n=n/255;
clusteredImage=label2rgb(m,n);
%subplot(1,2,2);
%imshow(clusteredImage)
axes(handles.axes1);
imshow(clusteredImage);



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


% --- Executes on button press in upload_image.
function upload_image_Callback(hObject, eventdata, handles)
% hObject    handle to upload_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global imback
global path
[path,cancel]=imgetfile();
if cancel
    msgbox(sprintf('Error'),'Error')
    return
end
im=imread(path);
imback=imread(path);
%im=im2double(im);
axes(handles.axes1)
imshow(im)


% --- Executes on button press in ISODATA.
function ISODATA_Callback(hObject, eventdata, handles)
% hObject    handle to ISODATA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im

%numberOfClasses = str2double(get(handles.edit1,'String'));

%im=imread('Earth-Western-Hemisphere.jpg');
%subplot(1,2,1);
imshow(im);
redChannel=im(:, :, 1);
greenChannel=im(:, :, 2);
blueChannel=im(:, :, 3);
data=double([redChannel(:), greenChannel(:), blueChannel(:)]);
%numberOfClasses=10;
x=randi([5 10],1)
%numofclass=x;
[m n]=kmeans(data,x);
m=reshape(m,size(im,1),size(im,2));
n=n/255;
clusteredImage=label2rgb(m,n);
%subplot(1,2,2);
%imshow(clusteredImage)
axes(handles.axes1);
imshow(clusteredImage);


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imshow(im);


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('You successfully exit the GUI')
pause(1)
close();
close();

%Record
%   This script is made to either record audio from a device connected to a
%   computer or to read an audio file directly from your computer
%Parameters:
%   N/A
%Output:
%   audio: An array of values from your audio
function [audio] = Record()
    Fs = 1000;                         %Sample Frequency stablished
%     audio   =   uigetfile('*.mp3');     %Read audio from a file
    audio = audiorecorder(Fs, 8, 1);   %Uncomment if instead you want to
                                        %record audio
    
    disp('Start Speaking');           %Uncomment this block if you want 
    recordblocking(audio, 1);         %to start recording
    disp('End of Recording');
%     [myRecord, Fs] = audioread(audio);  %Get audio data from your audio and
                                        %the sampling frequency of the file 
     
    myRecord = getaudiodata(audio);   %Uncomment to getaudiodata from a
                                        %     record
    
    disp(length(myRecord))                       
    %Plot section of code
    figure
    t = 1/Fs:1/Fs:1;
    plot(t, myRecord);
    title('Magnitud de la señal de audio');
    xlabel('Time (s)');
    ylabel('Energy (J)');
    
    %Send objects to espectro script in order to obtain the plot in
    %Decibels vs Frequency
    espectro(myRecord, Fs)
    
end
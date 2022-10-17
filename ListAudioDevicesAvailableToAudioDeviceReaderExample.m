 %List Audio Devices Available to |audioDeviceReader|
 %Create an |audioDeviceReader| System objec , and then call |getAudioDevices| 
 %%on your object.

deviceReader = audioDeviceReader;
devices = getAudioDevices(deviceReader)

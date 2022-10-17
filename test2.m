

fs=16000;
dt=1/fs;

t=1/fs:1/fs:2;


r = audiorecorder(fs, 16, 1);
t_start_rx = datetime('now');
recordblocking(r,5);     % speak into microphone...
t_end_rx = datetime('now');

y = getaudiodata(r);
plot(y)

play(r, [1 (get(r, 'SampleRate') * 3)]);

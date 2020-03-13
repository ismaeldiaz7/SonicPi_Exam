# Seven Nation Army by The White Stripes
=begin
Optimize the code using variables, arrays, functions, and parameterized functions.
=end
use_bpm 120
use_synth :fm
v1 = "C:/Users/ismael_diaz/Downloads/sonic_pi_digital_exam/samples/vocalA.wav"
v2 = "C:/Users/ismael_diaz/Downloads/sonic_pi_digital_exam/samples/vocalB.wav"
v3 = "C:/Users/ismael_diaz/Downloads/sonic_pi_digital_exam/samples/vocalC.wav"
v4 = "C:/Users/ismael_diaz/Downloads/sonic_pi_digital_exam/samples/vocalD.wav"
solo = "C:/Users/ismael_diaz/Downloads/sonic_pi_digital_exam/samples/solo.wav"
volume = [0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1]
vocals = [v1,v2,v3,v4]
x=0
a=0

define :guitar1 do
  play :e3
  sleep 1.5
  play :e3
  sleep 0.5
  play :g3
  sleep 0.75
  play :e3
  sleep 0.25
  play :r
  sleep 0.5
  play :d3
  sleep 0.5
  play :c3, sustain: 1.75
  sleep 2
  play :b2, sustain: 1.75
  sleep 2
end
define :bass_guitar do |n1,n2,n3,n4,n5|
  play n1
  sleep 1.5
  play n1
  sleep 0.5
  play n2
  sleep 0.75
  play n1
  sleep 0.25
  play :r
  sleep 0.5
  play n3
  sleep 0.5
  play n4, sustain: 1.75
  sleep 2
  play n5, sustain: 1.75
  sleep 2
end

live_loop :white_stripes do
  4.times do
    guitar1
  end
  stop
end
8.times do
  sample :drum_heavy_kick
  sleep 1
end
8.times do
  sample :drum_cymbal_hard
  sleep 1
end
8.times do
  sample :drum_snare_hard
  sleep 1
end
8.times do
  sample :drum_cymbal_pedal
  sleep 1
end

sample :drum_splash_hard
4.times do
  sample vocals [x]
  sleep 8
  x=x+1
end
16.times do
  sample :drum_snare_hard, amp: volume[a]
  sleep 0.5
  a=a+1
end

sample solo, amp: 2
sleep 8

guitar1

bass_guitar :e3,:g3,:d3,:g4,:fs4

play :e3, sustain: 4
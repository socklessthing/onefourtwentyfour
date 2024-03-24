pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
dice={}
onefour24={1,4,6,6,6,6}
max_time=120
counter=max_time
update_interval = counter / 6  -- update every sixth of the time
current_dice_index = 1  -- variable to keep track of current dice being updated
delay_counter = 30  -- delay for 30 frames before updating the first dice
runcounter=false

hasone=false
hasfour=false
score=0

function _init()

	for i=1,6 do
		dice[i]=flr(rnd(6)+1)
	end

end

function _update()
	update()
end

function _draw()
	draw()
end
-->8
--update

function update()
 btnpress()
	
	if counter%update_interval==update_interval-1 and counter<max_time then
		sfx(0)
	end
	
	if counter > 0 then
	 if delay_counter > 0 then
	     delay_counter -= 1
	     for i = 1, 6 do
       dice[i] = flr(rnd(6) + 1)
    		end    
	 else
	 
    local c = counter / update_interval
    local index = 6  -- start from the rightmost dice
    for i = 1, c do        
        dice[index] = flr(rnd(6) + 1)
        index = index - 1  -- move to the next dice from right to left
        if index < 1 then            
            break  -- exit loop if all dice have been updated
        end
    end
    
    if runcounter then
     counter -= 1     
    end
	 end
	end
	    
--	if counter!=60 then
	
--		local c=counter/10
	
--	 for i=c+1,6 do
--	  dice[i]=flr(rnd(6)+1)
--	 end
--	end
	
--	if counter!=60 then
--		counter+=1
--	end

end

function btnpress()
 if btnp(❎) then
		counter=max_time
		runcounter=true
		delay_counter = 30		
	end
end
-->8
--draw

function draw()
 cls()
 print("press x: stop/restart")
	print("delay: "..delay_counter,7)
	print("counter: "..counter,7)	
	print("--dice--")
	
	for i=1,6 do
  print(dice[i])
  spr(dice[i], 24+i*9, 64)
	end
end
__gfx__
00000000077777700777777007777770077777700777777007777770000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777777557777775577777755775577557755775577557000000000000000000000000000000000000000000000000000000000000000000000000
00700700777777777557777775577777755775577557755775577557000000000000000000000000000000000000000000000000000000000000000000000000
000770007775577777777777777dd77777777777777dd7777dd77dd7000000000000000000000000000000000000000000000000000000000000000000000000
000770007775577777777777777dd77777777777777dd7777dd77dd7000000000000000000000000000000000000000000000000000000000000000000000000
00700700777777777777755777777557755775577557755775577557000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777777777755777777557755775577557755775577557000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700777777007777770077777700777777007777770000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000201004010080100c020120301b040130300d020070100101000010000000000000000000000000000000000000000000000000000000000000000000000000000000000100001000010000100001000

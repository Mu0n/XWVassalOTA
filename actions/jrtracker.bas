10      rem "Jr Tracker by econtreras"15      dim cpos(3):dim rpos(3):dim nname$(150):dim psg(84)17      dim lb(3):dim hb(3):curpat=0:mem=$22C00+512:tempo=12818      cursong=0:maxsongpat=0:edflag=020      cls 25      memcopy $22C00,$4000 poke 0:rem "clear song memory"26      for c=0 to 7:xpoke($22C08+16*c,c):next :rem "initialize song pages"30      memcopy $7800,64 poke 0:rem "define sprite cursor"40      for c=0 to 350      for d=0 to 360      ?($7800+8*c+d)=20070      next 80      next 90      poke $D000,63:rem "Show sprite cursor"100     poke $D900,121:pokel $D901,$7800101     poke $D900+8,121:pokel $D901+8,$7800102     poke $D900+16,121:pokel $D901+16,$7800103     poke $D900+24,121:pokel $D901+24,$7800110     pokew $D904,48:pokew $D906,100111     pokew $D904+8,128:pokew $D906+8,100112     pokew $D904+16,204:pokew $D906+16,100113     pokew $D904+24,236:pokew $D906+24,80120     drawscreen():readnotes():addpattern(1):showpattern(1)125     rhythm=0130     p=0:rect 2,38 color 201 to 82,197:rem "p=panel"140     while qflag=false 145     pflag=false :cflag=0150     k=inkey()160     if (k=46)^(k=9)165     p=(p+1)&3170     pflag=true :edflag=0180     endif 190     if (k=44)^(k=5)195     p=(p-1):if p=-1 then p=3200     pflag=true :edflag=0210     endif 220     if pflag=true 230     rect 2,38 color 100 to 82,197240     rect 94,38 color 100 to 158,197250     rect 170,38 color 100 to 190,197255     rect 202,38 color 100 to 271,81260     if p=0 then rect 2,38 color 201 to 82,197270     if p=1 then rect 94,38 color 201 to 158,197280     if p=2 then rect 170,38 color 201 to 190,197285     if p=3 then rect 202,38 color 201 to 271,81290     pflag=false :k=0300     endif 305     if (rhythm=0)310     if k=6 then cpos(p)=cpos(p)+1:if cpos(p)>=4 then cpos(p)=0:cflag=1315     if k=2 then cpos(p)=cpos(p)-1:if cpos(p)=-1 then cpos(p)=3:cflag=1320     if k=14 then rpos(p)=rpos(p)+1:if rpos(p)>=32 then rpos(p)=0:cflag=1325     if k=16 then rpos(p)=rpos(p)-1:if rpos(p)=-1 then rpos(p)=31:cflag=1330     endif 335     if p=0340     if ((k>=2)&(k<=16)&(note>0))345     printat(4+cpos(0)*4,rpos(0)+17,"...")350     endif 360     if rhythm=0 then pokew $D904,48+cpos(p)*16:pokew $D906,100+rpos(p)*4370     if cpos(0)<=2380     if ((k>=97)&(k<=103))^((k>=65)&(k<=71))390     printat(4+cpos(0)*4,rpos(0)+17,"    ")395     if k>71 then k=k-32400     n$=chr$(k):printat(4+cpos(0)*4,rpos(0)+17,n$):note=1410     endif 420     if note=1430     if (k=42)^(k=35)435     if (n$<>"E")&(n$<>"B")440     printat(5+cpos(0)*4,rpos(0)+17,"#"):n$=n$+"#"445     endif 450     endif 460     if (k>=49)&(k<=55)470     printat(6+cpos(0)*4,rpos(0)+17,chr$(k)):n$=n$+chr$(k):note=0474     if len(n$)=2 then n$=left$(n$,1)+" "+right$(n$,1)475     a=mem+curpat*128+rpos(0)*4+cpos(0):rem "calculate mem position"476     d=1:while nname$(d)<>n$:d=d+1:wend :rem "find note"477     xpoke(a,d):rem "store note"480     endif 490     endif 500     if k=8510     printat(4+cpos(0)*4,rpos(0)+17,"..."):note=0515     a=mem+curpat*128+rpos(0)*4+cpos(0)516     xpoke(a,0):rem "delete note"520     endif 521     if k=111522     printat(4+cpos(0)*4,rpos(0)+17,"OFF"):note=0523     a=mem+curpat*128+rpos(0)*4+cpos(0)524     xpoke(a,85)525     endif 526     if k=122527     printat(4+cpos(0)*4,rpos(0)+17,"EOT"):note=0528     a=mem+curpat*128+rpos(0)*4+cpos(0)529     xpoke(a,125)530     endif 535     endif 540     if cpos(0)=3550     if (rhythm>=1)&(k=13)560     if (len(n$)>0)565     if val(n$)<=63570     rhythm=0:a$=right$("0"+n$,2):printat(18,rpos(0)+17,a$)575     a=mem+curpat*128+rpos(0)*4+cpos(0)576     d=128+val(n$):xpoke(a,d)580     else 590     n$="":rhythm=0:printat(16,rpos(0)+17,". ..")600     endif 610     else 615     n$="":rhythm=0:printat(16,rpos(0)+17,". .."):k=0617     endif 618     endif 620     if (rhythm>=1)&(rhythm<=2)630     if (k>=48)&(k<=57)640     printat(17+rhythm,rpos(0)+17,chr$(k)):rhythm=rhythm+1650     n$=n$+chr$(k)660     endif 670     endif 680     if ((k=49)&(rhythm=0))690     n$=""700     printat(16,rpos(0)+17,"1"):rhythm=1710     pokew $D904,104720     printat(18,rpos(0)+17,"  ")730     endif 740     if k=8750     printat(16,rpos(0)+17,". ..")755     a=mem+curpat*128+rpos(0)*4+cpos(0)756     d=0:xpoke(a,d)760     endif 770     endif 780     endif 1000    if p=11010    pokew $D906+8,100+rpos(p)*4:poke $D904+8,128+(cpos(p)*16)1020    if k=131030    num=rpos(p)*4+cpos(p)1040    curpat=num:showpattern(num+1)1050    endif 1060    if k=1151070    num=rpos(p)*4+cpos(p):maxsongpat=maxsongpat+11080    a=$22C00+255+page*32+maxsongpat:xpoke(a,num+1)1090    a$=right$("00"+str$(num+1),3)1100    printat(43,16+maxsongpat,a$)1110    endif 1500    endif 1510    if p=21520    pokew $D906+16,100+rpos(p)*41530    if k=911540    page=(page-1):if page=-1 then page=71550    showpage(page)1560    endif 1570    if k=931580    page=(page+1)&71590    showpage(page)1600    endif 1610    endif 1800    if p=31810    if rpos(p)>7 then rpos(p)=01820    if rpos(p)<0 then rpos(p)=71830    if cpos(p)>1 then cpos(p)=01840    if cpos(p)<0 then cpos(p)=1:pokew $D904+24,2641845    if edflag=01846    if cpos(p)=0:pokew $D904+24,236:else :pokew $D904+24,296:endif 1847    endif 1848    pokew $D906+24,80+rpos(p)*41850    if cpos(p)=01860    if k=131865    if edflag=01870    rem "a$=str$(rpos(p)):printat(60,1,a$)"1880    showsongseq(rpos(p)+1):cursong=rpos(p)1885    else 1887    edflag=0:poke $D904+24,264:name$=""1890    endif 1895    endif 1900    if k>31&k<123&len(name$)<141910    if edflag=0 then nc=2:name$="":edflag=1:printat(51,12,spc(14))1920    name$=name$+chr$(k):a=$22C08+16*rpos(p)+nc1930    xpoke(a,k)1940    printat(51,12+rpos(p),name$):nc=nc+11950    pokew $D904+24,236+len(name$)*4:k=01960    endif 1970    endif 1980    if cpos(p)=11990    if k>47&k<562000    printat(66,12+rpos(p),chr$(k))2010    a=$22C08+16*rpos(p):page=val(chr$(k))2020    xpoke(a,page)2030    endif 2040    endif 2050    endif 2200    if edflag=02210    if k=131 then savefile()2220    if k=129 then loadfile()2230    if k=32 then playsong(cursong+1)2240    if k=135 then soundoff()2250    if k=112 then playpattern(curpat+1)2260    if (k=43^k=45)2270    if k=432280    curpat=curpat+1:showpattern(curpat+1)2290    if curpat>maxpat2300    maxpar=curpat2310    addpattern(curpat+1)2320    endif 2330    endif 2340    if k=452350    if curpat>0 then curpat=curpat-1:showpattern(curpat+1)2360    endif 2370    cpos(1)=curpat%4:rpos(1)=curpat\42380    pokew $D904+8,128+cpos(1)*16:pokew $D906+8,100+rpos(1)*42390    endif 2400    if k=1162410    poke $D904,89:poke $D906,76:n$=""2420    printat(14,11,"..."):tempo=1282430    while k<>132440    k=inkey()2450    if k>=48&k<=57&len(n$)<32460    n$=n$+chr$(k)2470    printat(14,11,n$)2480    poke $D904,89+(4*len(n$))2490    endif 2500    wend 2510    if n$<>""2520    if (val(n$)>=0)&(val(n$)<=255)2530    tempo=val(n$)2540    a=$22C08+16*(cursng):xpoke(a+1,tempo)2550    endif 2560    endif 2570    a$=right$("00"+str$(tempo),3):printat(14,11,a$)2580    endif 2590    endif 2600    wend 2999    end 3000    proc drawsong(num)3010    num=num-13020    songmem=$22C00+256+(num*32):print a3030    for c=0 to 313040    xpeek(songmem+c):b=peekvalue:a$=right$("00"+str$(b),3)3050    printat(43,17+c,a$)3060    next 3080    endproc 3100    proc savefile()3105    pokew $D906,64:pokew $D904,2603110    k=0:c=0:n$="":printat(57,8,"          ")3120    while k<>133130    k=inkey()3140    if (k<>0)&(k<>13)&c<163150    a$=chr$(k):n$=n$+a$:c=c+13160    printat(57,8,n$)3165    pokew $D906,64:pokew $D904,260+4*len(n$)3170    endif 3180    wend 3190    a$=n$+".trk":printat(2,50,"Saving "+a$)3200    bsave a$,$22C00,163843210    printat(2,50,spc(40))3220    endproc 3250    proc loadfile()3260    k=0:n$="":printat(57,8,"          ")3270    while k<>133275    pokew $D904,260+len(n$)*4:pokew $D906,643280    k=inkey()3290    if (k<>0)&(k<>13)&c<163300    a$=chr$(k):n$=n$+a$3310    printat(57,8,n$)3320    endif 3330    wend 3340    a$=n$+".trk":printat(2,50,"Loading "+a$)3350    try bload a$,$22C00 to ec3355    if ec=03360    printat(2,50,spc(40))3370    xpeek($22C06):cursong=peekvalue:rem "Patterns used"3380    for c=0 to peekvalue-13390    a$=right$("00"+str$(c+1),3):printat(24+(c%4)*4,17+(c\4),a$)3400    next 3410    showtracks()3420    showsongseq(1)3425    showpattern(1)3430    else 3440    printat(2,50,spc(40))3450    printat(2,50,"File not found.. press a key to continue.")3460    k=0:while k=0:k=inkey():wend 3470    printat(2,50,spc(42))3480    endif 3485    pokew $D904,48:pokew $D906,100:cursong=03490    endproc 4000    proc drawscreen()4010    cls :bitmap on :bitmap clear 04020    printat(1,0,"JR TRACKER - a simple PSG Tracker by econtreras")4030    printat(1,4,"F1 Load Song")4040    printat(1,5,"F3 Save Song")4050    printat(1,6,"F7 Sound off")4060    printat(16,4,"P  Play Pattern")4070    printat(16,5,"+  Next Pattern")4080    printat(16,6,"-  Prev Pattern")4090    printat(33,4,"SPC Play Complete Song")4100    printat(33,5,"TAB Change Section")4105    printat(33,6,"Q   QUIT Tracker!")4110    printat(1,2,"GLOBAL")4120    printat(16,2,"PATTERN")4130    printat(33,2,"OTHER")4140    line 2,0 color 100 to 2,284150    line 60,7 to 60,284160    line 126,7 to 126,284170    line 226,0 to 226,284180    line 2,6 to 226,64190    line 2,13 to 226,134200    line 2,29 to 226,294210    printat(3,10,"PATTERN   TEMPO")4220    printat(3,11,"  001      128      ")4230    printat(1,13,"#  CH1 CH2 CH3 R FQ ")4235    printat(1,14,"VL  01  01  01 ")4236    printat(1,15,"IN  01  01  01 ")4240    for c=1 to 324250    a$=right$("0"+str$(c),2)+" ... ... ... . ..    ... ..."4255    a$=a$+" ... ...    ..."4260    printat(1,16+c,a$)4270    next 4280    line 2,38 to 82,384290    line 2,38 to 2,1974300    line 2,49 to 82,494310    line 46,38 to 46,494320    rem "line 70,38 to 70,49"4330    line 82,38 to 82,1974340    line 2,66 to 82,664350    line 2,197 to 82,1974360    line 14,49 to 14,1974370    line 30,49 to 30,1974380    line 46,49 to 46,1974390    line 62,49 to 62,1974400    line 70,49 to 70,1974410    line 82,38 to 82,1974420    rem "line 94,38 to 94,197"4430    rem "line 106,38 to 106,197"4440    printat(27,12," PATTERNS")4450    printat(27,13,"   USED  ")4460    line 94,38 to 94,1974470    line 110,66 to 110,1974480    line 126,66 to 126,1974490    line 142,66 to 142,1974495    line 158,38 to 158,1974500    line 94,66 to 158,664510    line 94,197 to 158,1974520    line 94,38 to 158,384530    printat(43,12,"SONG"):printat(43,13,"PAGE"):printat(44,15,"00")4540    line 170,38 to 170,1974550    line 190,38 to 190,1974560    line 170,38 to 190,384570    line 170,66 to 190,664580    line 170,197 to 190,1974590    for c=0 to 5:printat(36,43+c,"---"):next 4600    printat(54,10,"TRACK LIST  P")4620    for c=0 to 7:a$=str$(c):printat(66,12+c,a$):next 4640    line 202,38 to 271,384650    line 202,38 to 202,804660    line 262,38 to 262,804670    line 202,45 to 271,454680    line 202,81 to 271,814690    line 271,38 to 271,814700    printat(51,8,"FILE: NEW")4710    endproc 5000    proc printat(x,y,a$)5010    ?1=2:rem "set I/O to text memory"5020    pos=$C000+(y*80)+x5030    for c=1 to len(a$):a=asc(mid$(a$,c,1)):?(pos+c-1)=a:next 5040    ?1=05050    endproc 5100    proc showpattern(num)5105    rem "Song Header is 256 bytes + 256 Bytes for Instrument Data"5110    a$=right$("00"+str$(num),3):printat(5,11,a$)5120    for y=0 to 315130    for x=0 to 35140    a=mem+(y*4)+x+(num-1)*128:xpeek(a)5145    if x<35150    if peekvalue<=1405152    a$=right$("..."+nname$(peekvalue),3)5153    else 5155    a$="..."5156    endif 5160    else 5170    if peekvalue<>05180    a$="1 "+right$("00"+str$(peekvalue&31),2)5190    else 5195    a$=". .."5197    endif 5200    endif 5210    printat(4+(x*4),y+17,a$)5220    next 5230    next 5240    endproc 5250    proc readnotes()5260    for c=1 to 1405270    read a$:nname$(c)=a$5280    next 5290    for c=1 to 845300    read a#:psg(c)=int(11563/a#)5310    next 5320    nname$(0)=""5330    endproc 5350    proc xpeek(addr)5360    local block:block=addr\8192:local prevblock5370    local offset:offset=addr%81925380    ?0=179:prevblock=?$E:?$E=block:?1=45390    peekvalue=?($C000+offset)5400    ?1=0:?$E=prevblock5410    endproc 5450    proc xpoke(addr,value)5460    local block:block=addr\8192:local prevblock5465    local offset:offset=addr%81925470    ?0=179:prevblock=?$E:?$E=block:?1=45480    ?($C000+offset)=value5490    ?1=0:?$E=prevblock5500    endproc 5510    proc addpattern(num)5520    if num<1225530    col=(num-1)%4:row=(num-1)\45540    a$=right$("00"+str$(num),3):printat(24+(col*4),17+row,a$)5545    printat(5,11,a$)5550    else 5560    printat(2,50,"Max number of patterns reached!")5570    k=0:while k=0:k=inkey:wend 5580    printat(2,50,"                             ")5585    maxpat=num-15590    endif 5595    endproc 5600    proc playpattern(num)5605    currow=0:eot=05610    while currow<=315620    a=mem+currow*4+(num-1)*128:rhythm=05630    for c=0 to 25640    xpeek(a+c):b=peekvalue5645    if b=125 then currow=31:eot=15650    if b=85 then lb(c)=855660    if b=0 then lb(c)=-1:hb(c)=-15670    if (b>0)&(b<85) then lb(c)=psg(b)&15:hb(c)=(psg(b)&1008)\165680    if b=85 then lb(c)=855690    next 5691    xpeek(a+3):b=peekvalue5692    if b<>0 then lb(2)=0:hb(2)=0:lb(3)=0:hb(3)=b&63:rhythm=15700    if lb(0)=85 then poke $D600,144+15:goto 57205710    if lb(0)>=0 then poke $D600,144:poke $D600,128+lb(0):poke $D600,hb(0)5720    if lb(1)=85 then poke $D600,176+15:goto 57405730    if lb(1)>=0 then poke $D600,176:poke $D600,160+lb(1):poke $D600,hb(1)5740    if (lb(2)=85)^(rhythm=1) then poke $D600,208+15:goto 57605750    if lb(2)>=0 then poke $D600,208:poke $D600,192+lb(2):poke $D600,hb(2)5760    if rhythm=15770    poke $D600,208+15:poke $D600,192+(hb(3)&1)*4:poke $D600,hb(3)\25780    poke $D600,231:poke $D600,2405790    else 5800    poke $D600,240+155810    endif 5820    poke $D906,100+(currow*4):poke $D904,485830    if eot=0 then for d=1 to 1024-(tempo*3):next 5840    currow=currow+15850    wend 5860    endproc 5900    proc playsong(num)5910    num=num-1:sngmem=$22C00+255+32*num:pattern=1:sngrow=15920    while pattern<>o5930    xpeek(sngmem+sngrow):pattern=peekvalue5935    a$=str$(peekvalue):rem "printat(1,59,a$)"5940    if pattern<>0 then poke $D906+16,100+(sngrow-1)*45945    if pattern<>0 then playpattern(pattern)5950    sngrow=sngrow+15960    wend 5970    endproc 6000    proc soundoff()6010    poke $D600,144+15:poke $D600,176+156020    poke $D600,208+15:poke $D600,240+156030    endproc 6500    proc showsongseq(num)6510    a=$22C08+16*(num-1):eflg=06520    xpeek(a):page=peekvalue6530    xpeek(a+1):tempo=peekvalue6540    for c=1 to 326542    a$=right$("0"+str$(c),2)+" ... ... ... . ..":printat(1,16+c,a$)6545    next 6550    a$=right$("00"+str$(tempo),3)6560    printat(14,11,a$):sngmem=$22C00+256+32*(page)6570    showpage(page)6580    endproc 6650    proc showtracks()6660    sngmem=$22C08:xpeek($22C07):maxsng=peekvalue6670    for cursng=1 to 86680    n$="":xpeek(sngmem+(cursng-1)*16):page=peekvalue6690    for d=2 to 156700    xpeek(sngmem+((cursng-1)*16)+d):n$=n$+chr$(peekvalue)6710    next 6720    printat(51,11+cursng,n$):a$=str$(page):printat(66,11+cursng,a$)6730    next 6740    endproc 7000    proc showpage(page)7010    sngmem=$22C00+256+32*(page):eflg=07020    for sngrow=0 to 317030    xpeek(sngmem+sngrow)7040    a$=right$("00"+str$(peekvalue),3)7050    if peekvalue=07060    if eflg=07070    if sngrow>0 then maxsongpat=sngrow7080    if sngrow=0 then maxsongpat=07090    endif 7100    eflg=17110    a$="..."7120    endif 7130    printat(43,17+sngrow,a$)7140    next 7150    a$=right$("00"+str$(page),2):printat(44,15,a$)7200    endproc 10000   rem "NOTE & COMMAND DATA"10010   data "C 1","C#1","D 1","D#1","E 1"10015   data "F 1","F#1","G 1","G#1","A 1","A#1","B 1"10020   data "C 2","C#2","D 2","D#2","E 2"10025   data "F 2","F#2","G 2","G#2","A 2","A#2","B 2"10030   data "C 3","C#3","D 3","D#3","E 3"10035   data "F 3","F#3","G 3","G#3","A 3","A#3","B 3"10040   data "C 4","C#4","D 4","D#4","E 4"10045   data "F 4","F#4","G 4","G#4","A 4","A#4","B 4"10050   data "C 5","C#5","D 5","D#5","E 5"10055   data "F 5","F#5","G 5","G#5","A 5","A#5","B 5"10060   data "C 6","C#6","D 6","D#6","E 6"10065   data "F 6","F#6","G 6","G#6","A 6","A#6","B 6"10070   data "C 7","C#7","D 7","D#7","E 7"10075   data "F 7","F#7","G 7","G#7","A 7","A#7","B 7"10080   data "OFF","V01","V02","V03","V04","V05","V06"10085   data "V07","V08","V09","V10","V11"10090   data "V12","V13","V14","V15","P-C","P-B","P-A","P-9","P-8","P-7"10100   data "P-6","P-5","P-4","P-3","P-2","P-1","P+1","P+2","P+3","P+4"10110   data "P+5","P+6","P+7","P+8","P+9","P+A","P+B","P+C","EOP","I01"10120   data "I02","I03","I04","I05","I06","I07","I08","I09","I10","I11"10130   data "I12","I13","I14","I15"10140   rem "NOTE FREQUENCY"10150   data 32.70,34.65,36.71,38.89,41.20,43.6510160   data 46.25,49.00,51.91,55.00,58.27,61.7410170   data 65.41,69.30,73.42,77.78,82.41,87.3110180   data 92.50,98.00,103.83,110.00,116.54,123.4710190   data 130.81,138.59,146.83,155.56,164.81,174.6110200   data 185.00,196.00,207.65,220.00,233.08,246.9410210   data 261.63,277.18,293.66,311.13,329.63,349.2310220   data 369.99,392.00,415.30,440.00,466.16,493.8810230   data 523.25,554.37,587.33,622.25,659.25,698.4610240   data 739.99,783.99,830.61,880.00,932.33,987.7710250   data 1046.50,1108.73,1174.66,1244.51,1318.51,1396.9110260   data 1479.98,1567.98,1661.22,1760.00,1864.66,1975.5310270   data 2093.00,2217.46,2349.32,2489.02,2637.02,2793.8310280   data 2959.96,3135.96,3322.44,3520.00,3729.31,3951.07
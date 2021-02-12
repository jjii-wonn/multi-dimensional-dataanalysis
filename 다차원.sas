data final.new2007;
   set final.data2007;
array z{3} q12a1 q12a2 q12a3;
   do b=1 to 3;
      if z{b} < 20;
      if z{b} ^= . then do;
         q12=z{b};
         wgt=1;
         output;
      end;
   end;
   drop b q12a1 q12a2 q12a3;
run;

/*주요 쇼핑장소 3곳 중복응답*/
data final.new2007;
   set final.new2007;
array p{3} q13a1 q13a2 q13a3;
   do a=1 to 3;
   if p{a} < 11;
   if p{a} ^= . then do;
   q13=p{a};
   wgt=1;
   output;
end;
end;
drop a q13a1 q13a2 q13a3;
run;

data final.pilyo2007;
set final.new2007;
keep nat sex age dd14 q16a1 q16a2 q16a3 q16a4 q16a5 q16a6 q16a7 q12 q13;
run;

/*--------------------------------------------------------------------------------------------------------*/
data final.new2009;                                 
set final.data2009;

array p{3} q13a1 q13a2 q13a3;         /*주요 쇼핑장소 3곳 중복응답*/
do a=1 to 3;
if p{a} <22;
if p{a} ^= . then do;
   q13=p{a};
   wgt=1;
   output;
end;
end;
drop a q13a1 q13a2 q13a3;
run;

data final.new2009;                                 
set final.new2009;
array z{3} q14a1 q14a2 q14a3;         /*주요 쇼핑품목 3가지 중복응답*/
do b=1 to 3;
if z{b} <22;
if z{b} ^= . then do;
   q14=z{b};
   wgt=1;
   output;
end;
end;
drop b q14a1 q14a2 q14a3;

run;

data final.pilyo;
set final.new2009;
keep nat sex age dd11 q17a1 q17a2 q17a3 q17a4 q17a5 q17a6 q17a7 q13 q14;
run;


data final.d2009;
rename dd11=dd14 q17a1=q16a1 q17a2=q16a2 q17a3=q16a3 q17a4=q16a4 q17a5=q16a5 
             q17a6=q16a6 q17a7=q16a7 q13=q12 q14=q13;
set final.pilyo;
run;



/*--------------------------------------------------------------------------------------------------------*/
data final.new2011;                                 
set final.data2011;

array p{3} q14b1 q14b2 q14b3;
   do a=1 to 3;
   if p{a} < 11;
   if p{a} ^= . then do;
   q14b=p{a};
   wgt=1;
   output;
end;
end;
drop a q14b1 q14b2 q14b3;
run;

data final.new2011;                                 
set final.new2011;
array z{3} q14a1 q14a2 q14a3;
   do b=1 to 3;
      if z{b} < 20;
      if z{b} ^= . then do;
         q14=z{b};
         wgt=1;
         output;
      end;
   end;
drop b q14a1 q14a2 q14a3;

run;

data final.pilyo2011;
set final.new2011;
keep nat sex age q1 q16a01 q16a02 q16a03 q16a04 q16a05 q16a06 q16a07 q14 q14b;
run;

data final.d2011;
rename q1=dd14 q16a01=q16a1 q16a02=q16a2 q16a03=q16a3 q16a04=q16a4 q16a05=q16a5 
             q16a06=q16a6 q16a07=q16a7 q14=q12 q14b=q13;
set final.pilyo2011;
run;


/*-------------------------------------------------------------*/
proc sql;
create table final.all as 
select *
from final.pilyo2007
union
select *
from final.d2009
union 
select *
from final.d2011;
quit;

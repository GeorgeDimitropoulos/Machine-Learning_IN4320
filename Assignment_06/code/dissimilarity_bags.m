%Di s s imi l a r i t y Bags
 func t i on [ d i s s imi l a r i t y b a g s ] = d i s s imi l a r i t y b a g s ( bags )
 s i z e = l eng th ( bags ) ;
 f o r i =1: s i z e
 f o r j =1: s i z e
 d i s s imi l a r i t y b a g s ( i , j )=0;
 end
 end
 f o r i = 1 : s i z e
 f o r j = 1 : s i z e
 d i s s imi l a r i t y b a g s ( i , j ) = di s t anc eba g s ( bags { i } , bags { j }) ;
 end
 end
 end
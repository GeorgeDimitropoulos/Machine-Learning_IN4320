func t i on [ pr edi c t edLabe l s ] = adaPr edi c t ion ( beta , parameter , da t a s e t )
 % Input : beta , parameter=[ f e a t , theta , y ] , da t a s e t
 % Output : pr edi c t edLabe l s
 N = s i z e ( datas e t , 1 ) ;%number o f data
 b = s i z e ( beta , 1 ) ;
 bas eScor e = 0. 5* sum( l o g ( 1 . / beta ) ) ;
 s c o r e s = z e r o s (N, b) ;
 f o r t=1:b
 f e a t u r e = parameter ( t , 1 ) ;
 the ta = parameter ( t , 2 ) ;
 y = parameter ( t , 3 ) ;
 Theta = ones (N, 1 ) * the ta ;
 i f y==0
 s c o r e s ( : , t ) =da t a s e t ( : , f e a t u r e )−Theta<0;
 e l s e
 s c o r e s ( : , t ) = da t a s e t ( : , f e a t u r e )−Theta>=0;
 end
 s c o r e s ( : , t ) = s c o r e s ( : , t ) * l o g (1/ beta ( t ) ) ;
 end
 pr edi c t edLabe l s = sum( s c o r e s , 2 )>=bas eScor e ;
 pr edi c t edLabe l s = pr edi c t edLabe l s +1;
 end
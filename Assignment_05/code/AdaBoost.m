func t i on [ pr edi c t edLabe l s , beta , parameter ,W] = adaBoost ( datas e t ,
i t e r a t i o n s , l a b e l s )
 % Input : Dataset , cor r e sponding l a b e l s and number o f i t e r a t i o n s
 % Output : Pr edi c t ed l a b e l s , beta and parameter s o f base c l a s s i f i e r s and
 % weight matrix W
 n = s i z e ( datas e t , 1 ) ;%number o f samples
 weight = ones (n , 1 ) ;%I n i t i a l i z a t i o n
 W = ones (n , i t e r a t i o n s ) ;
 beta = z e r o s ( i t e r a t i o n s , 1 ) ;
 parameter = z e r o s ( i t e r a t i o n s , 3 ) ;
 f o r t = 1 : i t e r a t i o n s
 p = weight . / sum( weight ) ;
 W( : , t ) = p ;
 [ f e a tur e , theta , y ] = weightedWeakLearner ( datas e t , p , l a b e l s ) ;
 parameter ( t , : ) = [ f e a tur e , theta , y ] ;
 [ e r r o r , p r e d i c t i o n ] = Er r o rCa l cul a t i on ( f e a tur e , theta , y , datas e t , p ,
l a b e l s ) ;%A func t i on that r e turns the e r r o r
 i f e r r o r==0
 e r r o r =0.00001;%avoid d i v i s i o n by 0
 end
 beta ( t ) = e r r o r /(1− e r r o r ) ;%update o f our parameter s
 weight = weight . * ( beta ( t ) .^(1 − abs ( pr edi c t i on − l a b e l s ) ) ) ;
 end
 pr edi c t edLabe l s = adaPr edi c t ion ( beta , parameter , da t a s e t ) ;%Function that
c l a s s i f y new and unseen data
 end
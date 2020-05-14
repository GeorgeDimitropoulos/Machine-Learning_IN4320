func t i on [ f e a tur e , theta , y ] = weak_learner ( datas e t , l a b e l s )
 %Input : Dataset and cor r e sponding l a b e l s
 %Output : Optimal f e a tur e , theta , and s i gn .
 [ n , d ] = s i z e ( da t a s e t ) ;%n=number o f po int s and d=number o f f e a t u r e s
 minimum_score = 9999999;
 f o r i =1:d
 f o r j = 1 : n
 s i gn = 0 ; %s i gn 0 cor r e sponds to < and s i gn 1 cor r e sponds to >
 Thetas = ones (n , 1 ) * da t a s e t ( j , i ) ;%Compute p r e d i c t i o n s
 pr edi c t 0 = da t a s e t ( : , i )−Thetas <0;
 pr edi c t 1 = da t a s e t ( : , i )−Thetas>=0;
 pr edi c t 1 = pr edi c t 1 +1;% Tranform l a b e l s to 1 and 2 r e s p e c t i v e l y
 pr edi c t 0 = pr edi c t 0 +1;
 s c o r e 0 =sum( abs ( pr edi c t0 − l a b e l s ) ) ;
 s c o r e 1 = sum( abs ( pr edi c t1 − l a b e l s ) ) ;
 i f s cor e0>s c o r e 1%Find opt imal s i gn (< or >)
 s c o r e 0 = s c o r e 1 ;
 s i gn =1;
 end
 i f s cor e0<minimum_score%Find opt imal f e a tur e , the ta and s i gn f o r
which the c l a s s i f i c a t i o n e r r o r on the t r a i n i n g s e t i s
minimum
 minimum_score = s c o r e 0 ;
 y = s i gn ;
 f e a t u r e = i ;
 the ta = da t a s e t ( j , i ) ;
 end
 end
 end
 end
%Another MIL c l a s s i f i e r
 %Read images and e x t r a c t i n s t a n c e s
 %{
 cd ’ sival_apple_banana / apple ’
a p p l e s_f i l e s = d i r ( ’ * . jpg ’ ) ;
 num_apples = l eng th ( a p p l e s_f i l e s ) ;
 f o r i =1:num_apples
 cur r ent f i l ename = a p p l e s_f i l e s ( i ) . name ;
 cur r ent image = imread ( cur r ent f i l ename ) ;
 apples_images { i } = cur r ent image ;
 end
 cd ’ . . / banana ’
 banana s_f i l e s = d i r ( ’ * . jpg ’ ) ;
 num_bananas = l eng th ( banana s_f i l e s ) ;
 f o r i =1:num_bananas
 cur r ent f i l ename = banana s_f i l e s ( i ) . name ;
 cur r ent image = imread ( cur r ent f i l ename ) ;
 bananas_images{ i } = cur r ent image ;
 end
 apples_width = 4 0 ;
 bananas_width = 4 0 ;
 cd ’ . . ’
 cd ’ . . ’
 [ apple_lab , apple_bags ] = minmaxextract ( apples_images , apples_width ) ;
 [ banana_lab , banana_bags ] =e x t r a c t i n s t a n c e s ( bananas_images ,
bananas_width ) ;
 %}

 load ( ’ da t a_ano the r_c l a s s i f i e r .mat ’ )% load mat f i l e f o r more e f f i c i e n t
code
 bags = [ apple_bags , banana_bags ] ;%compute bags
 f o r epan=1:100%Perform 100 i t e r a t i o n f o r more r e p r e s e n t a t i v e r e s u l t s
 % Random s p l i t o f the da t a s e t int o t r a i n and t e s t s e t
 apples_random = randperm( 60 ) ;
 bananas_random = randperm( 60)+ 60* ones ( 1 , 6 0 ) ;
 t r a in_s e t = { } ;
 t e s t_s e t = { } ;
 % 60 t r a i n data , 30 appl e s and 30 bananas
 f o r i = 1 :3 0
 t r a in_s e t { i } = bags {1 , apples_random( i ) } ;
 t r a in_s e t { i+30} = bags {1 , bananas_random( i ) } ;
 end
 % 60 t e s t data , 30 appl e s and 30 bananas
 f o r i = 1 :3 0
 t e s t_s e t { i } = bags {1 , apples_random( i +30) } ;
 t e s t_s e t { i+30} = bags {1 , bananas_random( i +30) } ;
 end
 % c a l c u l a t e the d i s s imi l a r i t i e s o f the bags
 bagdi s tanc e_t rain = d i s s imi l a r i t y b a g s ( t r a in_s e t ) ;
 bagdi s tanc e_t e s t = d i s s imi l a r i t y b a g s ( t e s t_s e t ) ;
 % Prdatas e t
 bagdi s_t rain_datas e t = prda t a s e t ( bagdi s tanc e_t rain , [ ones ( 3 0 , 1 ) ; 2* ones
( 3 0 , 1 ) ] ) ;
 bagdi s_t e s t_datas e t = prda t a s e t ( bagdi s tanc e_t e s t , [ ones ( 3 0 , 1 ) ; 2* ones
( 3 0 , 1 ) ] ) ;
 % t r a i n Liknon L1−suppor t ve c t o r c l a s s i f i e r
 c l a s s i f i e r = l i knonc ( bagdi s_t rain_dataset , 30) ;
 l a b e l s = l a b e l d ( bagdi s_tes t_dataset , c l a s s i f i e r ) ;
 % e r r o r r a t e
 e r ror_appl e s = 0 ;
 error_bananas = 0 ;
 f o r i = 1 :3 0
i f l a b e l s ( i ) == 2
 e r ror_appl e s = e r ror_appl e s + 1 ; % mi s c l a s s i f i e d appl e s
 end

 i f l a b e l s ( i +30) == 1
 error_bananas = error_bananas + 1 ; %mi s c l a s s i f i e d bananas
 end
 end
 e r r o r_r a t e ( epan ) = ( e r ror_appl e s+error_bananas ) /60 ;
 end
 di sp (mean( e r r o r_r a t e ) *100)
 di sp ( s td ( e r r o r_r a t e ) *100)
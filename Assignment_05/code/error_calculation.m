func t i on [ e r r o r , p r e d i c t i o n ] = Er r o rCa l cul a t i on ( f e a tur e , theta , y , X_test ,
weight , lab_t e s t )
 weight = weight /sum( weight ) ;%i n i t i a l i z a t i o n o f the weight
 n = s i z e (X_test , 1 ) ;%number o f po int s
 Theta = ones (n , 1 ) * the ta ;
 i f y==0
 r e d i c t i o n = X_test ( : , f e a t u r e )−Theta<0;
 p r e d i c t i o n = p r e d i c t i o n +1;
 s c o r e = weight ’ * abs ( pr edi c t i on −lab_t e s t ) ;

 e l s e
 p r e d i c t i o n = X_test ( : , f e a t u r e )−Theta>=0;
 p r e d i c t i o n = p r e d i c t i o n +1;
 s c o r e = weight ’ * abs ( pr edi c t i on −lab_t e s t ) ;

 end
 e r r o r = sum( s c o r e ) /n *100;
 end
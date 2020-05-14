%Di s tanc e Bags
 func t i on [ di s t anc eba g s ] = di s t anc eba g s ( bag1 , bag2 )
 [ num_instance1 , ~] = s i z e ( bag1 ) ;
 [ num_instance2 , ~] = s i z e ( bag2 ) ;
f o r i =1:num_instance1
 f o r j =1:num_instance2
 di s t anc e ( i , j )=0;
 end
 end
 f o r i = 1 : num_instance1
 f o r j = 1 : num_instance2
 di s t anc e ( i , j ) = norm( bag1 ( i , : ) −bag2 ( j , : ) ) ;
 end
 end
 di s t anc eba g s = min (min ( di s t anc e ) ) ;
 end
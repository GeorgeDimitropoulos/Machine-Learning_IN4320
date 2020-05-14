c l e a r a l l ;
load coin_data ;
a_ini t = [ 0 . 2 , 0 . 2 , 0 . 2 , 0 . 2 , 0 . 2 ] ’ ; % i n i t i a l a c t i on
n = 213 ; % i s the number o f days
d = 5 ; % number o f c o ins
% we provide you with va lue s R and G.
alpha = s q r t (max( sum( r . ^ 2 , 2 ) ) ) ;
e p s i l o n = min (min ( r ) ) ;
G = alpha / e p s i l o n ;
R = 1 ;
% s e t e ta :
%%% your code he r e %%%
e ta=R/( s q r t (n)*G) ;
a = a_ini t ; % i n i t i a l i z e a c t i on . a i s always a column ve c t o r
L = nan (n , 1 ) ; % keep t r ack o f a l l incur r ed l o s s e s
A = nan (d , n ) ; % keep t r ack o f a l l our pr evi ous a c t i o n s
f o r t = 1 : n
% we play a c t i on a
[ l , g ] = mix_loss ( a , r ( t , : ) ’ ) ; % incur l o s s l , compute g r adi ent g
A( : , t ) = a ; % s t o r e played a c t i on
L( t ) = l ; % s t o r e incur r ed l o s s
% update our ac t ion , make sur e i t i s a column ve c t o r
%%% your code he r e %%%
a=A( : , t )− e ta *g ;
% a f t e r the update , the a c t i on might not be anymore in the a c t i on
% s e t A ( f o r example , we may not have sum( a ) = 1 anymore ) .
% t h e r e f o r e we should always p r o j e c t a c t i on back to the a c t i on s e t :
a = project_to_s implex ( a ’ ) ’ ; % p r o j e c t back ( a = \Pi_A(w) from l e c t u r e )
end
% compute t o t a l l o s s
%%% your code he r e %%%
Total_Loss=sum(L, 1 )
% compute t o t a l gain in wealth
%%% your code he r e %%%
B=A’
f o r i =1:n
dai ly_gain ( i )= sum( r ( i , : ) . *B( i , : ) ) ;
end
%t o t a l gain
gain_total= prod ( dai ly_gain ) ;
% compute be s t f i x e d s t r a t e g y ( you may make use o f l o s s_f ixed_a c t i on .m and opt imi z a t i on
%%% your code he r e %%%
f o r i =1:213
be s t_f ixed ( i )=l o s s_f ixed_a c t i on (A( : , i ) ) ;
end
[C, I ] = min ( be s t_f ixed ) ;
% compute r e g r e t
%%% your code he r e %%%
OCO_Regret = Total_Loss − be s t_f ixed ( I ) ;
% compare t o t a l l o s s o f OGD and l o s s o f be s t f i x e d a c t i on
comparison=Total_Loss<C
% compare OCO r e g r e t o f OGD and t h e o r e t i c a l guarant e e OCO r e g r e t
comparison1=OCO_Regret<R*G* s q r t (n)
%% pl o t o f the s t r a t e g y A and the co in data
% i f you s t o r e the s t r a t e g y in the matrix A ( s i z e d * n)
% t h i s p i e c e o f code wi l l v i s u a l i z e your s t r a t e g y
f i g u r e
subplot ( 1 , 2 , 1 ) ;
pl o t (A’ )
l egend ( symbols_str )
t i t l e ( ’ r eba l anc ing s t r a t e g y OGD’ )
x l a b e l ( ’ date ’ )
y l a b e l ( ’ inves tment a c t i on a_t ’ )
subplot ( 1 , 2 , 2 ) ;
pl o t ( s )
l egend ( symbols_str )
t i t l e ( ’ worth o f coins ’ )
x l a b e l ( ’ date ’ )
y l a b e l ( ’USD’ )
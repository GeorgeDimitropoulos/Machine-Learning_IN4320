load coin_data ;
d = 5 ;
n = 213 ;
% compute adve r sary movez z_t
%%% your code he r e %%%
z_t=−l o g ( r ) ;
%Total l o s s o f each expe r t
%%% your code he r e %%%
f o r i =1:n
f o r j =1:d
expe r t_l o s s ( i , j ) = sum( z_t ( 1 : i , j ) ) ;
end
end
% compute s t r a t e g y p_t ( s e e s l i d e s )
%%% your code he r e %%%
p ( 1 , 1 )=0 . 2 ;
p ( 1 , 2 )=0 . 2 ;
p ( 1 , 3 )=0 . 2 ;
p ( 1 , 4 )=0 . 2 ;
p ( 1 , 5 )=0 . 2 ;
f o r i =2:n
f o r j =1:d
p( i , j )=exp(− expe r t_l o s s ( i −1 , j ) ) / sum( exp(− expe r t_l o s s ( i − 1 , : ) ) ) ;
end
end
% compute l o s s o f s t r a t e g y p_t
%%% your code he r e %%%
f o r i =1:n
Loss_pt ( i ) = −l o g ( sum(p( i , : ) . * r ( i , : ) ) ) ;
end
% compute l o s s e s o f e xpe r t s
%%% your code he r e %%%
f o r i =1:d
l o s s e s_o f_expe r t s ( i ) = expe r t_l o s s (213 , i ) ;
end
% compute r e g r e t
%%% your code he r e %%%
Expert_Regret = sum( Loss_pt ) − min ( l o s s e s_o f_expe r t s ) ;
% compute t o t a l gain o f i n v e s t i n g with s t r a t e g y p_t
%%% your code he r e %%%
f o r i =1:n
dai ly_gain ( i )= sum( r ( i , : ) . * p( i , : ) ) ;
end
%t o t a l gain
gain_total= prod ( dai ly_gain ) ;
% compare t o t a l l o s s o f AA and t o t a l l o s s o f expe r t
comparison=sum( Loss_pt)<l o s s e s_o f_expe r t s ( 1 )
comparison1=sum( Loss_pt)<l o s s e s_o f_expe r t s ( 2 )
comparison2=sum( Loss_pt)<l o s s e s_o f_expe r t s ( 3 )
comparison3=sum( Loss_pt)<l o s s e s_o f_expe r t s ( 4 )
comparison4=sum( Loss_pt)<l o s s e s_o f_expe r t s ( 5 )
% compare expe r t r e g r e t o f AA and t h e o r e t i c a l guarant e e
comparison5=Expert_Regret<l o g (d)
%% pl o t o f the s t r a t e g y p and the c oin data
% i f you s t o r e the s t r a t e g y in the matrix p ( s i z e n * d)
% t h i s p i e c e o f code wi l l v i s u a l i z e your s t r a t e g y
f i g u r e
subplot ( 1 , 2 , 1 ) ;
pl o t (p)
l egend ( symbols_str )
t i t l e ( ’ r eba l anc ing s t r a t e g y AA’ )
x l a b e l ( ’ date ’ )
y l a b e l ( ’ c onf idenc e p_t in the expe r t s ’ )
subplot ( 1 , 2 , 2 ) ;
pl o t ( s )
l egend ( symbols_str )
t i t l e ( ’ worth o f coins ’ )
x l a b e l ( ’ date ’ )
y l a b e l ( ’USD’ )
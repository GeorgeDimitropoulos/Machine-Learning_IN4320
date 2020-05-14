func t i on [ l , g ] = mix_loss ( a , r )
% [ l , g ] = MIX_LOSS( a , r )
% Input :
% a ( column ve c t o r ) , the inves tment s t r a t e g y ( note a should be normal ized so that % r ( column ve c t o r ) , s tock changes on day t ( compared with t −1)
% Output :
% l ( number ) , the mix l o s s
% g ( column ve c t o r ) , the g r adi ent o f the mix l o s s ( with r e s p e c t to a c t i on a )
%%% your code he r e %%%
l=−l o g ( a ’ * r ) ;
g=−r /( a ’ * r ) ;
end
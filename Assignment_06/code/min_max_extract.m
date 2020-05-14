%Min−Max e x t r a c t
 func t i on [ l abe l , bag_minmax ] = minmaxextract ( images , width )
 s i z e = l eng th ( images ) ;
 l a b e l = { } ;
 f o r i = 1 : s i z e
 l a b e l = [ l abe l , im_meanshift ( images {1 , i } , width ) ] ;
 end
 bag_minmax = { } ;
 f o r i = 1 : s i z e
 image = images {1 , i } ;
 num_instance = max(max( l a b e l { i }) ) ;
 ins t anc e = z e r o s ( num_instance , 6 ) ;
 f o r n = 1 : num_instance
 instance_rmin = min(min ( image ( : , : , 1 ) . * uint8 ( l a b e l { i}==n) ) ) ;
 instance_rmax = max(max( image ( : , : , 1 ) . * uint8 ( l a b e l { i}==n) ) ) ;
 instance_gmin = min (min ( image ( : , : , 2 ) . * uint8 ( l a b e l { i}==n) ) ) ;
 instance_gmax = max(max( image ( : , : , 2 ) . * uint8 ( l a b e l { i}==n) ) ) ;
 instance_bmin = min (min ( image ( : , : , 3 ) . * uint8 ( l a b e l { i}==n) ) ) ;
 instance_bmax = max(max( image ( : , : , 3 ) . * uint8 ( l a b e l { i}==n) ) ) ;

 ins t anc e (n , : ) = [ instance_rmin , instance_rmax , instance_gmin ,
instance_gmax , instance_bmin , instance_bmax ] ;
 end
 bag_minmax = [ bag_minmax , ins t anc e ] ;
 end
 end
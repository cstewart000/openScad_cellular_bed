thickness =16;
height = 600;
width =1800;
length =2100;
leg_width = 200;
beam_depth =100;
margin =5;
cell_spacing = 300;


//cell([0,i*cell_spacing,0],[90,0,0], length,height);


// short side
num_short_parts = floor(length/cell_spacing);
echo(num_short_parts);
for(i=[0:1:num_short_parts]){
    cell([0,i*cell_spacing,0],[90,0,0], length,height);
}

// long side
num_long_parts = floor(width/cell_spacing)+1;
num_long_parts_each = num_long_parts/2;
echo(num_long_parts);
for(i=[-num_long_parts_each:1:num_long_parts_each]){
    
    if((num_long_parts/2))
    cell([i*cell_spacing,length/2,0],[90,0,90], length,height);
}

//cell([0,0,0],[0,0,0], length,height);

 module cell(translation, rotation, length, width) {
   translate(translation)
       rotate(rotation)
            difference(){
                cube([length, width,thickness],true);
                translate([0,-beam_depth,0]) 
                cube([length-2*leg_width, width-beam_depth,thickness+margin],true);
                
            }
   }    
/*
//function even(x) = if(x%2!=1) {true; false;};

x = 30;   
val=undef;
if (x%2==1) {val=true; val=false;}
echo(val);
   
//echo(even(30));
   
       
  
// echor(even(3));   
   // tail-recursion elimination example: add all integers up to n
function add_up_to(n, sum=0) =
    n==0 ?
        sum :
        add_up_to(n-1, sum+n);

echo(sum=add_up_to(100000));
// ECHO: sum = 5.00005e+009


function even(n, val=undef) = if (n%2==0) {val =true; val = false};

echo(val=even(100000));

*/
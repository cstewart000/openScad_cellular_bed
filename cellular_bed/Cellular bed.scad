
/*
Created: C. Stewart
cstewart000@gmail.com

06/01/2017

Design inspired from:
http://www.instructables.com/id/Slotted-Bed/?ALLSTEPS

*/

thickness =16;
height = 400;
width =1800;
length =2100;
leg_width = 100;
beam_depth =100;
margin =5;
cell_spacing = 300;


*cell([0,0,0],[0,0,0], length,height, true);


// short side
num_short_parts = floor(length/cell_spacing);
//echo(num_short_parts);
for(i=[0:1:num_short_parts]){
    end = false;
    
    if (i==0||i==num_short_parts){
        echo("in end branch");
        end = true;
        cell([0,i*cell_spacing,0],[90,0,0], length,height, end);
    }
    else{
         echo("in non-end branch");
         cell([0,i*cell_spacing,0],[90,0,0], length,height, end);
    }
}

// long side
num_long_parts = floor(width/cell_spacing)+1;
num_long_parts_each = num_long_parts/2;
//echo(num_long_parts);
for(i=[-num_long_parts_each:1:num_long_parts_each]){
    end = false;
    
    if (i==-num_long_parts_each||i==num_long_parts_each){
        echo("in end branch");
        end = true;
        cell([i*cell_spacing,length/2,0],[90,0,90], length,height,end);
    }
    else{
         echo("in non-end branch");
         cell([i*cell_spacing,length/2,0],[90,0,90], length,height,end);
    }
    
}

//cell([0,0,0],[0,0,0], length,height);

 module cell(translation, rotation, length, width, end) {
   translate(translation)
       rotate(rotation)
     
            if(end==true){
                difference(){
                    cube([length, width,thickness],true);
                    translate([0,-beam_depth,0]) 
                    cube([length-2*leg_width, width-beam_depth,thickness+margin],true);}}
             else{
                 /*
                 difference(){
                 cube([length, width,thickness],true);
                 cells_per_side = floor((length/cell_spacing)/2);
                 for(i=[-cells_per_side:1:cells_per_side]){
                     translate([i*cell_spacing,-beam_depth,0]) 
                        cube([cell_spacing-leg_width, width,thickness+margin],true);
                 }
                 */
                 union(){
                 translate([0,(height-beam_depth)/2,0])  
                    cube([length, beam_depth,thickness],true);
                 cells_per_side = floor((length/cell_spacing)/2);
                     echo("cells_per_side");
                     echo(cells_per_side);
                 for(i=[-cells_per_side:1:cells_per_side-1]){
                     translate([i*cell_spacing+cell_spacing/2,0,0]) 
                        cube([leg_width, width,thickness],true);
                 }
                 
             }
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
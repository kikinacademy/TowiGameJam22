float x = 0;
float y = 0;
int you = rand_int_num(0,1000);
int rival;
int distance = rand_int_num(1,5);
String [] operations = new String [9];

void setup(){
    rival = you;
    operations[0] = str(you);
    println("YOU: "+ you);
    
    for(int i=1; i < 9; i++)
    {
        if(i%2==0)
        {
            operations[i] = cicle1();
        }
        else
        {
        operations[i] = cicle2();
        }
    }
    
    repeated();
    
    for(int i=1; i < 9; i++)
    {
        println(operations[i]);
    }
}


void repeated(){
    for(int i=1; i < 9; i++)
    {
        for(int j=1; j < 9; j++)
        {
            if(operations[i] == operations[j] && i != j)
            {
                if(i%2==0)
                {
                    operations[i] = cicle1();
                }
                else
                {
                    operations[i] = cicle2();
                }
            }
        }
    }
}


int rand_int_num(int h, int l) {
    int num = int(random(h,l));
    return num;
}

String divide(int value){
    int x=0;
    int y=0;
    while(x + y != value)
    {
        x = rand_int_num(0,1000);
        y = rand_int_num(0,1000);
    }
    return str(x) + " + " + str(y);
}

String cicle1(){
    rival = rand_int_num(you/distance, you-distance);
    return divide(rival);
}

String cicle2(){
    rival = rand_int_num(you+5*distance, you*distance);
    return divide(rival);
}

int n_gram(char* str_1, int size_1, char* str_2, int size_2, int n){

    int i,j,k,divider=0,score=0,sub_score, again, sec_count, count_a=0;
   

    for(i=0;i<=size_1-n;i++){
        for(j=i+1;j<=size_1-n;j++){
            again=0;
            for(k=0;k<n;k++){
                if (str_1[i+k]==str_1[j+k]){
                    again++;
                }
            }
            if(again==n){
              count_a++;
              break;
            }
        }
        if(again==n){
          continue;
        }

        sec_count=0;
        for(j=0;j<=size_2-n;j++){
            sub_score=0;
            for(k=0;k<n;k++){
                if (str_1[i+k]==str_2[j+k]){
                    sub_score++;
                }
            }
            
            if(sub_score==n){
                sec_count++;
            }
       
        }
        if(sec_count>0){
          score++;
          count_a+=sec_count-1;
        }
    }
    divider=size_1-n+1 + size_2-n+1 - score - count_a;
    return 100*score/divider;
}

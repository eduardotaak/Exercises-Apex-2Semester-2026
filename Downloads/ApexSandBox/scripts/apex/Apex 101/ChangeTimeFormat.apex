public String changeTimeFormat(String strTime) {
    String msg = '';
    Integer timer = 0;
    Integer hora = Integer.valueof(strTime.substring(0, 2));
    String minuto = strTime.substring(3,5);

    if(hora == 0){
        timer = 12;
        msg = timer + ':' + minuto + ' AM';
    }

    else if(hora < 12){
        msg = strTime + ' AM';
    }
    
    else if(hora == 12){
        msg = hora + ':' + minuto + ' PM';
    }
    else{
        timer  = hora - 12;
        if(timer < 10){
            msg = '0' + timer + ':' + minuto + ' PM';
        }
        else{
        msg = timer + ':' + minuto + ' PM';
        }
    }
    
    return msg;
}
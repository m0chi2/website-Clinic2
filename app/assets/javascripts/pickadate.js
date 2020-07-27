
  $(function(){
    $("#datepicker").pickadate({
    format: "yyyy年mm月dd日",
       min: +1,
       max: +90
    });

    $("#timepicker").pickatime({
    format: "HH:i",
    interval: 30,
    min: [8,30],
    max: [18,00]
    });
    });
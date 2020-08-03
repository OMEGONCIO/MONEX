$(document).ready(function(){
    let origin = window.location.origin;

    $.ajax({
        type: "POST",
        url: origin + '/get/messages',
        contentType: "application/json; charset=utf-8",
        success: function(response){
            this.response = response;

            if(this.response.success === "ok"){
                $('#tbodyUserAction').empty();

                if(this.response.data.lenght != 0){
                    for(let registry in this.response.data){
                        if(this.response.data.status[registry] == "excess"){
                            $('#divShowMessages').append('<div class="alert alert-warning" role="alert">'+this.response.data.message[registry]+'</div>');
                        }
                        /*if(this.response.data.status[registry] == "low")*/
                        else{
                            $('#divShowMessages').append('<div class="alert alert-danger" role="alert">'+this.response.data.message[registry]+'</div>');
                        }
                    }
                }
                else{
                    $('#divShowMessages').append('<div class="alert alert-success" role="alert" style="text-align:center;>Por el momento no hay mensajes a mostrar, esto significa que las cantidades dentro de la máquina de cambio están dentro del rango aceptado.</div>');
                }

                $('#tableUserAction').DataTable();
            }
            else{
                document.cookie = 'SID =; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
            }
        }
    })
});
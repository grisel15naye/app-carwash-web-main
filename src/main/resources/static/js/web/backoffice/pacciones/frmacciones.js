$(document).on("click", "#btnagregar", function(){
    $("#txtdescripcion").val("");
    $("#txtprecio").val("");
    $("#switchaccion").hide();
    $("#cbestadoacc").prop("checked", true);
    $("#hddcodacciones").val("0");
    $("#modalAcciones").modal("show");
});

$(document).on("click", ".btnactualizar", function(){
    $("#txtdescripcion").val($(this).attr("data-descripcion"));
    $("#txtprecio").val($(this).attr("data-precio"));
    $("#switchaccion").show();
    if ($(this).attr("data-estadoacc") === "true"){
        $("#cbestadoacc").prop("checked", true);
    } else {
        $("#cbestadoacc").prop("checked", false);
    }
    $("#hddcodacciones").val($(this).attr("data-accionesid"));
    $("#modalAcciones").modal("show");
});

$(document).on("click", "#btnguardar", function(){
    $.ajax({
        type: "POST",
        url: "/acciones/registrar",
        contentType: "application/json",
        data: JSON.stringify({
            accionesid: $("#hddcodacciones").val(),
            descripcion: $("#txtdescripcion").val(),
            precio: $("#txtprecio").val(),
            estadoacc: $("#cbestadoacc").prop("checked")
        }),
        success: function(resultado){
            if(resultado.resultado){
                listarAcciones();
            }
            alert(resultado.mensaje);
        }
    });
    $("#modalAcciones").modal("hide");
});

function listarAcciones(){
    $.ajax({
        type: "GET",
        url: "/acciones/listar",
        dataType: "json",
        success: function(resultado){
            $("#tblacciones > tbody").html("");
            $.each(resultado, function(index, value){
                $("#tblacciones > tbody").append("<tr>"+
                `<td>${value.accionesid}</td>`+
                `<td>${value.descripcion}</td>`+
                `<td>${value.precio}</td>`+
                `<td>${value.estadoacc}</td>`+
                `<td><button type="button" class="btn btn-info btnactualizar" `+
                ` data-accionesid="${value.accionesid}" `+
                ` data-descripcion="${value.descripcion}" `+
                ` data-precio="${value.precio}" `+
                ` data-estadoacc="${value.estadoacc}">Actualizar</button></td></tr>`
                );
            });
        }
    });
}

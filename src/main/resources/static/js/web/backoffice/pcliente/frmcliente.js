$(document).on("click", "#btnagregar", function(){
    $("#txtnombre").val("");
    $("#txtapellido").val("");
    $("#txttipodocumento").val("");
    $("#txtnumerodocumento").val("");
    $("#txttelefono").val("");
    $("#txtdireccion").val("");
    $("#switchcliente").hide();
    $("#cbestadocliente").prop("checked", false);
    $("#hddcodcliente").val("0");
    $("#modalcliente").modal("show");
});

$(document).on("click", ".btnactualizar", function(){
    $("#txtnombre").val($(this).attr("data-nombre"));
    $("#txtapellido").val($(this).attr("data-apellido"));
    $("#txttipodocumento").val($(this).attr("data-tipodocumento"));
    $("#txtnumerodocumento").val($(this).attr("data-numerodocumento"));
    $("#txttelefono").val($(this).attr("data-telefono"));
    $("#txtdireccion").val($(this).attr("data-direccion"));
    $("#switchcliente").show();
    if ($(this).attr("data-estadocliente") === "true"){
        $("#cbestadocliente").prop("checked", true);
    } else {
        $("#cbestadocliente").prop("checked", false);
    }
    $("#hddcodcliente").val($(this).attr("data-clienteid"));
    $("#modalcliente").modal("show");
});

$(document).on("click", "#btnguardar", function(){
    $.ajax({
        type: "POST",
        url: "/clientes/registrar",
        contentType: "application/json",
        data: JSON.stringify({
            clienteid: $("#hddcodcliente").val(),
            nombre: $("#txtnombre").val(),
            apellido: $("#txtapellido").val(),
            tipodocumento: $("#txttipodocumento").val(),
            numerodocumento: $("#txtnumerodocumento").val(),
            telefono: $("#txttelefono").val(),
            direccion: $("#txtdireccion").val(),
            estadocliente: $("#cbestadocliente").prop("checked")
        }),
        success: function(resultado){
            if(resultado.resultado){
                listarClientes();
            }
            alert(resultado.mensaje);
        }
    });
    $("#modalcliente").modal("hide");
});

function listarClientes(){
    $.ajax({
        type: "GET",
        url: "/clientes/listar",
        dataType: "json",
        success: function(resultado){
            $("#tblcliente > tbody").html("");
            $.each(resultado, function(index, value){
                $("#tblcliente > tbody").append("<tr>"+
                `<td>${value.clienteid}</td>`+
                `<td>${value.nombre}</td>`+
                `<td>${value.apellido}</td>`+
                `<td>${value.tipodocumento}</td>`+
                `<td>${value.numerodocumento}</td>`+
                `<td>${value.telefono}</td>`+
                `<td>${value.direccion}</td>`+
                `<td>${value.estadocliente}</td>`+
                `<td><button type="button" class="btn btn-info btnactualizar" `+
                ` data-clienteid="${value.clienteid}" `+
                ` data-nombre="${value.nombre}" `+
                ` data-apellido="${value.apellido}" `+
                ` data-tipodocumento="${value.tipodocumento}" `+
                ` data-numerodocumento="${value.numerodocumento}" `+
                ` data-telefono="${value.telefono}" `+
                ` data-direccion="${value.direccion}" `+
                ` data-estadocliente="${value.estadocliente}">Actualizar</button></td></tr>`
                );
            });
        }
    });
}
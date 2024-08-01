$(document).on("click", "#btnagregar", function(){
    $("#txtnombre").val("")
    $("#txtapellido").val("")
    $("#txtemail").val("")
    $("#txtusuario").val("")
    $("#switchusuario").hide()
    $("#hddidusuario").val("0")
    $("#txtusuario").prop("readonly", false)
    $("#txtemail").prop("readonly", false)
    $("#divmensajepassword").show()
    $("#cbactivo").prop("checked", false)
    $("#btnenviar").hide()
    $("#modalNuevo").modal("show")
})

$(document).on("click", ".btnactualizar", function(){
    $.ajax({
        type: "GET",
        url: "/seguridad/usuario/"+$(this).attr("data-idusuario"),
        dataType: "json",
        success: function(resultado){
            $("#txtnombre").val(resultado.nombres)
            $("#txtapellido").val(resultado.apellidos)
            $("#txtemail").val(resultado.email)
            $("#txtemail").prop("readonly", true)
            $("#txtusuario").val(resultado.nomusuario)
            $("#txtusuario").prop("readonly", true)
            $("#switchusuario").show()
            $("#hddidusuario").val(resultado.idusuario)
            $("#divmensajepassword").hide()
            if(resultado.activo)
                $("#cbactivo").prop("checked", true)
            else $("#cbactivo").prop("checked", false)
            $("#btnenviar").show()
            $("#modalNuevo").modal("show")
        }
    })

})

$(document).on("click", "#btnguardar", function(){
    $.ajax({
        type: "POST",
        url: "/seguridad/usuario",
        contentType: "application/json",
        data: JSON.stringify({
            idusuario: $("#hddidusuario").val(),
            nombres: $("#txtnombre").val(),
            apellidos: $("#txtapellido").val(),
            email: $("#txtemail").val(),
            activo: $("#cbactivo").prop("checked"),
            nomusuario: $("#txtusuario").val()
        }),
        success: function(resultado){
            if(resultado.resultado){
                listarUsuarios()
            }
            alert(resultado.mensaje)
        }
    });
    $("#modalNuevo").modal("hide");
})

function listarUsuarios(){
    $.ajax({
        type: "GET",
        url: "/seguridad/usuario",
        dataType: "json",
        success: function(resultado){
            $("#tblusuarios > tbody").html("");
            $.each(resultado, function(index, value){
                $("#tblusuarios > tbody").append("<tr>"+
                `<td>${value.idusuario}</td>`+
                `<td>${value.nombres}</td>`+
                `<td>${value.apellidos}</td>`+
                `<td>${value.email}</td>`+
                `<td>${value.activo}</td>`+
                `<td><button type="button" class="btn btn-info btnactualizar" `+
                ` data-idusuario="${value.idusuario}">Actualizar`+
                `</button></td></tr>`)

            })
        }
    })
}
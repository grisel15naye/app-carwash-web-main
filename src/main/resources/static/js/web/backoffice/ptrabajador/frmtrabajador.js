$(document).on("click", "#btnagregar", function(){
    $("#txtnombre").val("");
    $("#txtapellido").val("");
    $("#txttipodocumento").val("");
    $("#txtnumerodocumento").val("");
    $("#cbosede").empty();
    listarTrabSede(0)
    $("#txttelefono").val("");
    $("#txtdireccion").val("");
    $("#txtsalario").val("");
    $("#txtfechacontratacion").val("");
    $("#switchtrabajador").hide();
    $("#cbestadotrabajador").prop("checked", false);
    $("#hddcodtrab").val("0");
    $("#modaltrabajador").modal("show");
});

$(document).on("click", ".btnactualizar", function(){
    $("#txtnombre").val($(this).attr("data-trabnombre"));
    $("#txtapellido").val($(this).attr("data-trabapellido"));
    $("#txttipodocumento").val($(this).attr("data-trabtipodocumento"));
    $("#txtnumerodocumento").val($(this).attr("data-trabnumerodocumento"));
    $("#cbosede").empty();
    listarTrabSede($(this).attr("data-trabsede"));
    $("#txttelefono").val($(this).attr("data-trabtelefono"));
    $("#txtdireccion").val($(this).attr("data-trabdireccion"));
    $("#txtsalario").val($(this).attr("data-trabsalario"));
    $("#txtfechacontratacion").val($(this).attr("data-trabfechacontratacion"));
    $("#switchtrabajador").show();
    if ($(this).attr("data-trabestado") === "true"){
        $("#cbestadotrabajador").prop("checked", true);
    } else {
        $("#cbestadotrabajador").prop("checked", false);
    }
    $("#hddcodtrab").val($(this).attr("data-trabcod"));
    $("#modaltrabajador").modal("show");
});

$(document).on("click", "#btnguardar", function(){
    $.ajax({
        type: "POST",
        url: "/trabajadores/registrar",
        contentType: "application/json",
        data: JSON.stringify({
            trabajadorid: $("#hddcodtrab").val(),
            nombre: $("#txtnombre").val(),
            apellido: $("#txtapellido").val(),
            tipodocumento: $("#txttipodocumento").val(),
            numerodocumento: $("#txtnumerodocumento").val(),
            sedeid: $("#cbosede").val(),
            telefono: $("#txttelefono").val(),
            direccion: $("#txtdireccion").val(),
            salario: $("#txtsalario").val(),
            fechacontratacion: $("#txtfechacontratacion").val(),
            estadotrab: $("#cbestadotrabajador").prop("checked")
        }),
        success: function(resultado){
            if(resultado.resultado){
                listarTrabajador();
            }
            alert(resultado.mensaje);
        }
    });
    $("#modaltrabajador").modal("hide");
});

function listarTrabajador(){
    $.ajax({
        type: "GET",
        url: "/trabajadores/listar",
        dataType: "json",
        success: function(resultado){
            $("#tbltrabajador > tbody").html("");
            $.each(resultado, function(index, value){
                $("#tbltrabajador > tbody").append("<tr>"+
                `<td>${value.trabajadorid}</td>`+
                `<td>${value.nombre}</td>`+
                `<td>${value.apellido}</td>`+
                `<td>${value.tipodocumento }</td>`+
                `<td>${value.numerodocumento}</td>`+
                `<td>${value.nombresede}</td>`+
                `<td>${value.telefono}</td>`+
                `<td>${value.direccion}</td>`+
                `<td>${value.salario}</td>`+
                `<td>${value.fechacontratacion}</td>`+
                `<td>${value.estadotrab}</td>`+
                `<td><button type="button" class="btn btn-info btnactualizar" `+
                ` data-trabcod="${value.trabajadorid}" `+
                ` data-trabnombre="${value.nombre}" `+
                ` data-trabapellido="${value.apellido}" `+
                ` data-trabtipodocumento="${value.tipodocumento}" `+
                ` data-trabnumerodocumento="${value.numerodocumento}" `+
                ` data-trabsede="${value.sedeid}" `+
                ` data-trabtelefono="${value.telefono}" `+
                ` data-trabdireccion="${value.direccion}" `+
                ` data-trabsalario="${value.salario}" `+
                ` data-trabfechacontratacion="${value.fechacontratacion}" `+
                ` data-trabestadotrab="${value.estadotrab}">Actualizar</button></td></tr>`
                );
            });
        }
    });
}

function listarTrabSede(idsed){
    $.ajax({
    type: "GET",
    url: "/sedes/listar",
    dataType: "json",
    success: function(resultado){
        $.each(resultado, function(index, value){
            $("#cbosede").append(
            `<option value="${value.sedeid}">${value.nombresede}</option>`
            )
        });
    }
    });
}




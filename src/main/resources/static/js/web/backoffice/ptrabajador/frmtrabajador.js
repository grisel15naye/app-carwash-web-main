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
    $("#cbestadotrab").prop("checked", true);
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
    $("#cbestadotrab").prop("checked", $(this).attr("data-trabestadotrab") === "true");
    $("#hddcodtrab").val($(this).attr("data-trabcod"));
    $("#modaltrabajador").modal("show");
});

$(document).on("click", "#btnguardar", function(){
    // Limpiar mensajes de error
    $(".invalid-feedback").text("");
    $(".form-control").removeClass("is-invalid");

    // Validaciones
    let isValid = true;

    const nombre = $("#txtnombre").val();
    const apellido = $("#txtapellido").val();
    const tipodocumento = $("#txttipodocumento").val();
    const numerodocumento = $("#txtnumerodocumento").val();
    const telefono = $("#txttelefono").val();

    if (!nombre) {
        $("#errorNombre").text("El nombre no debe ser nulo.");
        $("#txtnombre").addClass("is-invalid");
        isValid = false;
    }

    if (!apellido) {
        $("#errorApellido").text("El apellido no debe ser nulo.");
        $("#txtapellido").addClass("is-invalid");
        isValid = false;
    }

    if (!tipodocumento) {
        $("#errorTipoDocumento").text("Debe seleccionar un tipo de documento.");
        $("#txttipodocumento").addClass("is-invalid");
        isValid = false;
    } else {
        if (!numerodocumento) {
            $("#errorNumeroDocumento").text("El número de documento no debe ser nulo.");
            $("#txtnumerodocumento").addClass("is-invalid");
            isValid = false;
        } else {
            if (tipodocumento === "DNI" && numerodocumento.length !== 8) {
                $("#errorNumeroDocumento").text("El DNI debe tener 8 dígitos.");
                $("#txtnumerodocumento").addClass("is-invalid");
                isValid = false;
            } else if (tipodocumento === "RUC" && numerodocumento.length !== 11) {
                $("#errorNumeroDocumento").text("El RUC debe tener 11 dígitos.");
                $("#txtnumerodocumento").addClass("is-invalid");
                isValid = false;
            } else if (tipodocumento === "PASAPORTE" && numerodocumento.length !== 20) {
                $("#errorNumeroDocumento").text("El pasaporte debe tener 20 dígitos.");
                $("#txtnumerodocumento").addClass("is-invalid");
                isValid = false;
            }
        }
    }

    if (!telefono || telefono.length !== 9) {
        $("#errorTelefono").text("El teléfono debe tener 9 dígitos.");
        $("#txttelefono").addClass("is-invalid");
        isValid = false;
    }

    if (isValid) {
        // Enviar solicitud AJAX
        $.ajax({
            type: "POST",
            url: "/trabajadores/registrar",
            contentType: "application/json",
            data: JSON.stringify({
                trabajadorid: $("#hddcodtrab").val(),
                nombre: nombre,
                apellido: apellido,
                tipodocumento: tipodocumento,
                numerodocumento: numerodocumento,
                sedeid: $("#cbosede").val(),
                telefono: telefono,
                direccion: $("#txtdireccion").val(),
                salario: $("#txtsalario").val(),
                fechacontratacion: $("#txtfechacontratacion").val(),
                estadotrab: $("#cbestadotrab").prop("checked")
            }),
            success: function(resultado){
                if(resultado.resultado){
                    listarTrabajador();
                }
                alert(resultado.mensaje);
            }
        });
        $("#modaltrabajador").modal("hide");
    }
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
                `<td>${value.estadotrab ? 'activo' : 'inactivo'}</td>`+
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
$(document).ready(function() {
    // Cargar Tipo de Servicios
    $.ajax({
        url: '/tipo-servicio/listar',
        method: 'GET',
        success: function(response) {
            const tableBody = $('#tbltservicio tbody');
            tableBody.empty();

            response.forEach(servicio => {
                const precioTotal = servicio.acciones.reduce((total, accion) => total + accion.precio, 0);

                const row = `<tr>
                    <td>${servicio.tiposervicioid}</td>
                    <td>${servicio.descripciontps}</td>
                    <td>${servicio.tipovehiculo}</td>
                    <td>${precioTotal}</td>
                    <td>${servicio.estadotps ? 'Activo' : 'Inactivo'}</td>
                    <td>
                        <button type="button" class="btn btn-secondary btnver"
                                data-bs-toggle="modal" data-bs-target="#modalVerAcciones"
                                data-acciones='${JSON.stringify(servicio.acciones)}'>Ver</button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-info btnactualizar"
                                data-bs-toggle="modal" data-bs-target="#modalAcciones"
                                data-tiposervicioid="${servicio.tiposervicioid}"
                                data-descripcion="${servicio.descripciontps}"
                                data-tipovehiculo="${servicio.tipovehiculo}"
                                data-estadotps="${servicio.estadotps}"
                                data-acciones='${JSON.stringify(servicio.acciones)}'>Actualizar</button>
                    </td>
                </tr>`;
                tableBody.append(row);
            });
        },
        error: function(error) {
            alert('Error al cargar la lista de Tipo de Servicios');
        }
    });

    // Manejo del botón "Ver" en el modal
    $(document).on('click', '.btnver', function() {
        const acciones = $(this).data('acciones');
        const $tblaccionesbody = $('#tblaccionesbody');
        $tblaccionesbody.empty();

        if (acciones) {
            acciones.forEach(accion => {
                const estadoAccion = accion.estadoacc ? 'Activo' : 'Inactivo';
                const row = `
                    <tr>
                        <td>${accion.accionesid}</td>
                        <td>${accion.descripcion}</td>
                        <td>${accion.precio}</td>
                        <td>${estadoAccion}</td>
                    </tr>`;
                $tblaccionesbody.append(row);
            });
        } else {
            $tblaccionesbody.append('<tr><td colspan="4">No hay acciones disponibles</td></tr>');
        }

        $('#modalVerAcciones').modal('show');
    });

    // Manejo del botón "Guardar" en el modal de agregar
    $('#btnGuardarAgregar').click(function() {
        const descripcion = $('#txtAgregarDescripcion').val();
        const tipoVehiculo = $('#txtAgregarTipoVehiculo').val();
        const estado = $('#cbAgregarEstado').is(':checked');
        const accionesSeleccionadas = [];

        $('#tblAgregarAccionesBody input[type="checkbox"]:checked').each(function() {
            accionesSeleccionadas.push($(this).val());
        });

        if (descripcion.trim() === '' || tipoVehiculo.trim() === '' || accionesSeleccionadas.length === 0) {
            alert('Por favor, complete todos los campos y seleccione al menos una acción.');
            return;
        }

        const data = {
            descripciontps: descripcion,
            tipovehiculo: tipoVehiculo,
            estadotps: estado,
            acciones: accionesSeleccionadas
        };

        $.ajax({
            url: '/tipo-servicio/guardar',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function(response) {
                $('#modalAgregar').modal('hide');
                alert('Tipo de Servicio agregado exitosamente');
                location.reload();
            },
            error: function(error) {
                alert('Error al guardar el Tipo de Servicio');
            }
        });
    });

    // Manejo del botón "Actualizar"
    $(document).on('click', '.btnactualizar', function() {
        const tiposervicioid = $(this).data('tiposervicioid');
        const descripcion = $(this).data('descripcion');
        const tipoVehiculo = $(this).data('tipovehiculo');
        const estadotps = $(this).data('estadotps');
        const acciones = $(this).data('acciones');

        $('#txtdescripcion').val(descripcion);
        $('#txtTipoVehiculo').val(tipoVehiculo);
        $('#cbestadoacc').prop('checked', estadotps);
        $('#hddcodacciones').val(tiposervicioid);

        // Cargar acciones actuales en el modal de actualización
        const $tblAccionesActualizar = $('#tblAccionesActualizar tbody');
        $tblAccionesActualizar.empty();

        if (acciones) {
            acciones.forEach(accion => {
                const estadoAccion = accion.estadoacc ? 'Activo' : 'Inactivo';
                const row = `
                    <tr>
                        <td>${accion.accionesid}</td>
                        <td>${accion.descripcion}</td>
                        <td>${accion.precio}</td>
                        <td>${estadoAccion}</td>
                        <td><button type="button" class="btn btn-danger btnEliminarAccion" data-id="${accion.accionesid}">Eliminar</button></td>
                    </tr>`;
                $tblAccionesActualizar.append(row);
            });
        } else {
            $tblAccionesActualizar.append('<tr><td colspan="5">No hay acciones disponibles</td></tr>');
        }

        // Cargar nuevas acciones disponibles
        $.ajax({
            url: '/acciones/listar', // Cambia la URL si es diferente
            method: 'GET',
            success: function(response) {
                const $tblNuevasAccionesBody = $('#tblNuevasAccionesBody');
                $tblNuevasAccionesBody.empty();

                response.forEach(accion => {
                    // Evitar mostrar acciones ya asociadas
                    const yaAsociada = acciones.some(a => a.accionesid === accion.accionesid);
                    if (!yaAsociada) {
                        const estadoAccion = accion.estadoacc ? 'Activo' : 'Inactivo';
                        const row = `
                            <tr>
                                <td><input type="checkbox" value="${accion.accionesid}"></td>
                                <td>${accion.accionesid}</td>
                                <td>${accion.descripcion}</td>
                                <td>${accion.precio}</td>
                                <td>${estadoAccion}</td>
                            </tr>`;
                        $tblNuevasAccionesBody.append(row);
                    }
                });
            },
            error: function(error) {
                console.error('Error al cargar las acciones:', error);
                alert('Error al cargar las acciones disponibles');
            }
        });
    });

    $('#btnGuardarCambios').click(function() {
        const tiposervicioid = $('#hddcodacciones').val();
        const descripcion = $('#txtdescripcion').val();
        const tipoVehiculo = $('#txtTipoVehiculo').val();
        const estado = $('#cbestadoacc').is(':checked');

        const acciones = [];

        // Obtener las acciones actuales
        $('#tblAccionesActualizar tbody tr').each(function() {
            const id = $(this).find('td').eq(0).text();
            acciones.push(parseInt(id));
        });

        // Obtener las nuevas acciones seleccionadas
        $('#tblNuevasAccionesBody input[type="checkbox"]:checked').each(function() {
            acciones.push(parseInt($(this).val()));
        });

        const data = {
            tiposervicioid: tiposervicioid,
            descripciontps: descripcion,
            tipovehiculo: tipoVehiculo,
            estadotps: estado,
            acciones: acciones
        };

        $.ajax({
            url: '/tipo-servicio/actualizar',
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function(response) {
                $('#modalAcciones').modal('hide');
                alert('Tipo de Servicio actualizado exitosamente');
                location.reload();
            },
            error: function(error) {
                alert('Error al actualizar el Tipo de Servicio');
            }
        });
    });

    // Cargar las acciones disponibles cuando se abre el modal de agregar
    $('#btnagregar').click(function() {
        $.ajax({
            url: '/acciones/listar',
            method: 'GET',
            success: function(response) {
                const $tblAgregarAccionesBody = $('#tblAgregarAccionesBody');
                $tblAgregarAccionesBody.empty();

                response.forEach(accion => {
                    const estadoAccion = accion.estadoacc ? 'Activo' : 'Inactivo';
                    const row = `
                        <tr>
                            <td><input type="checkbox" value="${accion.accionesid}"></td>
                            <td>${accion.accionesid}</td>
                            <td>${accion.descripcion}</td>
                            <td>${accion.precio}</td>
                            <td>${estadoAccion}</td>
                        </tr>`;
                    $tblAgregarAccionesBody.append(row);
                });
            },
            error: function(error) {
                console.error('Error al cargar las acciones:', error);
                alert('Error al cargar las acciones disponibles');
            }
        });
    });
});
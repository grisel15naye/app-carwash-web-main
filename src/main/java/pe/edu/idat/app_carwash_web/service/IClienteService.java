package pe.edu.idat.app_carwash_web.service;

import pe.edu.idat.app_carwash_web.model.bd.Cliente;

import java.util.List;

public interface IClienteService {
    List<Cliente> listarCliente();
    Cliente guardarCliente (Cliente cliente);
    Cliente obtenerCliente (Integer idcliente);
}

package pe.edu.idat.app_carwash_web.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pe.edu.idat.app_carwash_web.model.bd.Cliente;
import pe.edu.idat.app_carwash_web.repository.ClienteRepository;

import java.util.List;

@Service
@AllArgsConstructor
public class ClienteService implements IClienteService{
    private ClienteRepository clienteRepository;

    @Override
    public List<Cliente> listarCliente() {
        return clienteRepository.findAll();
    }

    @Override
    public Cliente guardarCliente(Cliente cliente) {return clienteRepository.save(cliente);}

    @Override
    public Cliente obtenerCliente(Integer idcliente) {
        return clienteRepository.findById(idcliente).orElse(null);
    }

}



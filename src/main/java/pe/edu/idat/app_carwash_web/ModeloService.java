package pe.edu.idat.app_carwash_web;

import pe.edu.idat.app_carwash_web.model.bd.Marca;
import pe.edu.idat.app_carwash_web.model.bd.Modelo;
import pe.edu.idat.app_carwash_web.model.bd.dto.ModeloDto;
import pe.edu.idat.app_carwash_web.repository.ModeloRepository;
import pe.edu.idat.app_carwash_web.service.IModeloService;

import java.util.ArrayList;
import java.util.List;

public class ModeloService implements IModeloService {
    private ModeloRepository modeloRepository;

    @Override
    public List<ModeloDto> listarModelo() {
        List<ModeloDto> modeloDtoList=new ArrayList<>();
        for (Modelo mode:
                modeloRepository.findAll()){
            ModeloDto modeloDto=ModeloDto.builder()
                    .modeloid(mode.getModeloid())
                    .modeloinfo(mode.getModeloinfo())
                    .marcaid(mode.getMarca().getMarcaid())
                    .marcainfo(mode.getMarca().getMarcainfo())
                    .build();
            modeloDtoList.add(modeloDto);
        }
        return modeloDtoList;
    }

    @Override
    public void guardarModelo(ModeloDto modelo) {
        if (modelo.getModeloid()>0){
            modeloRepository.actualizarModelo(
                    modelo.getModeloid(),
                    modelo.getModeloinfo(),
                    modelo.getMarcaid()
            );
        }else{
            Modelo nuevoModelo=new Modelo();
            nuevoModelo.setModeloinfo(modelo.getModeloinfo());
            Marca marca=new Marca();
            marca.setMarcaid(modelo.getMarcaid());
            nuevoModelo.setMarca(marca);

        }
    }

    @Override
    public Modelo obtenerModelo(Integer idmodelo) {
        return modeloRepository.findById(idmodelo).orElse(null);
    }
}

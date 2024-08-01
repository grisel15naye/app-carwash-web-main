package pe.edu.idat.app_carwash_web.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pe.edu.idat.app_carwash_web.model.bd.Programacion;
import pe.edu.idat.app_carwash_web.model.bd.Sede;
import pe.edu.idat.app_carwash_web.model.bd.dto.ProgramacionDto;
import pe.edu.idat.app_carwash_web.repository.ProgramacionRepository;

import java.util.ArrayList;
import java.util.List;
@AllArgsConstructor
@Service
public class ProgramacionService implements IProgramacionService {
    private ProgramacionRepository programacionRepository;

    @Override
    public List<ProgramacionDto> listarProgramacion() {
        List<ProgramacionDto> programacionDtoList=new ArrayList<>();
        for (Programacion prog:
                programacionRepository.findAll()){
            ProgramacionDto programacionDto=ProgramacionDto.builder()
                    .programacionid(prog.getProgramacionid())
                    .sedeid(prog.getSede().getSedeid())
                    .nombresede(prog.getSede().getNombresede())
                    .fecha(prog.getFecha())
                    .horaprogramada(prog.getHoraprogramada())
                    .build();
            programacionDtoList.add(programacionDto);
        }
        return programacionDtoList;
    }

    @Override
    public void guardarProgramacion(ProgramacionDto programacion) {
        if (programacion.getProgramacionid()>0){
            programacionRepository.actualizarProgramacion(
                    programacion.getProgramacionid(),
                    programacion.getSedeid(),
                    programacion.getFecha(),
                    programacion.getHoraprogramada()
            );
        }else{
            Programacion nuevoProgramacion=new Programacion();
            Sede sede =new Sede();
            sede.setSedeid(programacion.getSedeid());
            nuevoProgramacion.setSede(sede);
            nuevoProgramacion.setFecha(programacion.getFecha());
            nuevoProgramacion.setHoraprogramada(programacion.getHoraprogramada());
            programacionRepository.save(nuevoProgramacion);


        }

    }
    @Override
    public Programacion obtenerProgramacion(Integer idprogramacion) {
        return programacionRepository.findById(idprogramacion).orElse(null);}
}

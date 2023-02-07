import { Router } from "express";
import { 
    getHorariosEmpleados, 
    registrarEntrada, 
    registrarSalida, 
    ObtenerAsistenciasPorFecha,
    getValidacionAsistencia
} from "../controllers/asistenciaController";

const router = Router();

router.get('/asistencia', getHorariosEmpleados);
router.get('/asistencia/today',getValidacionAsistencia);
router.post('/asistencia',registrarEntrada);
router.put('/asistencia', registrarSalida);
router.get('/asistencia/:FechaInicial/:FechaFinal', ObtenerAsistenciasPorFecha);
export default router;
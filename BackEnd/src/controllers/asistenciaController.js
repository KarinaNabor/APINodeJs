import {getConnection, sql} from '../database/connection';

export const getHorariosEmpleados=async (req, res)=>{
    const pool =await getConnection();
    const result=await pool.request().execute('EmpleadosHorario');
    res.json(result.recordset);
};

export const getValidacionAsistencia=async (req, res)=>{
    const pool =await getConnection();
    const result=await pool.request().execute('ValidarAsistencia');
    res.json(result.recordset);
};

export const registrarEntrada=async (req, res)=>{
    const { EmpleadoId } = req.body;
    if (EmpleadoId == null) {
        return res.status(400).json({ msg: "Bad Request." });
      }
    try{
        const pool = await getConnection();
        await pool.request().input("EmpleadoId", sql.Int, EmpleadoId).execute('RegistroEntrada');

        res.json({ EmpleadoId });
    }
    catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const registrarSalida = async (req, res)=>{
    const { EmpleadoId } = req.body;

    if (EmpleadoId==null) {
        return res.status(400).json({ msg: "Bad Request."});
    }

    try {
        const pool = await getConnection();
        await pool.request().input("EmpleadoId", sql.Int, EmpleadoId).execute('RegistroSalida');

        res.json({ EmpleadoId });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const ObtenerAsistenciasPorFecha = async (req, res) => {

  try {
    const pool = await getConnection();
console.log(req);
    const result = await pool.request()
    .input("FechaInicial", sql.Date, req.params.FechaInicial)
    .input("FechaFinal", sql.Date, req.params.FechaFinal )
    .execute('EntradasSalidasPorFecha');
    return res.json(result.recordset);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
  };


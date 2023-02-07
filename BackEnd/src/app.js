import express from "express";
import config from "./config";
import asistenciaRoutes from './routes/asistencia.routes'
import cors from "cors";
import morgan from "morgan";

const app= express();

//settings 
app.set('port', config.port);

//middleware
app.use(cors());
app.use(morgan("dev"));
app.use(express.json());
app.use(express.urlencoded({extended:false}));

app.use(asistenciaRoutes)
export default app;
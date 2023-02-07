import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AsistenciaComponent } from './asistencia.component';
import { EntradaSalidaComponent } from './entrada-salida/entrada-salida.component';
import { HomeComponent } from './home/home.component';
import { HorarioEmpleadosComponent } from './horario-empleados/horario-empleados.component';

const routes: Routes = [{ path: '', component: AsistenciaComponent, children:[
  {path:'',component:HomeComponent},
  {path:'entrada-salida',component:EntradaSalidaComponent},
  {path:'horarios',component:HorarioEmpleadosComponent}
] },];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AsistenciaRoutingModule { }

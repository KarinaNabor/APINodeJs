import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AsistenciaRoutingModule } from './asistencia-routing.module';
import { HorarioEmpleadosComponent } from './horario-empleados/horario-empleados.component';
import { HeaderComponent } from './header/header.component';
import { HomeComponent } from './home/home.component';
import { EntradaSalidaComponent } from './entrada-salida/entrada-salida.component';
import {MatTableModule} from '@angular/material/table';
import {MatButtonModule} from '@angular/material/button';


@NgModule({
  declarations: [
    HorarioEmpleadosComponent,
    HeaderComponent,
    HomeComponent,
    EntradaSalidaComponent
  ],
  imports: [
    CommonModule,
    AsistenciaRoutingModule,
    MatTableModule,
    MatButtonModule
  ],
  exports:[
    HeaderComponent
  ]
})
export class AsistenciaModule { }

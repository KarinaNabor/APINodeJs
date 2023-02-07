import { Component, OnInit } from '@angular/core';
import { Turno } from 'src/app/models/Turno';
import { TurnosService } from 'src/app/services/turnos.service';

@Component({
  selector: 'app-horario-empleados',
  templateUrl: './horario-empleados.component.html',
  styleUrls: ['./horario-empleados.component.css']
})
export class HorarioEmpleadosComponent implements OnInit {
  public listTurnos: Array<Turno> = []; 
  displayedColumns: string[] = ['id', 'nombre', 'apellidos', 'turno', 'horaEntrada', 'horaSalida'];
  dataSource = this.listTurnos;

  constructor(private turnosBack:TurnosService){}

  ngOnInit(): void {
    this.getTurnosEmpleadosList();
  }

  getTurnosEmpleadosList(){
    this.turnosBack.getEmpleadosAsistencia().subscribe(response=>
      this.listTurnos=response);
  }
}

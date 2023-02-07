import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { TurnoModelo } from 'src/app/models/TurnoModelo';
import { TurnosService } from 'src/app/services/turnos.service';

@Component({
  selector: 'app-entrada-salida',
  templateUrl: './entrada-salida.component.html',
  styleUrls: ['./entrada-salida.component.css']
})
export class EntradaSalidaComponent implements OnInit{
  asistencia!: FormGroup;
  public listTurnos: Array<TurnoModelo> = []; 
  displayedColumns: string[] = ['nombre', 'fechaEntrada', 'fechaSalida'];
  dataSource = this.listTurnos;

  constructor(private _fb: FormBuilder, private turnosBack:TurnosService){}
  ngOnInit(): void {
    this.getTurnos();
  }

  createForm() {
    this.asistencia = this._fb.group({
      id: [0, [Validators.required, Validators.min(1)]]
    });
  }

  getTurnos(){
    this.turnosBack.getValidacionAsistencia().subscribe(response=>
      this.listTurnos=response);
  }

  registrarEntrada(idEmpleado:any){
    this.turnosBack.registrarEntrada(idEmpleado).subscribe(response=>
      console.log("OK"));
    this.getTurnos();
  }

  registrarSalida(idEmpleado:any){
    this.turnosBack.registrarSalida(idEmpleado).subscribe(response=>
      console.log("OK"));
    this.getTurnos();
  }
}

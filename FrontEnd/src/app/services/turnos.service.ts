import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment.development';
import { Turno } from '../models/Turno';
import { TurnoModelo } from '../models/TurnoModelo';
import { Constants } from '../shared/constants';

@Injectable({
  providedIn: 'root'
})
export class TurnosService {
  apiURL = environment.apiURL;
   httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
      'accept': '*/*'
    })
  };
  constructor(private http:HttpClient) { }

  public getEmpleadosAsistencia():Observable<Turno[]>{   
    return this.http.get<Turno[]>(this.apiURL+Constants.GET_TURNOS_SERVICE, this.httpOptions); 
  }

  public getValidacionAsistencia():Observable<TurnoModelo[]>{   
    return this.http.get<TurnoModelo[]>(this.apiURL+Constants.GET_VALIDACION_SERVICE, this.httpOptions); 
  }

  public registrarEntrada(idEmpleado:any):Observable<any>{   
    debugger;
    return this.http.post<any>(this.apiURL+Constants.POST_ASISTENCIA, {EmpleadoId: idEmpleado}, this.httpOptions); 
  }

  public registrarSalida(idEmpleado:any):Observable<any>{   
    return this.http.put<any>(this.apiURL+Constants.PUT_ASISTENCIA, {EmpleadoId: idEmpleado}, this.httpOptions); 
  }
}
